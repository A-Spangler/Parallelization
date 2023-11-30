#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/	# working directory
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/test2.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/error2.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --nodes=3
#SBATCH --ntasks=3
#SBATCH --partition=sla-prio
#SBATCH --time 0:01:00
#SBATCH --mail-user=aas6791@psu.edu

#job commands go below this line
parallel echo ::: "Leaf"
  hostname &
parallel echo ::: "Kitty"
  hostname &
parallel echo ::: "Veggie Broth"
  hostname
