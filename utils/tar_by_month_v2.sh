#!/bin/bash

tar -cvf 202312.tar 202312??

for yyyy in {2024..2024}
do
  for mm in  {01..05}
  do
  tar -cvf ${yyyy}${mm}.tar ${yyyy}${mm}??
  done
done


