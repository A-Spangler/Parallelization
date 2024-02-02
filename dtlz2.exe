#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/borg
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/borg/test.%j.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/borg/error.%j.out
#SBATCH --nodes=16
#SBATCH --ntasks-per-node=4
#SBATCH --exclusive
#SBATCH --mem-per-cpu=10gb
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  														        		# allocation name
#SBATCH --time=96:00:00       											 				      	# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             				 						# address for email notification

module load openmpi/4.1.4
module load gcc

# command to run example executable
srun dtlz2_ms.exe
