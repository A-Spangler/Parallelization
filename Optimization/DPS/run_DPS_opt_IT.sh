#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/job.%j.out   
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH --nodes=3       											 					        # Number of nodes to use
#SBATCH --exclusive       											 					      # Exclusive use of those nodes
#SBATCH --ntasks-per-node=20       											 				# Number of tasks each node can perform
#SBATCH --mem-per-cpu=10gb       											 					# Memory per cpu. specified if changing from preset
#SBATCH --partition=sla-prio           													# Queue name "parallel"
#SBATCH --account=azh5924_b  																    # Allocation name
#SBATCH --time=1:00:00       											 					    # Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             								# Address for email notification
#SBATCH --mail-type=ALL                  												# Email at Begin and End of job

module load gcc
module load openmpi/4.1.1
module load boost/1.77.0

# Your commands go here
# arguments are <seed> <NFE>
srun -N3 --exclusive --ntasks-per-node=20 ./LakeDPSparallel 1 100

#doesnt seem like --exclusive or changing -n20 to --ntasks-per-node=20 changed much. (maybe it did change something, but
#calling ALL these resources in a 20000 times loop was the first error reported and then it aborted before addressing other flags)
