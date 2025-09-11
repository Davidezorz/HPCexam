/* -*- Mode: C; c-basic-offset:4 ; indent-tabs-mode:nil ; -*- */
/*
 * See COPYRIGHT in top-level directory.
 */


#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <time.h>
#include <math.h>

#include <omp.h>
#include <mpi.h>

#include <immintrin.h>  // vectorization 

#define NORTH 0
#define SOUTH 1
#define EAST  2
#define WEST  3

#define SEND 0
#define RECV 1

#define OLD 0
#define NEW 1

#define _x_ 0
#define _y_ 1

typedef unsigned int uint;

typedef uint    vec2_t[2];
typedef double *restrict buffers_t[4];

typedef struct {
    double   * restrict data;
    vec2_t     size;
} plane_t;



extern int inject_energy ( const int      ,
                           const int      ,
                           const vec2_t  *,
                           const double   ,
                                 plane_t *,
                           const vec2_t   );


extern int update_plane ( const int      ,
                          const vec2_t   ,
                          const plane_t *,
                                plane_t * );

extern int update_center ( const int     , 
                          const vec2_t   ,         // the grid of MPI tasks
                          const plane_t *,
                                plane_t *);

extern int update_NORTH ( const int     , 
                          const vec2_t   ,
                          const plane_t *,
                                plane_t *);

extern int update_SOUTH ( const int     , 
                          const vec2_t   ,
                          const plane_t *,
                                plane_t *);

extern int update_EAST ( const int     , 
                         const vec2_t   ,
                         const plane_t *,
                                plane_t *);

extern int update_WEST ( const int      , 
                         const vec2_t   ,
                         const plane_t *,
                                plane_t *);

extern int update_NORTH_SOUTH( const int, 
                               const vec2_t,
                               const plane_t *,
                                     plane_t *);

extern int update_WEST_EAST( const int, 
                             const vec2_t,
                             const plane_t *,
                             const buffers_t *,
                             const int *,
                                   plane_t *
                              );





extern int get_total_energy( plane_t *,
                             double  * );

int initialize ( MPI_Comm *,
                 int       ,
                 int       ,
                 int       ,
                 char    **,
                 vec2_t   *,
                 vec2_t   *,
                 int      *,
                 int      *,
                 int      *,
                 int      *,
                 int      *,
                 int      *,
                 vec2_t  **,
                 double   *,
                 plane_t  *,
                 buffers_t * );


int memory_release (plane_t * plane, buffers_t * buffers);


int output_energy_stat ( int      ,
                         plane_t *,
                         double   ,
                         int      ,
                         MPI_Comm *);


int dump (  const double *data,
            const uint size[2],
            const char *filename);















/*──────────────────────────────────────────────────────────────╮
│                         inject_energy                         │
╰──────────────────────────────────────────────────────────────*/


inline int inject_energy ( const int      periodic,
                           const int      Nsources,
                           const vec2_t  *Sources,
                           const double   energy,
                                 plane_t *plane,
                           const vec2_t   N
                           )
{
    const uint register sizex  = plane->size[_x_]+2;
    const uint register sizey  = plane->size[_y_]+2;
    const uint register fsizex = plane->size[_x_];
    const uint register fsizey = plane->size[_y_];
    double * restrict data = plane->data;
    
   #define IDX( i, j ) ( (j)*sizex + (i) )


    if (periodic)
    {
        const uint register Nx1 = (N[_x_] == 1);
        const uint register Ny1 = (N[_y_] == 1);
#pragma omp parallel for schedule(static)
        for (int s = 0; s < Nsources; s++)
        {
            int x = Sources[s][_x_];
            int y = Sources[s][_y_];
            
            data[ IDX(x,y) ] += energy;

            // propagate the boundaries
            data[IDX(sizex - 1, y)] += energy*(x == 1)     *Nx1;
            data[IDX(0,         y)] += energy*(x == fsizex)*Nx1;


            data[IDX(x, fsizey + 1)] += energy*(y == 1)     *Ny1;
            data[IDX(x, 0)]          += energy*(y == fsizey)*Ny1;
        }
    }
    else 
    {
#pragma omp parallel for schedule(static)
        for (int s = 0; s < Nsources; s++)
        {
            int x = Sources[s][_x_];
            int y = Sources[s][_y_];
            
            data[ IDX(x,y) ] += energy;
        }
    }


 #undef IDX
    
  return 0;
}



