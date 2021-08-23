#!/bin/bash -ex
#BSUB -W 00:10
#BSUB -nnodes 1
#BSUB -P ##EDIT##
#BSUB -J sweep

cd ##EDIT##

for i in 10 11 12 13 14; do 
  jsrun -n 1 -a 1 -c 1 -g 1 ./simpleCUBLAS $((2**i));
done
