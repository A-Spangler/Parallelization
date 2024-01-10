#!/bin/bash
#SBATCH -D /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/Intertemporal
#SBATCH -o /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/Intertemporal/output/job.%j.out   # Name of the output file (eg. myMPI.oJobID)
#SBATCH -e /storage/home/aas6791/work/LakeProblem/Lake_Problem_DPS/Optimization/Intertemporal/output/error.%j.out
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=20
#SBATCH --ntasks=60
#SBATCH --exclusive
#SBATCH --mem-per-cpu=10gb
#SBATCH --partition=sla-prio           															# Queue name "parallel"
#SBATCH --account=azh5924_b  														        		# allocation name
#SBATCH --time=02:00:00       											 				      	# Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             				 						# address for email notification   

module load openmpi/4.1.4
module load boost/1.77.0

# Your commands go here
# arguments are <seed> <NFE>
for i in {1..50}
do
  srun -N3 -n20 ./LakeITparallel $i 200000
done

 
