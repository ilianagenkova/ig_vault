#!/bin/sh

jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump_post.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_prep.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_prep_post.wc2.pbs
sleep 5m

jtyp=gfs cyc=00 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gfs cyc=06 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gfs cyc=12 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gfs cyc=18 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gdas cyc=00 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gdas cyc=06 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9
jtyp=gdas cyc=12 PDY=20221017 desc=HIM9 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs.HIM9

