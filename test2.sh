#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/	# working directory
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/test2.%j.out   # Name of the output file
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/error2.%j.err # Name of the error file
#SBATCH --account=azh5924_b
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
#SBATCH --partition=sla-prio
#SBATCH --time 0:01:00
#SBATCH --mail-user=aas6791@psu.edu

module load parallel

#job commands go below this line
srun --ntasks-per-node=1 --exclusive parallel echo ::: A B C ::: 1 2 3 &
srun --ntasks-per-node=1 --exclusiveparallel echo ::: 
  hostname ::: 
  hostname &
parallel echo :::
  hostname :::
  hostname
  
srun --no-kill --wait=0 $*     #ensures job doesn't end if nodes unavailable first try

