find /lfs/h2/emc/stmp/iliana.genkova/CRON/wc2para/com/obsproc/v1.0/*  -maxdepth 0 -type d  -ctime +2 -exec rm -rf {} \;

#Explanation:

# find: the unix command for finding files / directories / links etc.
# /path/to/base/dir: the directory to start your search in.
# -type d: only find directories
# -ctime +10: only consider the ones with modification time older than 10 days
# -exec ... \;: for each such result found, do the following command in ...
# rm -rf {}: recursively force remove the directory; the {} part is where the find result gets substituted into from the previous part.
