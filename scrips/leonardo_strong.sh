#!/bin/bash
#SBATCH --nodes=2                   # number of nodes
#SBATCH --cpus-per-task=14          # OpenMP threads per MPI task
#SBATCH --ntasks-per-node=8         # how many task each node

#SBATCH --mem=0
#SBATCH --partition dcgp_usr_prod
#SBATCH -A uTS25_Tornator_0

#SBATCH -t 00:03:00
#SBATCH --job-name=HPC_Exam
#SBATCH --exclusive
# =======================================================

# Load MPI module if needed
module load openmpi/4.1.6--gcc--12.2.0

N=2                                 # nodes       -> nodes
P=16                                # processors  -> number of task
T=8                                 # threads     -> CPU per task

# Set OpenMP variables
export OMP_PLACES=threads
export OMP_PROC_BIND=close
export OMP_DISPLAY_AFFINITY=TRUE

# compile
mpicc -D_XOPEN_SOURCE=700 -o main -march=native -O3 -std=c17 -fopenmp -Iinclude src/stencil_template_parallel.c
    
    
start_time=$(date +%s.%N)
srun --ntasks=$P --cpus-per-task=$T --cpu-bind=cores  ./main -x 25000 -y 25000 -p 1 -o 0 -e 300 -v 0 > output/Leonardo/OpenMP/leonardo_N${N}P${P}T${T}.log
end_time=$(date +%s.%N)
tot_time=$(echo "$end_time - $start_time" | bc)
echo "TimeTotalFile: ${tot_time}" >> output/Leonardo/OpenMP/leonardo_N${N}P${P}T${T}.log
