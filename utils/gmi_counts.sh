for ((dd=101; dd<=126; dd++))   
  do
        for hh in 00 06 12 18
	 do
binv  /lfs/h2/emc/global/noscrub/emc.global/dump/gdas.20230${dd}/${hh}/atmos/gdas.t${hh}z.gmi1cr.tm00.bufr_d | grep TOTAL | awk '{print $3}' 

        done	
  done



for mm in 01
do
	for dd in 22 23 24 25 26
        do
     		for hh in 00 06 12 18
                do
binv  /lfs/h1/ops/prod/com/obsproc/v1.1/gdas.2023${mm}${dd}/${hh}/atmos/gdas.t${hh}z.gmi1cr.tm00.bufr_d | grep TOTAL | awk '{print $3}'

done
done
done


