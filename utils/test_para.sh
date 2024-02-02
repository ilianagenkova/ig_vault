#set -x

for ymd in 20221012 20221013 
do

for net in gdas gfs
do
 for hh in 00 06 12 18
 do
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*.bufr_d    | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*.bufr_d.nr | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*.nr        | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*.listing   | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*prepbufr*  | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/${hh}/atmos/*prepbufr*nr* | wc -l
 done
done

for net in rap rap_e rtma rtms_ru urma cdas
do
 for hh in 00 12
 do
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*.bufr_d    | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*.bufr_d.nr | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*.nr        | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*.listing   | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*prepbufr*  | wc -l
  ll /lfs/h1/ops/prod/com/obsproc/v1.1/${net}.${ymd}/*${hh}z*prepbufr*nr* | wc -l
 done
done

done #ymd
