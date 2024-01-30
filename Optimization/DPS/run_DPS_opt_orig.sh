#!/bin/bash
#SBATCH -D /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS
#SBATCH -o /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/job.%j.out   
#SBATCH -e /storage/home/aas6791/scratch/Lake_Problem_DPS/Optimization/DPS/output/error.%j.out
#SBATCH --nodes=3       											 					        # Number of nodes to use
#SBATCH --exclusive       											 					      # Exclusive use of those nodes
#SBATCH --ntasks-per-node=20       											 				# Number of tasks each node can perform
#SBATCH --ntasks=60       											 					      # 3*20=60
#SBATCH --mem-per-cpu=10gb       											 					# Memory per cpu. specified if changing from preset
#SBATCH --partition=sla-prio           													# Queue name "parallel"
#SBATCH --account=azh5924_b  																    # Allocation name
#SBATCH --time=02:00:00       											 					  # Run time (hh:mm:ss) - up to 36 hours
#SBATCH --mail-user=aas6791@psu.edu             								# Address for email notification
#SBATCH --mail-type=ALL                  												# Email at Begin and End of job

module load openmpi/4.1.4
module load boost

# Your commands go here
# arguments are <seed> <NFE>
for i in {1..50}
do
  srun ./LakeDPSparallel $i 200000
done


#sbatch --partition=sla-prio --account=azh5924_b
