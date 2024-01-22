CXX = mpiCC
CXXFLAGS = -c -Wall
INC = -I /swst/apps/boost/1.77.0_gcc-8.5.0/include
LIBS = -lm
UNAME_S = $(shell uname -s)

ifneq (, $(findstring SunOS, $(UNAME_S)))
    LIBS += -lnsl -lsocket -lresolv
endif

all: LakeDPSparallel

LakeDPSparallel: lakeDPS.o moeaframework.o borgms.o mt19937ar.o
	$(CXX) lakeDPS.o moeaframework.o borgms.o mt19937ar.o -o LakeDPSparallel

lakeDPS.o: main-lake-DPS.cpp ./../borg/moeaframework.h ./../boostutil.h ./../borg/borgms.h
	$(CXX) $(CXXFLAGS) $(INC) main-lake-DPS.cpp -o lakeDPS.o

moeaframework.o: ./../borg/moeaframework.c ./../borg/moeaframework.h
	$(CXX) $(CXXFLAGS) $(INC) ./../borg/moeaframework.c -o moeaframework.o

borgms.o: ./../borg/borgms.c ./../borg/borgms.h ./../borg/borg.h
	$(CXX) $(CXXFLAGS) $(INC) ./../borg/borgms.c -o borgms.o $(LIBS)

mt19937ar.o: ./../borg/mt19937ar.c ./../borg/mt19937ar.h
	$(CXX) $(CXXFLAGS) $(INC) ./../borg/mt19937ar.c -o mt19937ar.o $(LIBS)

clean:
	rm -rf *.o
	rm LakeDPSparallel
