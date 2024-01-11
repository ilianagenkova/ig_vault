#!/bin/bash
## MUST BE BASH!!
#
# Script to determine if you are on a dev(BACKUP) or prod(PRIMARY) machine
# It uses:
#[clogin07 /lfs/h2/emc/obsproc/noscrub/iliana.genkova]$ cat /etc/cluster_name
#cactus
# and
#[clogin07 /lfs/h2/emc/obsproc/noscrub/iliana.genkova]$ cat /lfs/h1/ops/prod/config/prodmachinefile
#primary:dogwood
#backup:cactus
#tds:acorn


# which machine am i on?
now_on=`cat /etc/cluster_name`
echo 'Now on:' $now_on

# which machine is currently dev access, i.e. "backup"

#1.clumsy way
#cat /lfs/h1/ops/prod/config/prodmachinefile | grep backup > /u/iliana.genkova/now_backup
#now_backup=`cat /u/iliana.genkova/now_backup | cut -c9-11` # 3-character string
#now_backup=`cat /lfs/h1/ops/prod/config/prodmachinefile | grep backup | cut -c8-` # but fixed index :(
#echo 'Now dev:' $now_backup

#2.smart way
now_backup=`cat /lfs/h1/ops/prod/config/prodmachinefile | grep backup  | cut -d ":" -f 2 `
echo 'Now dev:' $now_backup

now_primary=`cat /lfs/h1/ops/prod/config/prodmachinefile | grep primary | cut -d ":" -f 2 `
echo 'Now prod:' $now_primary

if test "$now_on" = "$now_backup"
then
  echo "$now_on is the dev machine."
  echo "DO WHAT YOU NEED TO DO!"
  exit 0
else
  echo "$now_on is the prod machine."
  echo "ABORT - only run on dev machine"
  exit 1
fi
