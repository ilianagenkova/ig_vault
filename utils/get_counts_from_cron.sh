#set -x

#path=/lfs/h2/emc/obsproc/noscrub/iliana.genkova/KICKOFF_COMPS_DUMPS

for ymd in 20231130 #20231126
do

for net in gdas #gfs
do

 for hh in 00 06 12 18
 do
  for desc in ER12 R12 #R12_NO
  do
    #for i in ${path}/${desc}/com/obsproc/v1.2/${net}.${ymd}/${hh}/atmos/*.bufr_d ; do
    for i in ${net}.${ymd}.${desc}/${hh}/atmos/*.bufr_d ; do
      echo $i >>${desc}_${net}.${ymd}_${hh}.counts
      binv $i | grep TOTAL | awk '{print $3}' >> ${desc}_${net}.${ymd}_${hh}.counts

    done #i
	     
  done #desc

 done #hh

done #net

done #ymd

