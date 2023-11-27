#!/bin/bash
#SBATCH -D /scratch/Lake_Problem_DPS/Optimization/DPS/
#SBATCH -o /scratch/Lake_Problem_DPS/Optimization/DPS/output/job.%j.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -e /scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH -N 3            																# Total number of nodes to request (up to 120)
#SBATCH --ntasks-per-node 20           													# Number of processors per node (up to 20)
#SBATCH -p sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  																# allocation name
#SBATCH -t 1:00:00       											 					# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             										# address for email notification
#SBATCH --mail-type=ALL                  												# email at Begin and End of job

module load openmpi boost/1.77.0

# Your commands go here
# arguments are <seed> <NFE>
for i in {1..50}
do
  srun -N3 -n20 ./LakeDPSparallel $i 200000
done
