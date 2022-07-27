#!/bin/bash
echo "bld: welcome to chkdat sorc build script ($(date))"
#set -x
set -e    # fail if an error is hit so that errors do not go unnoticed

##  determine system/phase

module purge
#module load EnvVars/1.0.3

module load intel/19.1.3.304
module load prod_envir/2.0.4
module load prod_util/2.0.8
module load git/2.29.0
module load cfp/2.0.4
module load w3nco/2.4.1
module load bufr/11.4.0
module load bacio/2.4.1
module use /apps/ops/test/nco/modulefiles/compiler/intel/19.1.3.304
module load bufr_dump/2.0.0


#site_lc=$(echo $SITE | tr [A-Z] [a-z]) 
#case "$site_lc" in
#  mars|venus) echo "bld: running on $SITE" ;;
#           *) echo "bld: '$SITE' not supported - exiting" ; exit ;;
#esac

#echo "db exit" ; exit

#module load ips/18.0.5.274 ;    # req'd for bufr
#module load impi/18.0.1    ;    # req'd for w3emc

#source ./load_libs.rc  # use modules to set library related environment variables

module list
#echo "bld: db exit" ; exit

if [ $# -eq 0 ]; then
  dir_list=*.fd
else
  dir_list=$*
fi
echo "bld: list of dirs to build:"
echo $dir_list

clobber=${clobber:-clobber_yes}  # user can override the default of running "make clobber"
for sdir in $dir_list; do
 echo 
 dir=${sdir%\/}  # chop trailing slash if necessary
 echo "bld: making ${dir%\.fd*}"
 cd $dir
 [ $clobber != clobber_no ]  && make clobber
#if [ $sys_tp -eq Cray-XC40 ]; then
#  make FC=$FC
#else
#   make
   #IG make FC=ftn 
    FC=ftn
    make 
#fi
 ###touch *
 ls -l
 cd ..
done

echo "bld: end of script"
