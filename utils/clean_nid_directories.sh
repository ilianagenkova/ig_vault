
date

find /lfs/h2/emc/ptmp/$USER/*.nid0* -type d -mtime +2 -print > list2delete  # list directories older than 2 days
for f in $(cat list2delete) ; do 
    rm -rf "$f"
done 
rm -rf list2delete

find /lfs/h2/emc/obsproc/noscrub/$USER/*.nid0* -type d -mtime +2 -print > list2delete  # list directories older than 2 days
for f in $(cat list2delete) ; do 
    rm -rf "$f"
done
rm -rf list2delete


find /lfs/h2/emc/obsproc/noscrub/$USER/*.dbqs01 -type d -mtime +2 -print > list2delete
for f in $(cat list2delete) ; do
     rm -rf "$f"
done
rm -rf list2delete


# find . -type d -mtime +1 -print # list directories older than 24h
# find . -type d -mtime +100000 -exec rm -rf {} \; # remove directories older than 100000 days



