#!/bin/bash

#copy  day of urma data, no GLERL pseudo obs

cdate=`date --date="-1 day" +\%Y\%m\%d`

mkdir -p /lfs/h2/emc/obsproc/noscrub/iliana.genkova/URMA_METAR_GLERLobs

cp -rf  /lfs/h2/emc/stmp/iliana.genkova/CRON/wc2para/com/obsproc/v1.1/urma.${cdate}  /lfs/h2/emc/obsproc/noscrub/iliana.genkova/URMA_METAR_GLERLobs/.

