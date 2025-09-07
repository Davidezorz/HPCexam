#!/bin/bash
#SBATCH --ntasks=1                  # total MPI tasks across nodes
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8           # OpenMP threads per MPI task
#SBATCH --mem=0                     # use all available memory
#SBATCH --partition=THIN

#SBATCH -t 00:09:00                 # 5 minutes for profiling and test runs
#SBATCH --job-name=testing

# Set OpenMP variables
export OMP_NUM_THREADS=8
export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_DISPLAY_AFFINITY=TRUE

# Load MPI module if needed
module load openMPI/5.0.5

mpicc -D_XOPEN_SOURCE=700 -O3 -std=c17 -fopenmp -march=native  -Iinclude   src/stencil_template_parallel.c   -o main
# mpirun -np 1 ./stencil_template_parallel -p 1 -v 0 -o 0 > output_base.log
srun --ntasks=1 --cpus-per-task=8 ./main -o 0 -e 300 -v 1 > output_base.log


