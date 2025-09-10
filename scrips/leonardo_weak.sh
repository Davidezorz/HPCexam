#!/bin/bash
#SBATCH --nodes=8                   # number of nodes
#SBATCH --cpus-per-task=8           # OpenMP threads per MPI task
#SBATCH --ntasks-per-node=8         # how many task each node

#SBATCH --mem=0
#SBATCH --partition dcgp_usr_prod
#SBATCH -A uTS25_Tornator_0

#SBATCH -t 00:02230
#SBATCH --job-name=HPC_Exam
#SBATCH --exclusive
# =======================================================

# Load MPI module if needed
module load openmpi/4.1.6--gcc--12.2.0

N=8                                 # nodes       -> nodes
P=64                                 # processors  -> number of task
T=8                                 # threads     -> CPU per task

x=$((16384*4))
y=$((16384*2))


# Set OpenMP variables
export OMP_PLACES=threads
export OMP_PROC_BIND=close
export OMP_DISPLAY_AFFINITY=TRUE

# Force OpenMPI to use the ob1 PML with TCP
# pick first non-loopback IPv4 interface name present on the compute node
IFACE=$(srun -N1 -n1 --mpi=none bash -lc "ip -o -4 addr show | awk '/scope global/ {print \$2; exit}'")
echo "Detected interface: ${IFACE}" >&2

# If detection failed, fallback to excluding loopback only
if [ -z "$IFACE" ]; then
  echo "Interface auto-detect failed, using btl_tcp_if_exclude=127.0.0.1/8,lo" >&2
  export OMPI_MCA_btl_tcp_if_exclude="127.0.0.1/8,lo"
else
  export OMPI_MCA_btl_tcp_if_include="$IFACE"
fi

# Force ob1 + tcp
export OMPI_MCA_pml=ob1
export OMPI_MCA_btl=tcp,self


# compile
mpicc -D_XOPEN_SOURCE=700 -o main -march=native -O3 -std=c17 -fopenmp -Iinclude src/stencil_template_parallel.c
    
    
start_time=$(date +%s.%N)
srun --ntasks=$P --cpus-per-task=$T --cpu-bind=cores  ./main -x $x -y $y -p 1 -o 0 -e 300 -v 0 > leonardo_N${N}P${P}T${T}x${x}y${y}.log
end_time=$(date +%s.%N)
tot_time=$(echo "$end_time - $start_time" | bc)
echo "TimeTotalFile: ${tot_time}" >> leonardo_N${N}P${P}T${T}.log
