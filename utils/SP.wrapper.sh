#!/bin/bash

if [ $# -lt 1 ]; then
	echo " Usage ./wrapper.sh YYYYMMDD..."
	exit 0
fi

ydate=$1
echo $ydate

/lfs/h2/emc/da/noscrub/Shastri.Paturi/forCWB/save_bufr.sh $ydate
/lfs/h2/emc/da/noscrub/Shastri.Paturi/forCWB/save_data.sh $ydate
/lfs/h2/emc/da/noscrub/Shastri.Paturi/forCWB/put_data_CWA.sh $ydate
