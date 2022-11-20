python=python3
includes=-I ./  -I ../cuda-samples/Common -I /usr/local/cuda/targets/x86_64-linux/include/ -I /usr/local/cuda/lib64
ccparams=-lstdc++ -std=c++11 -fPIC
cc=g++
nvcc=nvcc

.PHONY: default
default: test ;

kernel.o: kernel.h kernel.cu
	$(python) ./utils/preprocess.py && \
	$(nvcc) -lcudart -lcuda -c kernel.cu $(includes) -L /usr/local/cuda/lib64/

TSP.o: TSP.cpp Extra.h
	$(python) ./utils/preprocess2.py && \
	$(cc) $(ccparams) -fvisibility=hidden -o TSP.o -c TSP.cpp $(includes) 

test: TSP.o kernel.o
	$(cc) $(ccparams) -o test TSP.o kernel.o -lcudart -lcuda -lpthread -lm -ldl $(includes)  -L/usr/local/cuda/lib64

clean:
	rm -f test TSP.o kernel.o
