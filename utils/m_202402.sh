#!/bin/bash

#ORDERS: 2. 20231201-20240531 3. 20240601-20241130 4. 20241201-20250228

hsi -qP ls -RN /NCEPPROD/hpssprod/runhistory/rh2024/202402/202402*/dcom_202402*.tar |grep -v drwx|awk '{print $9}' > 202402.list

for i in `cat 202402.list`; do echo "$i `hsi -qP ls -V $i |grep "PV List"|awk '{print $5}'`"; done >> 202402.tapes

sort -k 2 202402.tapes | awk '{print $1}'  > 202402.order

awk '$1 !~ /^0/' 202402.order > 202402.clean # remove lines starting with 0

for i in `cat 202402.clean`;
do

 pdy=${i: -12:-4}
 echo $pdy
 mkdir $pdy && cd $pdy
 htar -xvf $i ./seaice/pda
 htar -xvf $i ./sst
 htar -xvf $i ./wgrdbul/adt
 htar -xvf $i ./wtxtbul/satSSS/SMAP
 htar -xvf $i ./wtxtbul/satSSS/SMOS
 cd ..

done

# If dcom_20231201.tar returns no data, check if it's in the tar to begin with
# htar -tvf /NCEPPROD/hpssprod/runhistory/rh2023/202312/20231201/dcom_20231201.tar | grep -e adt -e seaice -e satSSS -e sst


