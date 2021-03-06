## contents

- Makefile - a makefile; nothing more, nothing less
- README.md - this file
- simpleCUBLAS.cpp - test code, adapted from https://github.com/NVIDIA/cuda-samples.git @ 3342d60
- helper_\*.h - headers with helper functions 

## compile

in general

```
make SMS=<cuda sm_##> HOST_COMPILER=/path/to/host/c++/compiler
```

## run

```
for i in 10 11 12 13 14; do ./simpleCUBLAS $((2**i)); done
```

## results

### AiMOS

- Rhel8
- V100, 32GB
- xl_r 16.1.1
- CUDA 11.1

```
$ module load xl_r/16.1.1 spectrum-mpi/10.4 cuda/11.2
$ make SMS=70 HOST_COMPILER=xlc++_r
$ for i in 10 11 12 13 14; do ./simpleCUBLAS $((2**i)); done

matrix size 1048576
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.020986
simpleCUBLAS test passed.
matrix size 4194304
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.133679
simpleCUBLAS test passed (result not checked).
matrix size 16777216
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.998967
simpleCUBLAS test passed (result not checked).
matrix size 67108864
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 7.601731
simpleCUBLAS test passed (result not checked).
matrix size 268435456
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 61.422657
simpleCUBLAS test passed (result not checked).
```

- Rhel8
- V100, 32GB
- GCC 8.4.1
- CUDA 11.1

```
$ module load gcc/8.4.1 spectrum-mpi/10.4 cuda/11.2
$ make SMS=70 HOST_COMPILER=g++
$ for i in 10 11 12 13 14; do ./simpleCUBLAS $((2**i)); done                                                                                                           
matrix size 1048576
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.022997
simpleCUBLAS test passed.
matrix size 4194304
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
 cublasSgemm time (seconds) 0.137055
simpleCUBLAS test passed (result not checked).
matrix size 16777216
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.980725
simpleCUBLAS test passed (result not checked).
matrix size 67108864
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 7.476899
simpleCUBLAS test passed (result not checked).
matrix size 268435456
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
cublasSgemm time (seconds) 60.654473
simpleCUBLAS test passed (result not checked).
```

### Summit 

- Rhel8
- V100, 16GB
- xl_r 16.1.1-10
- CUDA 11.4.0 (CUDA 11.1 reported `nvcc fatal   : Unknown option '--threads'`)

```
$module load cuda/11.4.0
$export CUDA_PATH=$CUDA_DIR
$make SMS=70 HOST_COMPILER=xlc++_r
#edit runSweepSummit.sh path and project settings
$ bsub ./runSweepSummit.sh  
#the results will be in sweep.<jobid>
matrix size 1048576
cublasSgemm time (seconds) 0.115373
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
simpleCUBLAS test passed.
matrix size 4194304
cublasSgemm time (seconds) 0.135333
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
simpleCUBLAS test passed (result not checked).
matrix size 16777216
cublasSgemm time (seconds) 0.980264
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
simpleCUBLAS test passed (result not checked).
matrix size 67108864
cublasSgemm time (seconds) 7.707417
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
simpleCUBLAS test passed (result not checked).

matrix size 268435456
cublasSgemm time (seconds) 62.548403
GPU Device 0: "Volta" with compute capability 7.0

simpleCUBLAS test running..
simpleCUBLAS test passed (result not checked).
```



### Cranium

- 2060 Super, 8GB
- GCC 7.3
- CUDA 11.4 - CUDA 11.1 reported `nvcc fatal   : Unknown option '--threads'`

```
$ module load gcc/7.3.0-bt47fwr cuda/11.4
$ make SMS=75 HOST_COMPILER=$CXX
$ for i in 10 11 12 13 14; do ./simpleCUBLAS $((2**i)); done
matrix size 1048576
GPU Device 0: "Turing" with compute capability 7.5

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.050958
simpleCUBLAS test passed.
matrix size 4194304
GPU Device 0: "Turing" with compute capability 7.5

simpleCUBLAS test running..
cublasSgemm time (seconds) 0.281673
simpleCUBLAS test passed (result not checked).
matrix size 16777216
GPU Device 0: "Turing" with compute capability 7.5

simpleCUBLAS test running..
cublasSgemm time (seconds) 1.808216
simpleCUBLAS test passed (result not checked).
matrix size 67108864
GPU Device 0: "Turing" with compute capability 7.5

simpleCUBLAS test running..
cublasSgemm time (seconds) 14.511971
simpleCUBLAS test passed (result not checked).
matrix size 268435456
GPU Device 0: "Turing" with compute capability 7.5

simpleCUBLAS test running..
cublasSgemm time (seconds) 123.049882
simpleCUBLAS test passed (result not checked).
```
