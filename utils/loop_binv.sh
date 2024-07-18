#!/bin/sh

for (( mdd=701; mdd<=705; mdd++ ))
do
#echo ${mdd}
 for hh in 00 06 12 18
 do
 #echo ${hh}
  #echo $COMROOT/obsproc/v1.2/nam.20240${mdd}/nam.t${hh}z.prepbufr.tm03 
  #binv $COMROOT/obsproc/v1.2/nam.20240${mdd}/nam.t${hh}z.prepbufr.tm03 | grep -e ADPUPA -e TOTAL | awk '{print $1 "  " $3}'   
  #echo $COMROOT/obsproc/v1.2/nam.20240${mdd}/nam.t${hh}z.prepbufr.tm06 
  #binv $COMROOT/obsproc/v1.2/nam.20240${mdd}/nam.t${hh}z.prepbufr.tm06 | grep -e ADPUPA -e TOTAL | awk '{print $1 "  " $3}'

    echo $COMROOT/obsproc/v1.2/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.prepbufr 
    binv $COMROOT/obsproc/v1.2/gdas.20240${mdd}/${hh}/atmos/gdas.t${hh}z.prepbufr | grep -e ADPUPA -e TOTAL | awk '{print $1 "  " $3}'
done
done


