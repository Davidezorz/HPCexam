#!/bin/bash
#SBATCH --nodes=1                   # number of nodes
#SBATCH --cpus-per-task=112         # OpenMP threads per MPI task
#SBATCH --ntasks-per-node=1         # how many task each node

#SBATCH --mem=0
#SBATCH --partition dcgp_usr_prod
#SBATCH -A uTS25_Tornator_0

#SBATCH -t 00:30:00
#SBATCH --job-name=HPC_Exam
#SBATCH --exclusive
# =======================================================

# Load MPI module if needed
module load openmpi/4.1.6--gcc--12.2.0

N=1                                 # nodes       -> nodes
P=1                                 # processors  -> number of task
T=0                                 # threads     -> CPU per task

# Set OpenMP variables
export OMP_PLACES=threads
export OMP_PROC_BIND=close
export OMP_DISPLAY_AFFINITY=TRUE

# compile
mpicc -D_XOPEN_SOURCE=700 -O2 -std=c17 -fopenmp -march=native  -Iinclude   src/stencil_template_parallel.c   -o main

#for T in 1 4
for T in 1 2 4 8 16 32 64 112
do
    export OMP_NUM_THREADS=$T
    echo "Running with $T threads"
    srun --ntasks=$P --cpus-per-task=$T ./main -p 1 -o 0 -e 300 -v 0 > output/Leonardo/OpenMP/leonardo_N${N}P${P}T${T}.log
done
