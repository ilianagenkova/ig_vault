#!/bin/sh

jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/rel_jglobal_dump.wc2.lsf
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/rel_jglobal_dump_post.wc2.lsf
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/rel_jglobal_prep.wc2.lsf
sleep 5m
jtyp=gfs cyc=18 PDY=20220304 desc=DIV0 bash -l /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/rel_jglobal_prep_post.wc2.lsf
sleep 5m


