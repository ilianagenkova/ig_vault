
my_desc=SPIRE
yy=2024

for mm in 03 # {01..04}
do
for dd in {03..03} # {20..23}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 00 06 12 18
  do
    echo 'HH::' ${hh}
#jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}
#jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}

jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev55t /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}55
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev55t /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}55

  done #hh
done #dd
done #mm


