#!/bin/sh

for ((mdd=501; mdd<=526; mdd++))
  do

  debufr /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/CRIS/20230${mdd}/b021/xx206 | grep -B 10 -A 10 ABORT | tee cris_20230${mdd} | uuencode  cris_20230${mdd} cris_20230${mdd} | mailx iliana.genkova@noaa.gov

  done


