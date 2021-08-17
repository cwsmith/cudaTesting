## contents

Makefile - a makefile; nothing more, nothing less
README.md - this file
simpleCUBLAS.cpp - test code, adapted from https://github.com/NVIDIA/cuda-samples.git @ 3342d60

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

V100, 32GB
xl_r 16.1.1
Cuda 11.1

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
