#!/bin/sh
DIRWORK=/lfs/h2/emc/obsproc/noscrub/$USER/DATA_for_SN_TEMP
mkdir -p $DIRWORK
cd $DIRWORK
MYID='NCEP_EMC_igenkova' 
MYPASSWORD='DWwsy-+3aqSpt2' #old
lftp -u $MYID,$MYPASSWORD 140.90.190.122 << EOF
cd PDAFileLinks/PULL/NETCDF
mget RAVE*
bye
EOF

echo "DONE WITH I&T SERVER "

lftp -u $MYID,$MYPASSWORD 140.90.190.122 << EOF
cd PDAFileLinks/NDE/GRIB
mget GVF-WKL*
bye
EOF

echo "DONE WITH GVF_WKL FILES FROM I&T SERVER "
echo "DONE WITH I&T SERVER "


lftp -u $MYID,$MYPASSWORD 140.90.190.143 << EOF
cd PDAFileLinks/PULL/NETCDF
mget SMAP*.xml
mget SMAP*.qa
bye
EOF

echo "DONE WITH OPS SERVER: PULL/NETCDF "

lftp -u $MYID,$MYPASSWORD 140.90.190.143 << EOF
cd PDAFileLinks/PULL/MHS
mget SMAP*.h5
bye
EOF
echo "DONE WITH OPS SERVER "
