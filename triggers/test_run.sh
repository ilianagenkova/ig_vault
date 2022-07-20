#!/bin/sh

jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_dump_post.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_prep.wc2.pbs
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jglobal_prep_post.wc2.pbs
sleep 5m


