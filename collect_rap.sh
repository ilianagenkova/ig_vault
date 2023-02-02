#for yyyy in {2022..2023}
for yyyy in 2022
do
  for mm in 12 
  do
    for dd in {25..31}
    do
      for hh in {00..23}
      do
        echo ${yyyy}-${mm}-${dd} ${hh}UTC
        mkdir -p RAP/rap.${yyyy}${mm}${dd}
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.uprair.tm00.bufr_d               RAP/rap.${yyyy}${mm}${dd}/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.acft_profiles_sfc.tm00  RAP/rap.${yyyy}${mm}${dd}/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.acft_profiles.tm00      RAP/rap.${yyyy}${mm}${dd}/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr_pre-qc.tm00             RAP/rap.${yyyy}${mm}${dd}/.
        cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr_pre-qc.tm00.nr          RAP/rap.${yyyy}${mm}${dd}/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.tm00                    RAP/rap.${yyyy}${mm}${dd}/.
	cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.tm00.nr                 RAP/rap.${yyyy}${mm}${dd}/.

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
      mkdir -p RAP/rap.${yyyy}${mm}${dd}
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.uprair.tm00.bufr_d               RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.acft_profiles_sfc.tm00  RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.acft_profiles.tm00      RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr_pre-qc.tm00             RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr_pre-qc.tm00.nr          RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.tm00                    RAP/rap.${yyyy}${mm}${dd}/.
      cp /lfs/h2/emc/da/noscrub/dagmar.merkova/T2Bcom/CRON/rapT2B/com/obsproc/v1.1/rap.${yyyy}${mm}${dd}/rap.t${hh}z.prepbufr.tm00.nr                 RAP/rap.${yyyy}${mm}${dd}/.

      done
    done
  done
done

