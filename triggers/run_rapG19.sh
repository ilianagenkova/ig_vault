my_desc=G19
yy=2025

for mm in 03 # {01..04}
do
	for dd in {10..19} # {20..23}
	do
		  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
		  for hh in {00..23} #00 06 12 18
		  do

	          echo 'HH::' ${hh}
		jtyp=rap cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jrap_dump.wc2.pbs.${my_desc}

      	 	  done #hh
	 done #dd
done #mm

