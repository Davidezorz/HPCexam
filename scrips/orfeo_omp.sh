#!/bin/bash
#SBATCH --nodes=1                   # 1 node
#SBATCH --ntasks=1                  # total MPI tasks across nodes
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=128         # OpenMP threads per MPI task
#SBATCH --mem=0                     # use all available memory
#SBATCH --partition=EPYC

#SBATCH -t 00:05:00                 # 5 minutes for profiling and test runs
#SBATCH --job-name=testing

# Set OpenMP variables
export OMP_PLACES=cores
export OMP_PROC_BIND=close
# export OMP_DISPLAY_AFFINITY=TRUE

N=1                                 # nodes       -> nodes
P=1                                 # processors  -> number of task
T=0                                 # threads     -> CPU per task


# Load MPI module if needed
module load openMPI/5.0.5

# compile
mpicc -D_XOPEN_SOURCE=700 -O2 -std=c17 -fopenmp -march=native  -Iinclude   src/stencil_template_parallel.c   -o main

# run
for T in 1 4 16 32 64 128
#for T in 1 4
do
    export OMP_NUM_THREADS=$T
    echo "Running with $T threads"
    srun --ntasks=$P --cpus-per-task=$T --cpu-bind=cores ./main -o 0 -e 300 -v 1 > output/Orfeo/OpenMP/orfeo_N${N}P${P}T${T}.log
done