/*──────────────────────────────────────────────────────────────╮
│                       update_center AVX2                      │
╰──────────────────────────────────────────────────────────────*/


/*center update with SIMD instruction*/
 
inline int update_centerAVX2(const int      periodic,
                         const vec2_t   N,
                         const plane_t *restrict oldplane,
                               plane_t *restrict newplane)
{
    const uint fxsize = oldplane->size[_x_] + 2;
    const uint xsize  = oldplane->size[_x_];
    const uint ysize  = oldplane->size[_y_];

    double *restrict old = oldplane->data;
    double *restrict new = newplane->data;

    __m256d half = _mm256_set1_pd(0.5);
    __m256d quarter_half = _mm256_set1_pd(0.5 * 0.25); // (1/4)*0.5 = 0.125

    #pragma omp parallel for
    for (uint j = 2; j < ysize; j++) {
        uint row = j * fxsize;

        // Vectorized loop (process 4 elements per step)
        uint i;
        for (i = 2; i + 7 + 8 < xsize; i += 16)   // 3*8 doubles per iteration
        {
            uint idx1 = row + i;
            uint idx2 = row + i + 4;
            uint idx3 = row + i + 4 + 4;
            uint idx4 = row + i + 4 + 4 + 4;


            //__builtin_prefetch(&old[idx1 -fxsize + 16 + 16], 0, 1);
            //__builtin_prefetch(&old[idx1 + 16 + 16], 0, 1);
            //__builtin_prefetch(&old[idx1 + fxsize + 16 + 16], 0, 1);
            __builtin_prefetch(&new[idx1 + 16 + 16], 1, 1);

            // ----- vector 1 -----
            __m256d center1 = _mm256_loadu_pd(&old[idx1]);
            __m256d left1   = _mm256_loadu_pd(&old[idx1 - 1]);
            __m256d right1  = _mm256_loadu_pd(&old[idx1 + 1]);
            __m256d sum_i1  = _mm256_add_pd(left1, right1);
            __m256d up1     = _mm256_loadu_pd(&old[idx1 - fxsize]);
            __m256d down1   = _mm256_loadu_pd(&old[idx1 + fxsize]);
            __m256d sum_j1  = _mm256_add_pd(up1, down1);
            __m256d result1 = _mm256_mul_pd(center1, half);
            __m256d neighbor1 = _mm256_mul_pd(_mm256_add_pd(sum_i1, sum_j1), quarter_half);
            result1 = _mm256_add_pd(result1, neighbor1);

            // ----- vector 2 -----
            __m256d center2 = _mm256_loadu_pd(&old[idx2]);
            __m256d left2   = _mm256_loadu_pd(&old[idx2 - 1]);
            __m256d right2  = _mm256_loadu_pd(&old[idx2 + 1]);
            __m256d sum_i2  = _mm256_add_pd(left2, right2);
            __m256d up2     = _mm256_loadu_pd(&old[idx2 - fxsize]);
            __m256d down2   = _mm256_loadu_pd(&old[idx2 + fxsize]);
            __m256d sum_j2  = _mm256_add_pd(up2, down2);
            __m256d result2 = _mm256_mul_pd(center2, half);
            __m256d neighbor2 = _mm256_mul_pd(_mm256_add_pd(sum_i2, sum_j2), quarter_half);
            result2 = _mm256_add_pd(result2, neighbor2);

            // ----- vector 3 -----
            __m256d center3 = _mm256_loadu_pd(&old[idx3]);
            __m256d left3   = _mm256_loadu_pd(&old[idx3 - 1]);
            __m256d right3  = _mm256_loadu_pd(&old[idx3 + 1]);
            __m256d sum_i3  = _mm256_add_pd(left3, right3);
            __m256d up3     = _mm256_loadu_pd(&old[idx3 - fxsize]);
            __m256d down3   = _mm256_loadu_pd(&old[idx3 + fxsize]);
            __m256d sum_j3  = _mm256_add_pd(up3, down3);
            __m256d result3 = _mm256_mul_pd(center3, half);
            __m256d neighbor3 = _mm256_mul_pd(_mm256_add_pd(sum_i3, sum_j3), quarter_half);
            result3 = _mm256_add_pd(result3, neighbor3);

            // ----- vector 4 -----
            __m256d center4 = _mm256_loadu_pd(&old[idx4]);
            __m256d left4   = _mm256_loadu_pd(&old[idx4 - 1]);
            __m256d right4  = _mm256_loadu_pd(&old[idx4 + 1]);
            __m256d sum_i4  = _mm256_add_pd(left4, right4);
            __m256d up4     = _mm256_loadu_pd(&old[idx4 - fxsize]);
            __m256d down4   = _mm256_loadu_pd(&old[idx4 + fxsize]);
            __m256d sum_j4  = _mm256_add_pd(up4, down4);
            __m256d result4 = _mm256_mul_pd(center4, half);
            __m256d neighbor4 = _mm256_mul_pd(_mm256_add_pd(sum_i4, sum_j4), quarter_half);
            result4 = _mm256_add_pd(result4, neighbor4);


            // store
            _mm256_storeu_pd(&new[idx1], result1);
            _mm256_storeu_pd(&new[idx2], result2);
            _mm256_storeu_pd(&new[idx3], result3);
            _mm256_storeu_pd(&new[idx4], result4);
        }

        // Cleanup for remaining elements (scalar)
        for (; i < xsize; i++) {
            uint idx = row + i;
            double result = old[idx] * 0.5;
            double sum_i  = old[idx - 1] + old[idx + 1];
            double sum_j  = old[idx - fxsize] + old[idx + fxsize];
            new[idx] = result + (sum_i + sum_j) * 0.125;
        }
    }

    return 0;
}



