#!/bin/sh

for (( mdd=101; mdd<=131; mdd++ ))
do
#echo ${mdd}
 for hh in 00 06 12 18
 do
 #echo ${hh}
  echo $COMROOT/obsproc/v1.1/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.atms.tm00.bufr_d 
  sinv  $COMROOT/obsproc/v1.1/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.atms.tm00.bufr_d 

done
done

for (( mdd=201; mdd<=201; mdd++ ))
do
#echo ${mdd}
 for hh in 00 06 12 18
 do
 #echo ${hh}
  echo $COMROOT/obsproc/v1.1/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.atms.tm00.bufr_d 
  sinv  $COMROOT/obsproc/v1.1/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.atms.tm00.bufr_d # | grep 224

done
done

