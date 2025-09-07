/*

/*
 *
 *  mysizex   :   local x-extendion of your patch
 *  mysizey   :   local y-extension of your patch
 *
 *  INSTRUCTION:
 *  ├── mpicc -fopenmp -o main -Iinclude src/stencil_template_parallel.c -O2 -march=native
 *  └── mpirun -np 4 ./main  -n 100 -o 0 -e 300
 *  └── mpirun -np 4 ./main -x 256 -y 256 -n 150 -o 2 -e 175 -E 10 -p 1

python plot_parallel.py data_parallel -x 256 -y 256 --sx 2 --sy 2 -n 150 --save parallel.mp4

 -fopt-info-vec-optimized
 */



//#include "stencil.h"
#include "stencil_template_parallel.h"


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
/*──────────────────────────────────────────────────────────────╮
│                             MAIN                              │
╰──────────────────────────────────────────────────────────────*/
int main(int argc, char **argv)
{
  MPI_Comm myCOMM_WORLD;
  int  Rank, Ntasks;
  uint neighbours[4];

  int  Niterations;
  int  periodic;
  vec2_t S, N;
  
  int      Nsources;
  int      Nsources_local;
  vec2_t  *Sources_local;
  double   energy_per_source;

  plane_t   planes[2];  
  buffers_t buffers[2];
  
  int output_energy_stat_perstep;
  
  /* initialize MPI envrionment */
  {
    int level_obtained;
    
    // NOTE: change MPI_FUNNELED if appropriate
    //
    MPI_Init_thread( &argc, &argv, MPI_THREAD_FUNNELED, &level_obtained );
    if ( level_obtained < MPI_THREAD_FUNNELED ) {
      printf("MPI_thread level obtained is %d instead of %d\n",
       level_obtained, MPI_THREAD_FUNNELED );
      MPI_Finalize();
      exit(1); }
    
    MPI_Comm_rank(MPI_COMM_WORLD, &Rank);
    MPI_Comm_size(MPI_COMM_WORLD, &Ntasks);
    MPI_Comm_dup (MPI_COMM_WORLD, &myCOMM_WORLD);
  }
  //return 1;
  
  /* argument checking and setting */
  int ret = initialize ( &myCOMM_WORLD, Rank, Ntasks, argc, argv, 
       &S, &N, &periodic, &output_energy_stat_perstep,
			 neighbours, &Niterations,
			 &Nsources, &Nsources_local, &Sources_local, &energy_per_source,
			 &planes[0], &buffers[0] );

  if ( ret )
  {
    printf("task %d is opting out with termination code %d\n",
     Rank, ret );
    
    MPI_Finalize();
    return 0;
  }

  double time_total   = MPI_Wtime();   /* take wall-clock time for everything           */
  double time_fill    = 0;             /* time for filling the buffer                   */
  double time_update  = 0;             /* time for updating plane                       */
  double time_ew_comm = 0;             /* time for waiting message from east and west   */
  double time_ew      = 0;             /* time for computing east and west              */
  double time_ns_comm = 0;             /* time for waiting message from north and south */
  double time_ns      = 0;             /* time for computing east and west              */

  int current = OLD;



  for (int iter = 0; iter < Niterations; ++iter)
  {
    /*
    if (Rank == 0)
    {
      printf("\riteration: %d", iter); fflush(stdout);
    }
    */
    MPI_Request reqs[8];
    for (int i = 0; i < 8; ++i) reqs[i] = MPI_REQUEST_NULL;
    
    /* new energy from sources */
    inject_energy( periodic, Nsources_local, Sources_local, energy_per_source, &planes[current], N );


    /* -------------------------------------- */

    // [A] fill the buffers, and/or make the buffers' pointers pointing to the correct position

    // [B] perfoem the halo communications
    //     (1) use Send / Recv
    //     (2) use Isend / Irecv
    //         --> can you overlap communication and compution in this way?
    
    // [C] copy the haloes data

    /* --------------------------------------  */
    /* update grid points */

    /*──────────────────────────────────────────────────────────────╮
    │                         set up buffer                         │
    ╰──────────────────────────────────────────────────────────────*/
    double t_fill = MPI_Wtime();

    const uint register fxsize = planes[current].size[_x_]+2;
    const uint register sizex  = planes[current].size[_x_];
    const uint register sizey  = planes[current].size[_y_];


    #define IDX( i, j ) ( (j)*fxsize + (i) )

    double * restrict data_old = planes[current].data;

  
    buffers[SEND][NORTH] = data_old + IDX(1, 1); 
    buffers[SEND][SOUTH] = data_old + IDX(1, sizey); 
    buffers[RECV][NORTH] = data_old + IDX(1, 0);
    buffers[RECV][SOUTH] = data_old + IDX(1, sizey+1); 

    if (neighbours[WEST] != MPI_PROC_NULL){
#pragma omp parallel for schedule(static)
      for (int y = 1; y <= sizey; ++y)
      {
        __builtin_prefetch(&data_old[IDX(1, y + 6)], 0, 1); 
        buffers[SEND][WEST][y-1] = data_old[ IDX(1, y) ];  
      }
    }

    if (neighbours[EAST] != MPI_PROC_NULL) {
#pragma omp parallel for schedule(static)
      for (int y = 1; y <= sizey; ++y)
      {
        __builtin_prefetch(&data_old[IDX(1, y + 6)], 0, 1);
        buffers[SEND][EAST][y-1] = data_old[ IDX(sizex, y) ];
      }
    }

    time_fill += MPI_Wtime() - t_fill;

    //printf("%d communication started...\n", Rank);
    //printf("NORTH: %d, SOUTH: %d, EAST: %d, WEST: %d\n", neighbours[NORTH], neighbours[SOUTH], neighbours[EAST], neighbours[WEST]);
    
    /*──────────────────────────────────────────────────────────────╮
    │                         communication                         │
    ╰──────────────────────────────────────────────────────────────*/
    if (neighbours[NORTH] != MPI_PROC_NULL) {
      //printf("%d: %p %p\n", Rank, buffers[RECV][NORTH], buffers[SEND][NORTH]);
      MPI_Irecv(buffers[RECV][NORTH], sizex, MPI_DOUBLE, neighbours[NORTH], 0, myCOMM_WORLD, &reqs[NORTH + 4]);
      MPI_Isend(buffers[SEND][NORTH], sizex, MPI_DOUBLE, neighbours[NORTH], 1, myCOMM_WORLD, &reqs[NORTH]);
    }

    if (neighbours[SOUTH] != MPI_PROC_NULL) {
      //printf("%d: %p %p\n", Rank, buffers[RECV][SOUTH], buffers[SEND][SOUTH]);
      MPI_Irecv(buffers[RECV][SOUTH], sizex, MPI_DOUBLE, neighbours[SOUTH], 1, myCOMM_WORLD, &reqs[SOUTH + 4]);
      MPI_Isend(buffers[SEND][SOUTH], sizex, MPI_DOUBLE, neighbours[SOUTH], 0, myCOMM_WORLD, &reqs[SOUTH]);      
    }

    if (neighbours[EAST] != MPI_PROC_NULL) {
      //printf("%d: %p %p\n", Rank,  buffers[RECV][EAST], buffers[SEND][EAST]);
      MPI_Irecv(buffers[RECV][EAST],  sizey, MPI_DOUBLE, neighbours[EAST],  2, myCOMM_WORLD, &reqs[EAST + 4]);
      MPI_Isend(buffers[SEND][EAST],  sizey, MPI_DOUBLE, neighbours[EAST],  3, myCOMM_WORLD, &reqs[EAST]);
    }

    if (neighbours[WEST] != MPI_PROC_NULL) {
      //printf("%d: %p %p\n", Rank,  buffers[RECV][WEST], buffers[SEND][WEST]);
      MPI_Irecv(buffers[RECV][WEST],  sizey, MPI_DOUBLE, neighbours[WEST],  3, myCOMM_WORLD, &reqs[WEST + 4]);
      MPI_Isend(buffers[SEND][WEST],  sizey, MPI_DOUBLE, neighbours[WEST],  2, myCOMM_WORLD, &reqs[WEST]);
    }




    //printf("%d communication complete \n", Rank);
    /*──────────────────────────────────────────────────────────────╮
    │         update the new plane except for the borders           │
    ╰──────────────────────────────────────────────────────────────*/
    double t_update = MPI_Wtime();

    update_center( periodic, N, &planes[current], &planes[!current] );

    time_update += MPI_Wtime() - t_update;


    /*──────────────────────────────────────────────────────────────╮
    │                        east west update                       │
    ╰──────────────────────────────────────────────────────────────*/

    //MPI_Waitall(8, reqs, MPI_STATUS_IGNORE);
    //update_NORTH( periodic, N, &planes[current], &planes[!current] );
    //update_SOUTH( periodic, N, &planes[current], &planes[!current] );
    //update_EAST ( periodic, N, &planes[current], &planes[!current] );
    //update_WEST ( periodic, N, &planes[current], &planes[!current] );
    //update_WEST_EAST  ( periodic, N, &planes[current], &planes[!current]);

    double t_ew_comm = MPI_Wtime();

    int received_west = (neighbours[WEST] == MPI_PROC_NULL) ? 1 : 0;
    int received_east = (neighbours[EAST] == MPI_PROC_NULL) ? 1 : 0;
    int flag = 0;

    while (!(received_west && received_east)) 
    {
      if (!received_west) {
        MPI_Test(&reqs[WEST + 4], &flag, MPI_STATUS_IGNORE);
        if (flag) received_west = 1;
      }
      if (!received_east) {
        MPI_Test(&reqs[EAST + 4], &flag, MPI_STATUS_IGNORE);
        if (flag) received_east = 1;
      }
    }

    time_ew_comm += MPI_Wtime() - t_ew_comm;



    double t_ew = MPI_Wtime();

    update_WEST_EAST ( periodic, N, &planes[current], buffers, neighbours, &planes[!current]);
    
    time_ew += MPI_Wtime() - t_ew;

    /*──────────────────────────────────────────────────────────────╮
    │                      north south update                       │
    ╰──────────────────────────────────────────────────────────────*/

    double t_ns_comm = MPI_Wtime(); 

    int received_north = (neighbours[NORTH] == MPI_PROC_NULL) ? 1 : 0;
    int received_south = (neighbours[SOUTH] == MPI_PROC_NULL) ? 1 : 0;
    flag = 0;


    while (!(received_north && received_south)) 
    {
      if (!received_north) {
        MPI_Test(&reqs[NORTH + 4], &flag, MPI_STATUS_IGNORE);
        if (flag) received_north = 1;
      }
      if (!received_south) {
        MPI_Test(&reqs[SOUTH + 4], &flag, MPI_STATUS_IGNORE);
        if (flag) received_south = 1;
      }
    }
    
    time_ns_comm += MPI_Wtime() - t_ns_comm;



    double t_ns = MPI_Wtime();

    update_NORTH_SOUTH( periodic, N, &planes[current], &planes[!current] );
    
    time_ns += MPI_Wtime() - t_ns;
    

    /* update */
    //update_plane( periodic, N, &planes[current], &planes[!current] );
    /*──────────────────────────────────────────────────────────────╮
    │                            output                             │
    ╰──────────────────────────────────────────────────────────────*/
    if ( output_energy_stat_perstep ) 
    {
      output_energy_stat ( iter, &planes[!current], (iter+1) * Nsources*energy_per_source, Rank, &myCOMM_WORLD );

      if ( output_energy_stat_perstep > 1)
      {
        char filename[100];
        sprintf( filename, "data_parallel/%d_plane_%05d.bin", Rank, iter );
        int dump_status = dump(planes[!current].data, planes[!current].size, filename);
        if (dump_status != 0)
        {
          fprintf(stderr, "Error in dump_status. Exit with %d\n", dump_status);
        }
      }
    }

    /* swap plane indexes for the new iteration */
    current = !current;
  }
  



  /*────────────────────────────────────────────────────────────────╮
  │                               end                               │
  ╰────────────────────────────────────────────────────────────────*/
  time_total = MPI_Wtime() - time_total;


  double time_total_mean   = 0;
  double time_fill_mean    = 0;
  double time_update_mean  = 0;
  double time_ew_comm_mean = 0;
  double time_ew_mean      = 0;
  double time_ns_comm_mean = 0;
  double time_ns_mean      = 0;

  if ( Rank == 0 ) 
  {
    MPI_Reduce ( &time_total,   &time_total_mean,   1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_fill,    &time_fill_mean,    1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_update,  &time_update_mean,  1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ew_comm, &time_ew_comm_mean, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ew,      &time_ew_mean,      1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ns_comm, &time_ns_comm_mean, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ns,      &time_ns_mean,      1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
  }
  else{
    MPI_Reduce ( &time_total,   0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_fill,    0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_update,  0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ew_comm, 0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ew,      0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ns_comm, 0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
    MPI_Reduce ( &time_ns,      0x0, 1, MPI_DOUBLE, MPI_SUM, 0, myCOMM_WORLD);
  }

  if(Rank == 0){
    printf("\n\nResults:\n");
    printf("time total:                        %f\n", time_total_mean  /Ntasks);
    printf("\n");
    printf("time for filling buffers:          %f\n", time_fill_mean   /Ntasks);
    printf("time for update planes:            %f\n", time_update_mean /Ntasks);
    printf("\n");
    printf("time for waiting EAST  and WEST:   %f\n", time_ew_comm_mean /Ntasks);
    printf("time for update  EAST  and WEST:   %f\n", time_ew_mean      /Ntasks);
    printf("time for waiting NORTH and SOUTH:  %f\n", time_ns_comm_mean /Ntasks);
    printf("time for update  NORTH and SOUTH:  %f\n", time_ns_mean      /Ntasks); 
    
    printf("\n");
    double time_borders = time_ew_comm_mean + time_ew_mean + time_ns_comm_mean + time_ns_mean;
    printf("time for handle borders:           %f\n", time_borders      /Ntasks);
  }



  output_energy_stat ( -1, &planes[!current], Niterations * Nsources*energy_per_source, Rank, &myCOMM_WORLD );
  
  memory_release( planes, buffers );
  
  
  MPI_Finalize();
  return 0;
}


/* ==========================================================================
   =                                                                        =
   =   routines called within the integration loop                          =
   ========================================================================== */



/* ==========================================================================
   =                                                                        =
   =   initialization                                                       =
   ========================================================================== */


uint simple_factorization( uint, int *, uint ** );

int initialize_sources( int       ,
			int       ,
			MPI_Comm  *,
			uint      [2],
			int       ,
			int      *,
			vec2_t  ** );


int memory_allocate ( const int       *,
		      const vec2_t     ,
		            buffers_t *,
		            plane_t   * );
		      

int initialize ( MPI_Comm *Comm,
                 int      Me,                  // the rank of the calling process
                 int      Ntasks,              // the total number of MPI ranks
                 int      argc,                // the argc from command line
                 char   **argv,                // the argv from command line
                 vec2_t  *S,                   // the size of the plane
                 vec2_t  *N,                   // two-uint array defining the MPI tasks' grid
                 int     *periodic,            // periodic-boundary tag
                 int     *output_energy_stat,
                 int     *neighbours,          // four-int array that gives back the neighbours of the calling task
                 int     *Niterations,         // how many iterations
                 int     *Nsources,            // how many heat sources
                 int     *Nsources_local,
                 vec2_t **Sources_local,
                 double  *energy_per_source,   // how much heat per source
                 plane_t *planes,
                 buffers_t *buffers 
                 )
{
  int halt = 0;
  int ret;
  int verbose = 0;
  
  // ··································································
  // set deffault values

  (*S)[_x_]         = 10000;
  (*S)[_y_]         = 10000;
  *periodic         = 0;
  *Nsources         = 4;
  *Nsources_local   = 0;
  *Sources_local    = NULL;
  *Niterations      = 1000;
  *energy_per_source = 1.0;

  if ( planes == NULL ) {
    // manage the situation
  }

  //planes[OLD].size[0] = planes[OLD].size[0] = 0;
  //planes[NEW].size[0] = planes[NEW].size[0] = 0;

  planes[OLD].size[0] = planes[OLD].size[1] = 0;
  planes[NEW].size[0] = planes[NEW].size[1] = 0;
  
  for ( int i = 0; i < 4; i++ )
    neighbours[i] = MPI_PROC_NULL;

  for ( int b = 0; b < 2; b++ )
    for ( int d = 0; d < 4; d++ )
      buffers[b][d] = NULL;

  // ··································································
  // process the commadn line
  // 
  while ( 1 )
  {
    int opt;
    while((opt = getopt(argc, argv, ":hx:y:e:E:n:o:p:v:")) != -1)
    {
    switch( opt )
      {
      case 'x': (*S)[_x_] = (uint)atoi(optarg);
        break;

      case 'y': (*S)[_y_] = (uint)atoi(optarg);
        break;

      case 'e': *Nsources = atoi(optarg);
        break;

      case 'E': *energy_per_source = atof(optarg);
        break;

      case 'n': *Niterations = atoi(optarg);
        break;

      case 'o': *output_energy_stat = (atoi(optarg));
        break;

      case 'p': *periodic = (atoi(optarg) > 0);
        break;

      case 'v': verbose = atoi(optarg);
        break;

      case 'h': {
        if ( Me == 0 )
          printf( "\nvalid options are ( values btw [] are the default values ):\n"
    	      "-x    x size of the plate [10000]\n"
    	      "-y    y size of the plate [10000]\n"
    	      "-e    how many energy sources on the plate [4]\n"
    	      "-E    how many energy sources on the plate [1.0]\n"
    	      "-n    how many iterations [1000]\n"
    	      "-p    whether periodic boundaries applies  [0 = false]\n\n"
    	      );
        halt = 1; }
        break;
        
        
      case ':': printf( "option -%c requires an argument\n", optopt);
        break;
        
      case '?': printf(" -------- help unavailable ----------\n");
        break;
      }
    }

    if ( opt == -1 )
      break;
  }

  if ( halt )
    return 1;
  
  
  // ··································································
  /*
   * here we should check for all the parms being meaningful
   *

   */

  // ...


  // ··································································
  /*
   * find a suitable domain decomposition
   * very simple algorithm, you may want to
   * substitute it with a better one
   *
   * the plane Sx x Sy will be solved with a grid
   * of Nx x Ny MPI tasks
   */

  vec2_t Grid;
  double formfactor = ((*S)[_x_] >= (*S)[_y_] ? (double)(*S)[_x_]/(*S)[_y_] : (double)(*S)[_y_]/(*S)[_x_] );
  int    dimensions = 2 - (Ntasks <= ((int)formfactor+1) );

  
  if ( dimensions == 1 )
  {
    if ( (*S)[_x_] >= (*S)[_y_] )
      Grid[_x_] = Ntasks, Grid[_y_] = 1;
    else
      Grid[_x_] = 1, Grid[_y_] = Ntasks;
  }
  else
  {
    int   Nf;
    uint *factors;
    uint  first = 1;
    ret = simple_factorization( Ntasks, &Nf, &factors );
    
    for ( int i = 0; (i < Nf) && ((Ntasks/first)/first > formfactor); i++ )
      first *= factors[i];

    if ( (*S)[_x_] > (*S)[_y_] )
      Grid[_x_] = Ntasks/first, Grid[_y_] = first;
    else
      Grid[_x_] = first, Grid[_y_] = Ntasks/first;
  }

  (*N)[_x_] = Grid[_x_];
  (*N)[_y_] = Grid[_y_];
  

  // ··································································
  // my cooridnates in the grid of processors
  //
  int X = Me % Grid[_x_];
  int Y = Me / Grid[_x_];

  // ··································································
  // find my neighbours
  //

  if ( Grid[_x_] > 1 )
  {  
    if ( *periodic ) {       
      neighbours[EAST]  = Y*Grid[_x_] + (Me + 1 ) % Grid[_x_];
      neighbours[WEST]  = (X%Grid[_x_] > 0 ? Me-1 : (Y+1)*Grid[_x_]-1); 
    }
    
    else {
      neighbours[EAST]  = ( X < Grid[_x_]-1 ? Me+1 : MPI_PROC_NULL );
      neighbours[WEST]  = ( X > 0 ? (Me-1)%Ntasks : MPI_PROC_NULL ); 
    }  
  }

  if ( Grid[_y_] > 1 )
  {
    if ( *periodic ) {      
      neighbours[NORTH] = (Ntasks + Me - Grid[_x_]) % Ntasks;
      neighbours[SOUTH] = (Ntasks + Me + Grid[_x_]) % Ntasks; 
    }

    else {    
      neighbours[NORTH] = ( Y > 0 ? Me - Grid[_x_]: MPI_PROC_NULL );
      neighbours[SOUTH] = ( Y < Grid[_y_]-1 ? Me + Grid[_x_] : MPI_PROC_NULL ); 
    }
  }

  // ··································································
  // the size of my patch
  //

  /*
   * every MPI task determines the size sx x sy of its own domain
   * REMIND: the computational domain will be embedded into a frame
   *         that is (sx+2) x (sy+2)
   *         the outern frame will be used for halo communication or
   */
  
  vec2_t mysize;
  uint s = (*S)[_x_] / Grid[_x_];
  uint r = (*S)[_x_] % Grid[_x_];
  mysize[_x_] = s + (X < r);
  s = (*S)[_y_] / Grid[_y_];
  r = (*S)[_y_] % Grid[_y_];
  mysize[_y_] = s + (Y < r);

  planes[OLD].size[0] = mysize[0];
  planes[OLD].size[1] = mysize[1];
  planes[NEW].size[0] = mysize[0];
  planes[NEW].size[1] = mysize[1];
  

  if ( verbose > 0 )
  {
    if ( Me == 0 ) 
    {
    printf("Tasks are decomposed in a grid %d x %d\n\n",
     Grid[_x_], Grid[_y_] );
    fflush(stdout);
    }

    MPI_Barrier(*Comm);
    
    for ( int t = 0; t < Ntasks; t++ )
    {
      if ( t == Me )
        {
          printf("Task %4d :: "
           "\tgrid coordinates : %3d, %3d\n"
           "\tneighbours: N %4d    E %4d    S %4d    W %4d\n",
           Me, X, Y,
           neighbours[NORTH], neighbours[EAST],
           neighbours[SOUTH], neighbours[WEST] );
          fflush(stdout);
        }

      MPI_Barrier(*Comm);
    }
  }

  
  // ··································································
  // allocae the needed memory
  //
  /*
    int memory_allocate ( const int       *neighbours  ,
                          const vec2_t     N           ,
                                buffers_t *buffers_ptr ,
                                plane_t   *planes_ptr
                      )

    int initialize ( MPI_Comm *Comm,
         int      Me,                  // the rank of the calling process
         int      Ntasks,              // the total number of MPI ranks
         int      argc,                // the argc from command line
         char   **argv,                // the argv from command line
         vec2_t  *S,                   // the size of the plane
         vec2_t  *N,                   // two-uint array defining the MPI tasks' grid
         int     *periodic,            // periodic-boundary tag
         int     *output_energy_stat,
         int     *neighbours,          // four-int array that gives back the neighbours of the calling task
         int     *Niterations,         // how many iterations
         int     *Nsources,            // how many heat sources
         int     *Nsources_local,
         vec2_t **Sources_local,
         double  *energy_per_source,   // how much heat per source
         plane_t *planes,
         buffers_t *buffers 
         )
  */
  ret = memory_allocate( neighbours, *N, buffers, planes );
  //                                     buffers

  if (ret != 0)
  {
    printf("error on memory_allocate\n");
    memory_release(planes, buffers);
    return 1;
  }
  

  // ··································································
  // allocae the heat sources
  //
  ret = initialize_sources( Me, Ntasks, Comm, mysize, *Nsources, Nsources_local, Sources_local );
  
  if (ret != 0)
  {
    printf("error on initialize_sources\n");
    return 1;
  }

  return 0;  
}








uint simple_factorization( uint A, int *Nfactors, uint **factors )
/*
 * rought factorization;
 * assumes that A is small, of the order of <~ 10^5 max,
 * since it represents the number of tasks
 #
 */
{
  int N = 0;
  int f = 2;
  uint _A_ = A;

  while ( f < A )
  {
    while( _A_ % f == 0 ) 
    {
      N++;
      _A_ /= f; 
    }
    f++;
  }

  *Nfactors = N;
  uint *_factors_ = (uint*)malloc( N * sizeof(uint) );

  N   = 0;
  f   = 2;
  _A_ = A;

  while ( f < A )
  {
    while( _A_ % f == 0 ) 
    {
      _factors_[N++] = f;
      _A_ /= f; 
    }
  f++;
  }

  *factors = _factors_;
  return 0;
}


int initialize_sources( int       Me,
      int       Ntasks,
      MPI_Comm *Comm,
      vec2_t    mysize,
      int       Nsources,
      int      *Nsources_local,
      vec2_t  **Sources )
{

  srand48(time(NULL) ^ Me);
  int *tasks_with_sources = (int*)malloc( Nsources * sizeof(int) );
  
  if ( Me == 0 )
  {
    for ( int i = 0; i < Nsources; i++ )
      tasks_with_sources[i] = (int)lrand48() % Ntasks;
  }
  
  MPI_Bcast( tasks_with_sources, Nsources, MPI_INT, 0, *Comm );

  int nlocal = 0;
  for ( int i = 0; i < Nsources; i++ )
    nlocal += (tasks_with_sources[i] == Me);

  *Nsources_local = nlocal;
  
  if ( nlocal > 0 )
  {
    vec2_t * restrict helper = (vec2_t*)malloc( nlocal * sizeof(vec2_t) );      
    for ( int s = 0; s < nlocal; s++ )
    {
      helper[s][_x_] = 1 + lrand48() % mysize[_x_];
      helper[s][_y_] = 1 + lrand48() % mysize[_y_];
    }

    *Sources = helper;
  }
  
  free( tasks_with_sources );

  return 0;
}



int memory_allocate ( const int       *neighbours  ,
                      const vec2_t     N           ,
                            buffers_t *buffers_ptr,
                            plane_t   *planes_ptr
                  )
{
    /*
      here you allocate the memory buffers that you need to
      (i)  hold the results of your computation
      (ii) communicate with your neighbours

      The memory layout that I propose to you is as follows:

      (i) --- calculations
      you need 2 memory regions: the "OLD" one that contains the
      results for the step (i-1)th, and the "NEW" one that will contain
      the updated results from the step ith.

      Then, the "NEW" will be treated as "OLD" and viceversa.

      These two memory regions are indexed by *plate_ptr:

      planew_ptr[0] ==> the "OLD" region
      plamew_ptr[1] ==> the "NEW" region

      

      (ii) --- communications

      you may need two buffers (one for sending and one for receiving)
      for each one of your neighnours, that are at most 4:
      north, south, east and west.      

      To them you need to communicate at most mysizex or mysizey
      daouble data.

      These buffers are indexed by the buffer_ptr pointer so
      that

      (*buffers_ptr)[SEND][ {NORTH,...,WEST} ] = .. some memory regions
      (*buffers_ptr)[RECV][ {NORTH,...,WEST} ] = .. some memory regions
      
      --->> Of course you can change this layout as you prefer


     */

  if (planes_ptr == NULL )
    // an invalid pointer has been passed
    // manage the situation
    return -1;


  if (buffers_ptr == NULL )
    // an invalid pointer has been passed
    // manage the situation
    return -1;



  // ··················································
  // allocate memory for data
  // we allocate the space needed for the plane plus a contour frame
  // that will contains data form neighbouring MPI tasks
  unsigned int frame_size = (planes_ptr[OLD].size[_x_]+2) * (planes_ptr[OLD].size[_y_]+2);

  planes_ptr[OLD].data = (double*)malloc( frame_size * sizeof(double) );
  if ( planes_ptr[OLD].data == NULL )
    // manage the malloc fail
    return -1;

  memset ( planes_ptr[OLD].data, 0, frame_size * sizeof(double) );

  planes_ptr[NEW].data = (double*) malloc( frame_size * sizeof(double) );
  if ( planes_ptr[NEW].data == NULL )
    // manage the malloc fail
    return -1;

  memset ( planes_ptr[NEW].data, 0, frame_size * sizeof(double) );


  // ··················································
  // buffers for north and south communication 
  // are not really needed
  //
  // in fact, they are already contiguous, just the
  // first and last line of every rank's plane
  //
  // you may just make some pointers pointing to the
  // correct positions
  //

  // or, if you preer, just go on and allocate buffers
  // also for north and south communications

  // ··················································
  // allocate buffers
  

  int size = planes_ptr[OLD].size[_y_] * sizeof(double);

  if (neighbours[EAST] != MPI_PROC_NULL) {
      buffers_ptr[SEND][EAST] = (double*) malloc(size);
      buffers_ptr[RECV][EAST] = (double*) malloc(size);

    if (buffers_ptr[SEND][EAST] == NULL && buffers_ptr[RECV][EAST] == NULL) 
      {fprintf(stderr, "buffers_ptr[EAST] allocation failed \n" ); return 1;}
  }

  if (neighbours[WEST] != MPI_PROC_NULL) {
    buffers_ptr[SEND][WEST] = (double*) malloc(size);
    buffers_ptr[RECV][WEST] = (double*) malloc(size);

    if (buffers_ptr[SEND][WEST] == NULL && buffers_ptr[RECV][WEST] == NULL) 
      {fprintf(stderr, "buffers_ptr[WEST] allocation failed \n" ); return 1;}
  }



  // ··················································
  
  return 0;
}



int memory_release ( plane_t *planes, buffers_t * buffers)
{
  if ( planes != NULL )
  {
    if ( planes[OLD].data != NULL )
      free (planes[OLD].data);
      
    if ( planes[NEW].data != NULL )
      free (planes[NEW].data);
  }

  if (buffers[SEND][EAST] != NULL) free(buffers[SEND][EAST]);
  if (buffers[RECV][EAST] != NULL) free(buffers[RECV][EAST]);
  if (buffers[SEND][WEST] != NULL) free(buffers[SEND][WEST]);
  if (buffers[RECV][WEST] != NULL) free(buffers[RECV][WEST]);
  return 0;
}



int output_energy_stat ( int step, plane_t *plane, double budget, int Me, MPI_Comm *Comm )
{

  double system_energy = 0;
  double tot_system_energy = 0;
  get_total_energy ( plane, &system_energy );
  
  MPI_Reduce ( &system_energy, &tot_system_energy, 1, MPI_DOUBLE, MPI_SUM, 0, *Comm );
  
  if ( Me == 0 )
    {
      if ( step >= 0 )
        printf(" [ step %4d ] ", step ); fflush(stdout);

      
      printf( "total injected energy is %g, "
	      "system energy is %g "
	      "( in avg %g per grid point)\n\n\n",
	      budget,
	      tot_system_energy,
	      tot_system_energy / (plane->size[_x_]*plane->size[_y_]) );
    }
  
  return 0;
}






int dump ( const double *data, const uint size[2], const char *filename)
{
  if ( (filename != NULL) && (filename[0] != '\0') ){
    FILE *outfile = fopen( filename, "w" );
    if ( outfile == NULL )
      return 2;
    
    float *array = (float*)malloc( size[0] * sizeof(float) );

    for ( int j = 1; j <= size[1]; j++ ) {      
      const double * restrict line = data + j*(size[0] + 2);
      for ( int i = 1; i <= size[0]; i++ ) {
        //int cut = line[i] < 100;
        array[i-1] = (float) line[i];
        
      }
      //printf("\n");
      fwrite( array, sizeof(float), size[0], outfile );
    }

    free( array );

    fclose( outfile );
    return 0;
  }

  return 1;
  
}