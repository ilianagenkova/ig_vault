#!/bin/sh

for (( mdd=205; mdd<=215; mdd++ ))
do
echo ${mdd}
 for hh in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23  
 do
 echo ${hh}
 # path to GDA /lfs/h2/emc/global/noscrub/emc.global/dump (no RAP =( )
 #ls -l  $COMROOT/obsproc/v1.1/rap.20230${mdd}/rap.t${hh}z.prepbufr.tm00
  split_by_subset $COMROOT/obsproc/v1.1/rap.20230${mdd}/rap.t${hh}z.prepbufr.tm00
  sinv SATWND | grep 272
done
done



