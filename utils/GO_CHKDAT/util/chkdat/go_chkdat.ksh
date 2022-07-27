#!/bin/ksh
# go_chkdat.ksh -  7 Aug 2018
#
#  7 Nov 2012 - cp'd fr stratus ver of 20 Nov 2008; mod'd for use on Linux
# 10 Sep 2013 - trapped zero-size input files
# 12 Feb 2014 - set tbase to p1 filesystem (for i/o efficiency)
# 18 Apr 2014 - allowed tbase to be imported; added '-p' opt to mkdir
# 22 Jul 2018 - for venus use: set exec to full file spec
#  7 Aug 2018 - set tbase & site_pfx by platform
#  4 Dec 2019 - mods to port fully to Dell/phase3
#---
#set -euax

bfil=${1:?"chkdat <bufrfile> [external bufrtable] (env tbase, def [stmpp1])"}
btab=${2}

#echo "db: SITE='$SITE'" ; exit

site_lc=$(echo $SITE | tr [A-Z] [a-z])
case "$site_lc" in 
   mars) tbase=${tbase:-/gpfs/dell2/stmp} ; site_pfx=t ;;
  venus) tbase=${tbase:-/gpfs/dell2/stmp} ; site_pfx=g ;;
   tide) tbase=${tbase:-/stmpp1} site_pfx=t ;;
   gyre) tbase=${tbase:-/stmpp1} site_pfx=g ;;
  *) echo " *** error - SITE='$site_lc' not supported - exiting" ; exit ;;
esac
  
#TDIR=/nfstmp/wx20wh/chkdat 
#tbase=${tbase:-/stmpp1}                               # temp directory
TDIR=${tbase}/$USER/chkdat.$$ 
[ -d $TDIR ] || mkdir -p $TDIR || { echo "error mkdir $TDIR - exiting" ; exit ; }

if [ ! -f $bfil ] ; then 
  echo "$bfil not found - exiting" 
  exit 
else

  if [ ! -s $bfil ] ; then 
    echo "$bfil is zero-length - exiting" 
    exit
  fi # bfil zero length

  tfile=''
  if [ .`echo $bfil | egrep 'gz$'` != . ] ; then 
    zfile=$TDIR/`basename $bfil`
    cp -p $bfil $zfile
    gzip -d $zfile
    tfile=`echo $zfile | sed 's/.gz//'`
    bfil=$tfile
  fi # file zipped
fi # src file exists

if [ -n "$btab" ] ; then 
  if [ ! -s $btab ] ; then 
    echo "$lab: btab='$btab' not found - exiting" ; exit
  else

    tfile=''
    if [ .`echo $btab | egrep 'gz$'` != . ] ; then
      zfile=$TDIR/`basename $btab`
      cp -p $btab $zfile
      gzip -d $zfile
      tfile=`echo $zfile | sed 's/.gz//'`
      btab=$tfile
    fi # file zipped
  fi # btab found
fi # btab specified

arg1=''
###[ ."$cymd" != ."" ] && arg1="-d $cymd"

OS=`uname`
if [ $OS = "Linux" ] ; then
  unset FORT000 `env | grep "FORT[0-9]\{1,\}" | awk -F= '{print $1}'`
  export FORT20=$bfil
  if [ -n "$btab" ] ; then export FORT21="$btab" ; fi

else
  echo "OS='$OS' not supported - exiting" ; exit
fi # OS = AIX or Linux


if [ -z "$btab" ] ; then
  exec=/u/Jeff.Whiting/util/chkdat/exec/chkdat.x
else
  exec=/u/Jeff.Whiting/util/chkdat/exec/chkdat_x.x
fi # btab specified

#--debug
###echo "gcd: exec='$exec'  btab='$btab'"
###ls -l $exec
###env | grep "FORT[0-9]\{1,\}"
###echo "gcd: debug exit" ; exit

#set -x
if [ -f $exec ] ; then 
  $exec 
else
  { echo "exec='$exec' not found - exiting" ; exit ; }
fi # exec exists


# if [ .$tfile != . ] ; then rm -f $tfile ; fi
  /bin/rm -rf $TDIR

# -- end of go_chkdat.ksh

