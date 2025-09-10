#!/bin/bash
#SBATCH --nodes=4                   # nodes
#SBATCH --ntasks=32                 # total MPI tasks across nodes
#SBATCH --ntasks-per-node=8

#SBATCH --cpus-per-task=4           # OpenMP threads per MPI task
#SBATCH --mem=0                     # use all available memory
#SBATCH --partition=EPYC

#SBATCH -t 00:01:00                 # minutes for profiling and test runs
#SBATCH --job-name=testing

N=4                                 # nodes       -> nodes
P=32                                # processors  -> number of task
T=4                                 # threads     -> CPU per task

# UCX settings to avoid CMA issues across nodes
export UCX_TLS=tcp,self,sm
export UCX_NET_DEVICES=all


# Set OpenMP variables
export OMP_NUM_THREADS=$T
export OMP_PLACES=cores
export OMP_PROC_BIND=close
export OMP_DISPLAY_AFFINITY=TRUE

# Load MPI module if needed
module load openMPI/5.0.5

mpicc -D_XOPEN_SOURCE=700 -O3 -std=c17 -fopenmp -march=native  -Iinclude   src/stencil_template_parallel.c   -o main
srun --ntasks=$P --cpus-per-task=$T ./main -o 0 -e 300 -v 1 > output_N${N}P${P}T${T}.log



