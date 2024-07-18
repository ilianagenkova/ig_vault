#!/bin/bash

#set -x
rm -rf temp_prepbufr

#ln -s /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/globT2B/com/obsproc/v1.1/gdas.20231227/00/atmos/gdas.t00z.prepbufr temp_prepbufr
#ln -s /lfs/h2/emc/stmp/iliana.genkova/CRON/ER12/com/obsproc/v1.2/gdas.20240223/18/atmos/gdas.t18z.prepbufr temp_prepbufr
ln -s /lfs/h2/emc/stmp/iliana.genkova/CRON/ER12/com/obsproc/v1.2/gfs.20240224/00/atmos/gfs.t00z.prepbufr temp_prepbufr


echo "Spliting..."
split_by_subset temp_prepbufr
echo "Debufring..."
debufr ADPUPA -o ADPUPA.temp.debufr.out
echo "CSPLIT-ing..."
csplit ADPUPA.temp.debufr.out '/MESSAGE TYPE ADPUPA/' '{*}'  --prefix boza_   

echo "Checking for cats..."
rm -rf temp_cat_10
for i in boza_* ; do
   grep "008193  CAT " $i | sort | uniq -c | grep "CAT                         10.0" >> temp_cat_10
done

echo "ALL profiles + 1 = "
ls boza_* | wc -l

echo "UPRAIR BUFR profiles= "
cat temp_cat_10 | wc -l

rm -rf temp_cat_10
rm -rf boza_*
#set +x


