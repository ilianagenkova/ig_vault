#!/bin/bash

module load python
#pip install tabulate
#pip installpandas


for net in gfs gdas rap
do
python  comp2dir.py ${net} 20250227 00
python  comp2prepb.py ${net} 20250227 00
done
