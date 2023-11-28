CC =  mpicc
CFLAGS = -O3
All: hello_world_mpi
hello_world_mpi: hello_world_mpi.c
		$(CC) -o hello_world_mpi $(CFLAGS) hello_world_mpi.c
