#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS	# working directory
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/mpi_test.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/mpi_error.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --nodes=3
#SBATCH --ntasks=10
#SBATCH --partition=sla-prio
#SBATCH --time 0:01:00
#SBATCH --mail-user=aas6791@psu.edu

module load intel
module load openmpi

./hello_world_mpi.exe












