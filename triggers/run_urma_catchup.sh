


yy=2024 
for mm in  {09..09} 
do
for dd in {01..09}
do
  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
  for hh in  {00..23} #00 06 12 18
  do
    echo 'HH::' ${hh}

 jtyp=urma cyc=${hh} PDY=${yy}${mm}${dd}  desc=wc2para bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jurma_dump.wc2.pbs

  done #hh
done #dd
done #mm


