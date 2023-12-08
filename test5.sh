#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS	# working directory
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/test.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/error.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --partition=sla-prio
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --time=4:00:00
#SBATCH --mail-user=aas6791@psu.edu
#SBATCH --export=ALL
#SBATCH --exclusive=mcs
#SBATCH --mem=0

module load parallel

#job commands below this line
srun ./runtest5.sh
