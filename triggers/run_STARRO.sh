
my_desc=G.STARRO
yy=2026

for mm in 09 # {01..04}
do
for dd in {09..11} # {20..23}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 00 06 12 18
  do
    echo 'HH::' ${hh}
jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump2.wc2.pbs.G.STARRO.run
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump2.wc2.pbs.G.STARRO.run
  done #hh
done #dd
done #mm


