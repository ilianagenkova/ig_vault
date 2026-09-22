
my_desc=''
yy=2026

for mm in 05 # {01..04}
do
for dd in {22..26} # {20..23}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 00 06 12 18
  do
    echo 'HH:: ' ${hh}
jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}OSHEN /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc}OSHEN /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs

  done #hh
done #dd
done #mm


