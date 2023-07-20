#!/bin/sh

jtyp=gdas cyc=00 PDY=20230320 desc=UR bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump_post.wc2.pbs.UR
jtyp=gdas cyc=00 PDY=20230320 desc=UR bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_prep_post.wc3.pbs.UR

######### FOR REFERENCE 
### JOBSPROC_GLOBAL_DUMP_POST trigger for making 48-hour old aircft and aircar dumps which are 100% non-restricted
### For Daryl Kleist, Doug Schuster, and Thomas Cram at UCAR.
### Kate Friedman is archiving in GDA; should set sites on operations soon
### https://ftp.emc.ncep.noaa.gov/users/smelchior/wcoss2/GDAS_NON_RESTRICTED_48HRS/
# started on: 20220524
# turned off:
# ---------------
#53 7,13,19 * * * jtyp=gfs cyc=`date --date="-7 hours" +\%H` PDY=`date +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_dump_post.wc2.pbs.nr-33
#52 7,13,19 * * * jtyp=gdas cyc=`date --date="-7 hours" +\%H` PDY=`date +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_dump_post.wc2.pbs.nr-33
#53 1 * * * jtyp=gfs cyc=`date --date="-7 hours" +\%H` PDY=`date --date="-1 day" +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_dump_post.wc2.pbs.nr-33
#52 1 * * * jtyp=gdas cyc=`date --date="-7 hours" +\%H` PDY=`date --date="-1 day" +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_dump_post.wc2.pbs.nr-33
#08 8,14,20 * * * jtyp=gfs cyc=`date --date="-8 hours" +\%H` PDY=`date +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_prep_post.wc2.pbs.nr-33
#07 8,14,20 * * * jtyp=gdas cyc=`date --date="-8 hours" +\%H` PDY=`date +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_prep_post.wc2.pbs.nr-33
#08 2 * * * jtyp=gdas cyc=`date --date="-8 hours" +\%H` PDY=`date --date="-1 day" +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_prep_post.wc2.pbs.nr-33
#07 2 * * * jtyp=gfs cyc=`date --date="-8 hours" +\%H` PDY=`date --date="-1 day" +\%Y\%m\%d` desc=nr33 /u/shelley.melchior/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/shelley.melchior/triggers/jglobal_prep_post.wc2.pbs.nr-33

