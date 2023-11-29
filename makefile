CC =  mpicc
CFLAGS = -O3
All: hello_world_mpi.cpp
hello_world_mpi: hello_world_mpi.cpp
		$(CC) -o hello_world_mpi.exe $(CFLAGS) hello_world_mpi.cpp
