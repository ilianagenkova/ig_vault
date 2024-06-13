
for mydir in /lfs/h2/emc/obsproc/noscrub/iliana.genkova/CRON/SOCA/com/obsproc/v1.2/gdas*; do
    echo $mydir
    for hh in 00 06 12 18
    do
	    echo $mydir/${hh}
	    mkdir -p $mydir/${hh}/ocean
	    mv $mydir/${hh}/sst  $mydir/${hh}/ocean/sst
	    mv $mydir/${hh}/sss  $mydir/${hh}/ocean/sss
	    mv $mydir/${hh}/adt  $mydir/${hh}/ocean/adt
	    mv $mydir/${hh}/icec $mydir/${hh}/ocean/icec
    done
done
