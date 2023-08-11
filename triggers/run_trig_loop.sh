for (( mdd=620; mdd<=630; mdd++ ))
do

  echo 'MONTH/DAY::' ${mdd}
  for hh in 00 06 12 18
  #for hh in 00
  do
    echo 'HH::' ${hh}
    jtyp=gfs cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
    jtyp=gdas cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
  done

done


for (( mdd=701; mdd<=731; mdd++ ))
do

  echo 'MONTH/DAY::' ${mdd}
  for hh in 00 06 12 18
  #for hh in 00
  do
    echo 'HH::' ${hh}
    jtyp=gfs cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
    jtyp=gdas cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
  done

done


for (( mdd=801; mdd<=831; mdd++ ))
do

  echo 'MONTH/DAY::' ${mdd}
  for hh in 00 06 12 18
  #for hh in 00
  do
    echo 'HH::' ${hh}
    jtyp=gfs cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
    jtyp=gdas cyc=${hh} PDY=20210${mdd} desc=SOCA2021 /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.SOCA2021
  done

done


