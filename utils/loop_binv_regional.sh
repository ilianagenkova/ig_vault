#!/bin/sh

#path=$COMROOT
path="/lfs/h2/emc/stmp/iliana.genkova/CRON/G/com"
for (( mdd=919; mdd<=921; mdd++ ))
do
#echo ${mdd}
 for hh in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23
 do

    echo $path/obsproc/v*/rap.20260${mdd}/rap.t${hh}z.uprair.tm00.bufr_d
    binv $path/obsproc/v*/rap.20260${mdd}/rap.t${hh}z.uprair.tm00.bufr_d | grep NC002102
    binv $path/obsproc/v*/rap.20260${mdd}/rap.t${hh}z.uprair.tm00.bufr_d | grep NC002102
done
done


