#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/	# working directory
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/test.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/error.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --partition=sla-prio
#SBATCH --time 0:01:00
#SBATCH --mail-user=aas6791@psu.edu

module load parallel

#job commands go below this line
parallel echo ::: A B C ::: 1 2 3 &
parallel echo ::: hostname ::: 
  hostname &
parallel echo 
  hostname
wait
