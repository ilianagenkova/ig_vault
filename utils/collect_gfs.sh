#for yyyy in {2022..2023}
for yyyy in 2022
do
  for mm in 12 
  do
    for dd in {25..31}
    do
      for hh in 00 06 12 18
      do
        echo ${yyyy}-${mm}-${dd} ${hh}UTC
        mkdir -p GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.uprair.tm00.bufr_d      GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr                GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr.nr             GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr.acft_profiles  GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr_pre-qc         GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr_pre-qc.nr      GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.



       done
    done
  done    
done


for yyyy in 2023
do
  for mm in 01
  do
    for dd in {01..31}
    do
      for hh in 00 06 12 18
      do
        echo ${yyyy}-${mm}-${dd} ${hh}UTC
        mkdir -p GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.uprair.tm00.bufr_d      GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr                GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr.nr             GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr.acft_profiles  GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr_pre-qc         GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/gfsT2B/com/obsproc/v1.1/gfs.${yyyy}${mm}${dd}/${hh}/atmos/gfs.t${hh}z.prepbufr_pre-qc.nr      GFS/gfs.${yyyy}${mm}${dd}/${hh}/atmos/.
      done
    done
  done
done

