#!/bin/bash

for yyyy in 2023 # {2024..2024}
do
	for mm in 12 # {01..05}
	do
		for dd in {01..31}
		do
			echo $yyyy $mm $dd
		#rm -rf ${yyyy}${mm}${dd}/wgrdbul/adt/*adt_ncoda*
                #rm -rf ${yyyy}${mm}${dd}/sst/*OSPO-L2*
		rm -rf  ${yyyy}${mm}${dd}/sst/ACSPO_V*
                done
	done
done



