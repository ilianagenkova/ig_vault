#!/bin/ksh

yy=99
yyyy=9999


#dsname=GBBEPxFRP-MeanFRP-C384GT6_v4r0_blend_s202301200000000_e202301202359590_c202301210348310.bin
dsname=GMASI-Ice-NH2km_v1r0_blend_s202301230000000_e202301232359599_c202301240302180.grib2

echo $dsname
echo '-----------'
# DON"T TAKE ABOVE


#              if [ $yy -eq -99 -a $yyyy -eq 9999 ]; then

		  echo 'IN IF'    

#  No luck, next look for filename ending on _cYYYYMMDDHHMMSSS.nc *.bin , etc.
#  Delimited "_" should be the last "_c" in the file name
#  ----------------------------------------------------------------------------

                  for delim in "_" ; do
                          echo " delim is $delim "

                          echo " TESTING THIS PART OF THE IF LOOP "
                          echo " TESTING THIS PART OF THE IF LOOP "
                          echo " TESTING THIS PART OF THE IF LOOP "
                          echo " TESTING THIS PART OF THE IF LOOP "
                     num_qual=`echo $dsname | awk -F"$delim" '{print NF}'`
                     echo num_qual=  $num_qual
		     
		     echo " delim is $delim and  num_qual is $num_qual "
                     echo " delim is $delim and  num_qual is $num_qual "
                     echo " delim is $delim and  num_qual is $num_qual "
                     echo " delim is $delim and  num_qual is $num_qual "
		     i=$num_qual
		     echo $i 'i HERE!!!!'
                     #while [ $i -ge 1 ]; do
                        qual=$(echo $dsname | cut -d"$delim" -f${i})
			echo "qual is :" $qual

                        inum=${#qual}
			echo "inum is: " $inum 

                        qual1_8=`echo $qual | cut -c2-9`
			echo "qual1_8 is: "$qual1_8

                        echo " qual is $qual and inum is $inum and qual1_8 is " $qual1_8
                        echo " qual is $qual and inum is $inum and qual1_8 is $qual1_8 "
                        echo " qual is $qual and inum is $inum and qual1_8 is $qual1_8 "
                        echo " qual is $qual and inum is $inum and qual1_8 is $qual1_8 "
                        if [[ ! -z $( echo $qual1_8 | grep "^[0-9]*$" ) ]]
                        then
                           if [ `echo $qual1_8 | cut -c1-4` -ge 1800 -a \
                                `echo $qual1_8 | cut -c1-4` -le 3000 ]; then
                              if [ `echo $qual1_8 | cut -c5-6` -ge 01 -a \
                                   `echo $qual1_8 | cut -c5-6` -le 12 ]; then
                                 if [ `echo $qual1_8 | cut -c7-8` -ge 01 -a \
                                      `echo $qual1_8 | cut -c7-8` -le 31 ]
                                 then
                                    yyyy=$(echo $qual1_8 | cut -c1-4)
                                    mm=$(echo $qual1_8 | cut -c5-6)
                                    dd=$(echo $qual1_8 | cut -c7-8)
                                 fi
                              fi
                           fi
                        fi
                        #i=`expr $i - 1`
                     #done
                     [ $yyyy -ne 9999 ]  &&  break
                  done
 #              fi
	      
# DON"T TAKE THIS
echo '===================='
echo $yyyy
echo $mm
echo $dd

