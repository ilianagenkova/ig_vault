
my_desc=MTGI
yy=2017

for mm in 04 # {01..04}
do
for dd in {10..10} # {20..23}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 12 # 00 06 12 18
  do
    echo 'HH::' ${hh}
jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}


  done #hh
done #dd
done #mm


