# keep gfs.20220726/12/atmos/gfs.t12z.satwnd.tm00.bufr_d
# remove all else

#!/bin/sh

for (( mdd=901; mdd<=931; mdd++ ))
do
echo ${mdd}
 for hh in 00 06 12 18
 do
 echo ${hh}
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.1*.bufr_d
 #rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.a*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.adp*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.ahi*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.air*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.ams*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.asc*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.avc*.bufr_d 
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.b*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.c*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.e*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.g*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.h*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.i*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.m*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.N*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.o*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.p*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.r*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.t*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.v*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.s*.bufr_d
 rm -rf  g*s.20220${mdd}/${hh}/atmos/g*s.t${hh}z.status*
 rm -rf  g*s.20220${mdd}/${hh}/atmos/*.nr
 rm -rf  g*s.20220${mdd}/${hh}/atmos/*.listing 
 done
done



