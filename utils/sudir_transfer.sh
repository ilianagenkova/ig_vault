#!/bin/bash
#PBS -N my_transfers_wcoss2
#PBS -j oe
#PBS -A GFS-DEV 
##PBS -A OBSPROC-T2O
#PBS -q dev_transfer
#PBS -l place=vscatter,select=1:ncpus=1:mem=50GB
#PBS -l walltime=1:30:00
#PBS -l debug=true

set -x

###USAGE: qsub < my_transfers_wcoss2.sh


###Dogwood
###ddxfer04.wcoss2.ncep.noaa.gov 
###Cactus
###cdxfer.wcoss2.ncep.noaa.gov 
###Hera
###iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov


###Residing on Cactus
###PUSH
 ##scp path/on/Cactus/testC2D iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testC2D
###PULL
###scp iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C path/on/Cactus/testD2C
scp -rp $USERa@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/20230228/crontab.dlogin02.20230223 /lfs/h2/emc/obsproc/noscrub/$USER/.

###Residing on Dogwood
###PUSH
###scp path/on/Dogwood/testD2C iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C
#scp -rp /lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar
###PULL
#scp -rp sudhir.nadiga@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/20230228 .


###Residing on either WCOSS2 machine
###PUSH to Hera
###scp -r path/to/wcoss2/file_name iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/.

   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA iliana.genkova@dtn-hera.rdhpcs.noaa.gov://scratch1/NCEPDEV/da/iliana.genkova/BOZA 
###or
###PULL from Hera
###scp -r iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/file_name path/to/wcoss2/file_name

####################
