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
│                         update_center                         │
╰──────────────────────────────────────────────────────────────*/

inline int update_center (const int     periodic, 
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
    
// export OMP_NUM_THREADS = 4
#pragma omp parallel for simd schedule(static)
    for (uint j = 2; j < ysize; j++) {
#pragma GCC unroll 2
        for ( uint i = 2; i < xsize; i++) {
            double result = old[ IDX(i,j) ] * 0.5;
            double sum_i = old[IDX(i-1, j)] + old[IDX(i+1, j)];
            double sum_j = old[IDX(i, j-1)] + old[IDX(i, j+1)];

            result += (sum_i + sum_j) / 4 * 0.5;

            new[ IDX(i,j) ] = result;

            /*new[ IDX(i,j) ] =
                old[ IDX(i,j) ] / 2.0 + ( old[IDX(i-1, j)] + old[IDX(i+1, j)] +
                                          old[IDX(i, j-1)] + old[IDX(i, j+1)] ) /4.0 / 2.0; */
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
        for (uint i = 1; i < xsize; i++) 
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
        for (uint i = 1; i < xsize; i++) 
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






/*
inline int update_WEST_EAST( const int        periodic, 
                             const vec2_t     N,
                             const plane_t   *oldplane,
                                   plane_t   *newplane
                            ) */

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

    int prefetch = 8;

    //printf("WEST: %d, EAST: %d \n", thereIsWest, thereIsEast);
    if (periodic && (N[_x_] == 1))
    {
#pragma omp parallel for schedule(static)
        for (uint j = 2; j < ysize; j++) 
        {
            __builtin_prefetch(&old[IDX(i_west, j + prefetch)], 0, 1);  // prefetch for read 
            __builtin_prefetch(&new[IDX(i_west, j + prefetch)], 1, 1);  // prefetch for write

            /**/
            if (thereIsWest )
            {
                old[IDX(i_east-1, j)] = buffers[RECV][WEST][j-1];
            }
            if (thereIsEast) 
            {
                old[IDX(i_west+1, j)] = buffers[RECV][EAST][j-1];
            }
            
            

            double result_east = old[IDX(i_east,j)   ] * 0.5;
            double sum_i_east  = old[IDX(i_east-1, j)] + old[IDX(i_east+1, j)];
            double sum_j_east  = old[IDX(i_east, j-1)] + old[IDX(i_east, j+1)];

            result_east += (sum_i_east + sum_j_east) / 4 * 0.5;

            double result_west = old[IDX(i_west,j)   ] * 0.5;
            double sum_i_west  = old[IDX(i_west-1, j)] + old[IDX(i_west+1, j)];
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
        for (uint j = 2; j < ysize; j++) 
        {
            __builtin_prefetch(&old[IDX(i_west, j + prefetch)], 0, 1);  // prefetch for read 
            __builtin_prefetch(&new[IDX(i_west, j + prefetch)], 1, 1);  // prefetch for write

            if (thereIsWest )
            {
                old[IDX(i_east-1, j)] = buffers[RECV][WEST][j-1];
            }
            if (thereIsEast) 
            {
                old[IDX(i_west+1, j)] = buffers[RECV][EAST][j-1];
            }

            double result_east = old[IDX(i_east,j)   ] * 0.5;
            double sum_i_east  = old[IDX(i_east-1, j)] + old[IDX(i_east+1, j)];
            double sum_j_east  = old[IDX(i_east, j-1)] + old[IDX(i_east, j+1)];

            result_east += (sum_i_east + sum_j_east) / 4 * 0.5;

            double result_west = old[IDX(i_west,j)   ] * 0.5;
            double sum_i_west  = old[IDX(i_west-1, j)] + old[IDX(i_west+1, j)];
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



