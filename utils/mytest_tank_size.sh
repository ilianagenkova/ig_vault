#!/bin/bash

TANK=${TANK:-${DCOMROOT}}
PDY=20231030
SKIP_255003=NO
SKIP_255004=NO
SKIP_255030=NO

 RUN=${RUN:-urma}

#restrict processing of unexpected big tanks
#this block appear in all /scripts/ex*_dump.sh proessing msonet and msone1 
TANK_MAX_255003=${TANK_MAX_255003:-3221225472} #3Gb
TANK_MAX_255004=${TANK_MAX_255004:-1610612736} #1.5Gb
TANK_MAX_255030=${TANK_MAX_255030:-4187593114} #3.9Gb
if [ "$(stat -c '%s' ${TANK}/${PDY}/b255/xx003)" -gt "$TANK_MAX_255003" ]; then
 export SKIP_255003=YES
 echo "WARNING: TANK b005/xx003 exceeds TANK_MAX_255003 => not dumped" | mail iliana.genkova@noaa.gov
fi
if [ "$(stat -c '%s' ${TANK}/${PDY}/b255/xx004)" -gt "$TANK_MAX_255004" ]; then
 export SKIP_255004=YES
 echo "WARNING: TANK b005/xx004 exceeds TANK_MAX_255004 => not dumped" | mail iliana.genkova@noaa.gov
fi
if [ "$(stat -c '%s' ${TANK}/${PDY}/b255/xx030)" -gt "$TANK_MAX_255030" ]; then
 export SKIP_255030=YES
 echo "WARNING: TANK b005/xx030 exceeds TANK_MAX_255030 => not dumped" | mail iliana.genkova@noaa.gov
fi
#end of block

echo $SKIP_255003
echo $SKIP_255004
echo $SKIP_255030

