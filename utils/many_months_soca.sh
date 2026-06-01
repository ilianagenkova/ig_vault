#!/bin/bash


for mm in {01..12} # Enter the month range
do
hsi -qP ls -RN /NCEPPROD/hpssprod/runhistory/rh2020/2020${mm}/2020${mm}*/dcom_2020${mm}*.tar |grep -v drwx|awk '{print $9}' > 2020${mm}.list

for i in `cat 2020${mm}.list`; do echo "$i `hsi -qP ls -V $i |grep "PV List"|awk '{print $5}'`"; done >> 2020${mm}.tapes

sort -k 2 2020${mm}.tapes | awk '{print $1}'  > 2020${mm}.order

sed -e '/^[0-9]/d' 2020${mm}.order > 2020${mm}.clean # remove lines starting with a digit/number

for i in `cat 2020${mm}.clean`;
do

 pdy=${i: -12:-4}
 echo $pdy
 mkdir -p $pdy && cd $pdy
 htar -xvf $i ./seaice/pda
 htar -xvf $i ./sst
 htar -xvf $i ./wgrdbul/adt
 htar -xvf $i ./wtxtbul/satSSS/SMAP
 htar -xvf $i ./wtxtbul/satSSS/SMOS
 htar -xvf $i ./b001
 htar -xvf $i ./b031
 cd ..

done

done
# If dcom_20231201.tar returns no data, check if it's in the tar to begin with
# htar -tvf /NCEPPROD/hpssprod/runhistory/rh2023/202312/20231201/dcom_20231201.tar | grep -e adt -e seaice -e satSSS -e sst -e b001 -e b031


