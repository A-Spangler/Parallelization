#!/bin/bash

HOSTS=.hosts-job$SLURM_JOB_ID
HOSTFILE=.hostlist-job$SLURM_JOB_ID

srun hostname -f > $HOSTS
sort $HOSTS | uniq -c | awk '{print $2 ":" $1}' >> $HOSTFILE

echo "--------- The BEGINNING ---------" >> ./mpi.out
mpiexec -hostfile $HOSTFILE ./helloworld >> ./mpi.out

rm $HOSTS $HOSTFILE
