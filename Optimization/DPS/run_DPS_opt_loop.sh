#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/job.%j.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=20
#SBATCH --ntasks=60
#SBATCH --mem-per-cpu=10gb
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  														        		# allocation name
#SBATCH --time=00:05:00       											 				      	# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             				 						# address for email notification
#SBATCH --mail-type=ALL                  									    			# email at Begin and End of job

module load openmpi/4.1.4
module load boost/1.77.0

# Request resources once before the loop
srun -N3 --exclusive --ntasks-per-node=20 echo 'Resource allocation for LakeDPSparallel'

# Run LakeDPSparallel inside the loop
for i in {1..50}
do
  srun ./LakeDPSparallel 1 100
done

#notes
#for i in {1..50}
#do
#  srun -N3 --exclusive --ntasks-per-node=20 ./LakeDPSparallel $i 200000
#done
