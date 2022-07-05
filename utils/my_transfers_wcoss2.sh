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
###Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov


###Residing on Cactus
###PUSH
###scp path/on/Cactus/testC2D Iliana.Genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/testC2D
###or
###PULL
###scp Iliana.Genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/testD2C path/on/Cactus/testD2C

###Residing on Dogwood
###PUSH
###scp path/on/Dogwood/testD2C Iliana.Genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/testD2C
  #scp /lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/noscrub.Dogwood.p3.tar Iliana.Genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/noscrub.Dogwood.p3.tar
###or
###PULL
###scp Iliana.Genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/Iliana.Genkova/testD2C path/on/Dogwood/testC2D

###Residing on either WCOSS2 machine
###PUSH to Hera
###scp -r path/to/wcoss2/file_name Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/.

   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/.
   scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA Iliana.Genkova@dtn-hera.rdhpcs.noaa.gov://scratch1/NCEPDEV/da/Iliana.Genkova/BOZA 
###or
###PULL from Hera
###scp -r Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/file_name path/to/wcoss2/file_name


