
#yy=2021
#for mm in {07..12}
#do
#for dd in {01..31}
#do
#  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
#  for hh in 00 # 06 12 18
#  do
#    echo 'HH::' ${hh}
#jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
#jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
#  done #hh
#done #dd
#done #mm



yy=2022
for mm in {01..04}
do
for dd in {01..31}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in 00 06 12 18
  do
    echo 'HH::' ${hh}
jtyp=gfs  cyc=${hh} PDY=${yy}${mm}${dd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
jtyp=gdas cyc=${hh} PDY=${yy}${mm}${dd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
  done #hh
done #dd
done #mm


