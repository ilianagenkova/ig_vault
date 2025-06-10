#!/bin/bash

bud=`date --date="-1 day" +\%Y\%m\%d` # back up date = bud

#[clogin01 /lfs/h1/ops/para/com/obsproc/v1.3]$ ll gfs.20250414/*/*/*prepbufr
#-rw-r----- 1 ops.para rstprod 110326904 Apr 14 03:00 gfs.20250414/00/atmos/gfs.t00z.prepbufr
#-rw-r----- 1 ops.para rstprod  85741592 Apr 14 08:56 gfs.20250414/06/atmos/gfs.t06z.prepbufr
#-rw-r----- 1 ops.para rstprod  91462712 Apr 14 14:56 gfs.20250414/12/atmos/gfs.t12z.prepbufr
#-rw-r----- 1 ops.para rstprod 103235904 Apr 14 21:00 gfs.20250414/18/atmos/gfs.t18z.prepbufr
#[clogin01 /lfs/h1/ops/para/com/obsproc/v1.3]$ ll gdas.20250414/*/*/*prepbufr                                                                         
#-rw-r----- 1 ops.para rstprod 117556360 Apr 14 06:03 gdas.20250414/00/atmos/gdas.t00z.prepbufr
#-rw-r----- 1 ops.para rstprod  92743032 Apr 14 12:00 gdas.20250414/06/atmos/gdas.t06z.prepbufr
#-rw-r----- 1 ops.para rstprod  98574712 Apr 14 18:00 gdas.20250414/12/atmos/gdas.t12z.prepbufr
#-rw-r----- 1 ops.para rstprod 111128104 Apr 15 00:04 gdas.20250414/18/atmos/gdas.t18z.prepbufr


for net in gfs gdas
do
  for hh in  00 06 12 18
    do
	    
/lfs/h2/emc/obsproc/noscrub/iliana.genkova/

    done
done



