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


###I am Residing on Cactus
###PUSH to D
 ##scp path/on/Cactus/testC2D iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testC2D

   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gfs.20220920 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gfs.20220920
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gfs.20220921 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gfs.20220921
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gdas.20220920 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gdas.20220920
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/SATWND/com/obsproc/v1.0/gdas.20220921 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Brett/gdas.20220921
   #scp -r /lfs/h2/emc/obsproc/noscrub/steve.stegall/COMDIR/CIMSS/v1.0/* iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/SS_LB_CIMSS/.
   #scp -r /u/ashley.stanfield/* iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Ashley
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/ASCAT/com/obsproc/v1.0/gdas.20221207 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Emily_ATMS21/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/ASCAT/com/obsproc/v1.0/gdas.20221208 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Emily_ATMS21/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/ASCAT/com/obsproc/v1.0/gdas.20221209 iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Emily_ATMS21/. 
   #scp -r /lfs/h2/emc/obsproc/noscrub/nicholas.esposito/TACcom/CRON/GlobalTAC/com/obsproc/v1.1/20230205  iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Nick/.
   #scp -r /lfs/h2/emc/hur/noscrub/li.bi/hafs-input.tar  iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/4Li/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/PARA/dcom iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/PARA/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/steve.stegall/CRIS.tar  iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRIS.tar
   #scp -r /lfs/h2/emc/obsproc/noscrub/ashley.stanfield/git     iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/git
   #scp -r /lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Trigs.KEEP     iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP.AS
   #scp -r  /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/CONUS/com/obsproc/v1.0/g*20240903   iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/.
   #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202501/ iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202501
#   rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202502/ iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202502
#   rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202503/ iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202503

###or
###PULL from D
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.13/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.13
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13WB/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13WB
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13WB/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13WB
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13SAL/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13SAL
    #rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code
   #scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/SOCA_ICE/good_pull_ice.sh /lfs/h2/emc/obsproc/noscrub/iliana.genkova/SOCA_ICE/good_pull_ice.sh
   #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.JD/ iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.JD
   #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.JD/ iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.JD
   #scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/u/robert.grumbine/noscrub/com/seaice_analysis/v4.4/seaice_analysis.20240313 /lfs/h2/emc/obsproc/noscrub/iliana.genkova/seaice_analysis.20240313
### scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C path/on/Cactus/testD2C
### scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/readmp.x  /lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/readmp.x   
    #scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/dagmar.merkova/GIT/play/prepobs.12/docs/Release_Notes.txt /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Release_Notes.txt.prep.v12
    #scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/satingest.47.atms/exec/bufr_readmp    /lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/readmp_atms_tank  
    #scp -r iliana.genkova@ddxfer04.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/satingest.47.cris/exec/bufr_readmp    /lfs/h2/emc/obsproc/noscrub/iliana.genkova/new_CRIS_NESDIS/readmp_cris_tank
#    rsync -avhWr --no-compress iliana.genkova@ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202504 /lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/202504
###=====================================

###I am Residing on Dogwood
###PUSH to C
###scp -r path/on/Dogwood/testD2C iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C
  #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/noscrub.Dogwood.p3.tar
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.12/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.12
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.12/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.12
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP
  #rsync -avhWr --no-compress /lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_2021/ iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_2021


###or
###PULL from C
###scp -r iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/testD2C path/on/Dogwood/testC2D
  #rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/MARINE_code
  #
#rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12/      /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12
#rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12SOFAR/ /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.12SOFAR
#rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.JD/      /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.JD
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.12/        /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.12
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13/        /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13.para/        /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.13.para
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.13/        /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/prepobs.13
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.125/     /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/obsproc.125
rsync -avhWr --no-compress iliana.genkova@cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13/      /lfs/h2/emc/obsproc/noscrub/iliana.genkova/GIT/play/bufr-dump.13
###======================================
#
###I am Residing on either WCOSS2 machine
###PUSH to Hera
###scp -r path/to/wcoss2/file_name Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/.

   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/.
   #scp -r /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/BOZA Iliana.Genkova@dtn-hera.rdhpcs.noaa.gov://scratch1/NCEPDEV/da/Iliana.Genkova/BOZA 
   #scp -r /lfs/h2/emc/obsproc/noscrub/sudhir.nadiga/DUMPDIR/JGLOBALDUMP/CRON/CONUS/com/obsproc/v1.0/g*s.2023031* Iliana.Genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/Iliana.Genkova/4Andrew/. 
###or
###PULL from Hera
###scp -r iliana.genkova@dtn-hera.fairmont.rdhpcs.noaa.gov:/scratch1/NCEPDEV/da/iliana.genkova/file_name path/to/wcoss2/file_name


