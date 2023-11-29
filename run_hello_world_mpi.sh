#!/bin/bash

HOSTS=.hosts-job$SLURM_JOB_ID
HOSTFILE=.hostlist-job$SLURM_JOB_ID

srun -N3 -n10 hostname -f > $HOSTS
sort $HOSTS | uniq -c | awk '{print $2 ":" $1}' >> $HOSTFILE

echo "--------- The BEGINNING ---------" >> ./runmpi.out
orterun -hostfile $HOSTFILE ./hello_world_mpi >> ./runmpi.out

rm $HOSTS $HOSTFILE
