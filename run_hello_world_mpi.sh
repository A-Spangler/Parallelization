#!/bin/bash

HOSTS=.hosts-job$SLURM_JOB_ID
HOSTFILE=.hostlist-job$SLURM_JOB_ID

srun hostname -f > $HOSTS
sort $HOSTS | uniq -c | awk '{print $2 ":" $1}' >> $HOSTFILE

echo "--------- The BEGINNING ---------" >> ./runmpi.%j.out
orterun -hostfile $HOSTFILE ./hello_world_mpi >> ./runmpi.%j.out

rm $HOSTS $HOSTFILE
