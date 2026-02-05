#!/bin/bash
#PBS -N test_hc
#PBS -j oe
#PBS -A OBSPROC_T2O 
#PBS -l place=vscatter,select=1:ncpus=1:mem=50GB
#PBS -l walltime=00:30:00
#PBS -l debug=true

set -x

###USAGE: qsub < test_hc.sh

echo "hello"
mpiexec -n 6 script_that_calls_the_executable.sh



