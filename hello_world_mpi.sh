#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/	# working directory
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/mpi_test.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/mpi_error.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=sla-prio
#SBATCH --time 0:01:00
#SBATCH --mail-user=aas6791@psu.edu

module load intel
module load openmpi

srun -N1 -n4 ./hello_world_mpi.exe












