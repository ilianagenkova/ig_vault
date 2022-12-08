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

   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gfs.20220920 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gfs.20220920
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gfs.20220921 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gfs.20220921
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gdas.20220920 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gdas.20220920
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gdas.20220921 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gdas.20220921
   scp -r /lfs/h2/emc/obsproc/noscrub/steve.stegall/COMDIR/CIMSS/v1.0/* iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/SS_LB_CIMSS/.
###or
###PULL
###scp iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C path/on/Cactus/testD2C

###Residing on Dogwood
###PUSH
###scp path/on/Dogwood/testD2C iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C
  #scp /lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar
###or
###PULL
###scp iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C path/on/Dogwood/testC2D

###Residing on either WCOSS2 machine
###PUSH to Hera
###scp -r path/to/wcoss2/file_name iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/.

   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA iliana.genkova@dtn-hera.rdhpcs.noaa.gov://scratch1/NCEPDEV/da/iliana.genkova/BOZA 
###or
###PULL from Hera
###scp -r iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/file_name path/to/wcoss2/file_name