/*──────────────────────────────────────────────────────────────╮
│                         update_center                         │
╰──────────────────────────────────────────────────────────────*/

inline int update_center (const int      periodic, 
                          const vec2_t   N,         // the grid of MPI tasks
                          const plane_t *oldplane,
                                plane_t *newplane
                          )
    
{
    uint register fxsize = oldplane->size[_x_]+2;
    uint register fysize = oldplane->size[_y_]+2;
    
    uint register xsize = oldplane->size[_x_];
    uint register ysize = oldplane->size[_y_];
    
   #define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
#pragma omp parallel for simd schedule(static)
    for (uint j = 2; j < ysize; j++) {
#pragma GCC unroll 4
        for ( uint i = 2; i < xsize; i++) {
            double result = old[ IDX(i,j) ] * 0.5;
            double sum_i = old[IDX(i-1, j)] + old[IDX(i+1, j)];
            double sum_j = old[IDX(i, j-1)] + old[IDX(i, j+1)];

            result += (sum_i + sum_j) / 4 * 0.5;

            new[ IDX(i,j) ] = result;

        }
    }

    
 #undef IDX
  return 0;
}





inline int update_NORTH(const int      periodic, 
                        const vec2_t   N,
                        const plane_t *oldplane,
                              plane_t *newplane
                          )
{
    uint register fxsize = oldplane->size[_x_]+2;

    uint register xsize = oldplane->size[_x_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
    uint register j = 1;
#pragma omp parallel for schedule(static)
    for ( uint i = 1; i <= xsize; i++) {
        new[ IDX(i,j) ] =
            old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                      old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0;
    }

    
#undef IDX
    return 0;
}




inline int update_SOUTH(const int      periodic, 
                        const vec2_t   N,
                        const plane_t *oldplane,
                              plane_t *newplane
                          )
{
    uint register fxsize = oldplane->size[_x_]+2;

    uint register xsize = oldplane->size[_x_];
    uint register ysize = oldplane->size[_y_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
    uint register j = ysize;
#pragma omp parallel for schedule(static)
    for ( uint i = 1; i <= xsize; i++) {
        new[ IDX(i,j) ] =
            old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                      old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0;
    }

    
#undef IDX
    return 0;
}




inline int update_WEST( const int      periodic, 
                        const vec2_t   N,
                        const plane_t *oldplane,
                              plane_t *newplane
                          )
{
    uint register fxsize = oldplane->size[_x_]+2;
    
    uint register xsize = oldplane->size[_x_];
    uint register ysize = oldplane->size[_y_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
    uint register i = xsize;
#pragma omp parallel for schedule(static)
    for (uint j = 2; j < ysize; j++) {
        __builtin_prefetch(&old[IDX(i, j + 16)], 0, 1);  // prefetch for read
        __builtin_prefetch(&new[IDX(i, j + 16)], 1, 1);  // prefetch for write
        new[ IDX(i,j) ] =
            old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                      old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0;
    }

#undef IDX
    return 0;
}




inline int update_EAST( const int     periodic, 
                        const vec2_t   N,
                        const plane_t *oldplane,
                              plane_t *newplane
                          )
{
    uint register fxsize = oldplane->size[_x_]+2;

    uint register ysize = oldplane->size[_y_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
    uint register i = 1;
#pragma omp parallel for schedule(static)
    for (uint j = 2; j < ysize; j++) {
    __builtin_prefetch(&old[IDX(i, j + 4)], 0, 1);  // prefetch for read
    __builtin_prefetch(&new[IDX(i, j + 4)], 1, 1);  // prefetch for write
        new[ IDX(i,j) ] =
            old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                      old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0;
    }

#undef IDX
    return 0;
}




/*──────────────────────────────────────────────────────────────╮
│                       update NORTH SOUTH                      │
╰──────────────────────────────────────────────────────────────*/


inline int update_NORTH_SOUTH( const int      periodic, 
                               const vec2_t   N,
                               const plane_t *oldplane,
                                     plane_t *newplane
                                ) 
{
    uint register fxsize = oldplane->size[_x_]+2;
    uint register fysize = oldplane->size[_y_]+2;

    uint register ysize = oldplane->size[_y_];
    uint register xsize = oldplane->size[_x_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    

    uint register j_north = 1;
    uint register j_south = ysize;

    int prefetch = 8;

    if (periodic && (N[_y_] == 1))
    {
#pragma omp parallel for schedule(static)
        for (uint i = 1; i <= xsize; i++) 
        {
            double result_north = old[IDX(i,   j_north)  ] * 0.5;
            double sum_i_north  = old[IDX(i-1, j_north)  ] + old[IDX(i+1, j_north)];
            double sum_j_north  = old[IDX(i,   j_north-1)] + old[IDX(i,   j_north+1)];

            result_north += (sum_i_north + sum_j_north) / 4 * 0.5;

            double result_south = old[IDX(i,   j_south)  ] * 0.5;
            double sum_i_south  = old[IDX(i-1, j_south)  ] + old[IDX(i+1, j_south)  ];
            double sum_j_south  = old[IDX(i,   j_south-1)] + old[IDX(i,   j_south+1)];

            result_south += (sum_i_south + sum_j_south) / 4 * 0.5;

            //update
            new[ IDX(i, j_north) ] = result_north;
            new[ IDX(i, j_south) ] = result_south;


            new[ IDX(i, 0) ]         = new[ IDX(i, ysize) ];    // we propagate east edge on west halo
            new[ IDX(i, ysize + 1) ] = new[ IDX(i, 1)     ];    // we propagate west edge on east halo

        }
    }
    else
    {
#pragma omp parallel for schedule(static)
        for (uint i = 1; i <= xsize; i++) 
        {
            double result_north = old[IDX(i,   j_north)  ] * 0.5;
            double sum_i_north  = old[IDX(i-1, j_north)  ] + old[IDX(i+1, j_north)];
            double sum_j_north  = old[IDX(i,   j_north-1)] + old[IDX(i,   j_north+1)];

            result_north += (sum_i_north + sum_j_north) / 4 * 0.5;

            double result_south = old[IDX(i,   j_south)  ] * 0.5;
            double sum_i_south  = old[IDX(i-1, j_south)  ] + old[IDX(i+1, j_south)  ];
            double sum_j_south  = old[IDX(i,   j_south-1)] + old[IDX(i,   j_south+1)];

            result_south += (sum_i_south + sum_j_south) / 4 * 0.5;

            //update
            new[ IDX(i, j_north) ] = result_north;
            new[ IDX(i, j_south) ] = result_south;
        }

    }


#undef IDX
    return 0;
}






/*──────────────────────────────────────────────────────────────╮
│                        update WEST EAST                       │
╰──────────────────────────────────────────────────────────────*/

inline int update_WEST_EAST( const int        periodic, 
                             const vec2_t     N,
                             const plane_t   *oldplane,
                             const buffers_t *buffers,
                             const int       *neighbours,
                                   plane_t   *newplane
                              ) 

{
    uint register fxsize = oldplane->size[_x_]+2;
    uint register fysize = oldplane->size[_y_]+2;

    uint register ysize = oldplane->size[_y_];
    uint register xsize = oldplane->size[_x_];
    
#define IDX( i, j ) ( (j)*fxsize + (i) )


    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    

    uint register i_east = 1;
    uint register i_west = xsize;

    const uint register thereIsWest = neighbours[WEST] != MPI_PROC_NULL;
    const uint register thereIsEast = neighbours[EAST] != MPI_PROC_NULL;

    /**/
    if (thereIsWest )
    {
        old[IDX(i_east-1, 1)]     = buffers[RECV][WEST][0];
        old[IDX(i_east-1, ysize)] = buffers[RECV][WEST][ysize-1];
    }
    if (thereIsEast) 
    {   
        old[IDX(i_west+1, 1)]     = buffers[RECV][EAST][0];
        old[IDX(i_west+1, ysize)] = buffers[RECV][EAST][ysize-1];
    }
    
    const int prefetch = 8;


    if (periodic && (N[_x_] == 1))
    {
#pragma omp parallel for schedule(static)
#pragma omp unroll partial(8)
        for (uint j = 2; j < ysize; j++) 
        {
            __builtin_prefetch(&old[IDX(i_west, j + prefetch)], 0, 1);  // prefetch for read 
            __builtin_prefetch(&new[IDX(i_west, j + prefetch)], 1, 1);  // prefetch for write

            double value_west = thereIsWest ? buffers[RECV][WEST][j-1] : 0;
            double value_east = thereIsEast ? buffers[RECV][EAST][j-1] : 0; 
            

            double result_east = old[IDX(i_east,j)   ] * 0.5;
            double sum_i_east  = old[IDX(i_east-1, j)] + old[IDX(i_east+1, j)];  //value_west
            double sum_j_east  = old[IDX(i_east, j-1)] + old[IDX(i_east, j+1)];

            result_east += (sum_i_east + sum_j_east) / 4 * 0.5;

            double result_west = old[IDX(i_west,j)   ] * 0.5;
            double sum_i_west  = old[IDX(i_west-1, j)] +  old[IDX(i_west+1, j)];//value_east;
            double sum_j_west  = old[IDX(i_west, j-1)] + old[IDX(i_west, j+1)];

            result_west += (sum_i_west + sum_j_west) / 4 * 0.5;

            //update
            new[ IDX(i_east, j) ] = result_east;
            new[ IDX(i_west, j) ] = result_west;


            new[ IDX(0, j) ]       = new[ IDX(xsize, j) ];    // we propagate east edge on west halo
            new[ IDX(xsize+1, j) ] = new[ IDX(1, j)     ];    // we propagate west edge on east halo
        }
    }
    else
    {
#pragma omp parallel for schedule(static)
#pragma omp unroll partial(8)
        for (uint j = 2; j < ysize; j++) 
        {
            __builtin_prefetch(&old[IDX(i_west, j + prefetch)], 0, 1);  // prefetch for read 
            __builtin_prefetch(&new[IDX(i_west, j + prefetch)], 1, 1);  // prefetch for write

            double value_west= thereIsWest ? buffers[RECV][WEST][j-1] : 0;
            double value_east= thereIsEast ? buffers[RECV][EAST][j-1] : 0; 

            double result_east = old[IDX(i_east,j)   ] * 0.5;
            double sum_i_east  = value_west          + old[IDX(i_east+1, j)];
            double sum_j_east  = old[IDX(i_east, j-1)] + old[IDX(i_east, j+1)];

            result_east += (sum_i_east + sum_j_east) / 4 * 0.5;

            double result_west = old[IDX(i_west,j)   ] * 0.5;
            double sum_i_west  = old[IDX(i_west-1, j)] + value_east;
            double sum_j_west  = old[IDX(i_west, j-1)] + old[IDX(i_west, j+1)];

            result_west += (sum_i_west + sum_j_west) / 4 * 0.5;

            //update
            new[ IDX(i_east, j) ] = result_east;
            new[ IDX(i_west, j) ] = result_west;
        }

    }


#undef IDX
    return 0;
}




/*──────────────────────────────────────────────────────────────╮
│                          update_plane                         │
╰──────────────────────────────────────────────────────────────*/

inline int update_plane ( const int      periodic, 
                          const vec2_t   N,         // the grid of MPI tasks
                          const plane_t *oldplane,
                                plane_t *newplane
                          )
    
{
    uint register fxsize = oldplane->size[_x_]+2;
    uint register fysize = oldplane->size[_y_]+2;
    
    uint register xsize = oldplane->size[_x_];
    uint register ysize = oldplane->size[_y_];
    
   #define IDX( i, j ) ( (j)*fxsize + (i) )
    
    // HINT: you may attempt to
    //       (i)  manually unroll the loop
    //       (ii) ask the compiler to do it
    // for instance
    // #pragma GCC unroll 4
    //
    // HINT: in any case, this loop is a good candidate
    //       for openmp parallelization

    double * restrict old = oldplane->data;
    double * restrict new = newplane->data;
    
// export OMP_NUM_THREADS = 4
#pragma omp parallel for simd schedule(static)
    for (uint j = 1; j <= ysize; j++) {
#pragma GCC unroll 4
        for ( uint i = 1; i <= xsize; i++) {
            /*
            __builtin_prefetch(&old[IDX(i + 32,j    )], 0, 1);  // prefetch for read
            __builtin_prefetch(&new[IDX(i + 32,j    )], 1, 1);  // prefetch for write */
            // NOTE: (i-1,j), with a dynamic counter), so you can compare which one is cleaner?(i+1,j), (i,j-1) and (i,j+1) always exist even
            //       if this patch is at some border without periodic conditions;
            //       in that case it is assumed that the +-1 points are outside the
            //       plate and always have a value of 0, i.e. they are an
            //       "infinite sink" of heat
            
            // five-points stencil formula
            //
            // HINT : check the serial version for some optimization
            //


            new[ IDX(i,j) ] =
                old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                          old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0;
        }
    }

    if ( periodic )
        {
            if ( N[_x_] == 1 )
                {
                    // propagate the boundaries as needed
                    // check the serial version
                }
  
            if ( N[_y_] == 1 ) 
                {
                    // propagate the boundaries as needed
                    // check the serial version
                }
        }

    
 #undef IDX
  return 0;
}



inline int get_total_energy( plane_t *plane,
                             double  *energy )
/*
 * NOTE: this routine a good candiadate for openmp
 *       parallelization
 */
{

    const int register xsize = plane->size[_x_];
    const int register ysize = plane->size[_y_];
    const int register fsize = xsize+2;

    double * restrict data = plane->data;
    
   #define IDX( i, j ) ( (j)*fsize + (i) )

   #if defined(LONG_ACCURACY)    
    long double totenergy = 0;
   #else
    double totenergy = 0;    
   #endif

    // HINT: you may attempt to
    //       (i)  manually unroll the loop
    //       (ii) ask the compiler to do it
    // for instance
    // #pragma GCC unroll 4

    /*
    for ( int j = 1; j <= ysize; j++ )
        for ( int i = 1; i <= xsize; i++ )
            totenergy += data[ IDX(i, j) ];
    */

#pragma omp parallel for reduction(+ : totenergy)
  for (int j = 1; j <= ysize; ++j) {
    const double *row = data + j * fsize;
#pragma omp simd reduction(+ : totenergy)
    for (int i = 1; i <= xsize; ++i)
      totenergy += row[i];
  }
    
   #undef IDX

    *energy = (double)totenergy;
    return 0;
}



