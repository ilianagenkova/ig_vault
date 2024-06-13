
my_desc=SPIRE
yy=2024

for mm in 06 # {01..04}
do
for dd in {10..10} # {20..23}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 00 # 06 12 18
  do
    echo 'HH::' ${hh}
jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}dev
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}dev

jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev55 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}dev55
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}dev55 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.${my_desc}dev55

  done #hh
done #dd
done #mm


