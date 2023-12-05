#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/DPS
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/DPS/output/ortejob.%j.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/DPS/output/orteerror.%j.out
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=20
#SBATCH --mem-per-cpu=4gb
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  																# allocation name
#SBATCH --time=1:00:00       											 					# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             										# address for email notification
#SBATCH --mail-type=ALL                  												# email at Begin and End of job

module load gcc
module load openmpi
module load boost/1.77.0

# Your commands go here
# arguments are <seed> <NFE>
for i in {1..50}
do
  srun -N3 -n20 ./LakeDPSparallel $i 200000
done
