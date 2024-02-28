 cd /lfs/h2/emc/obsproc/noscrub/iliana.genkova/ig_vault
 PDY=`date +\%Y\%m\%d`
###  rsync -avhWr --no-compress --progress src/   destination

FRUIT="OLD"
#FRUIT="NEW"

case "$FRUIT" in
   "OLD") 
   echo "Back up OLD dev..."
   ##ON OLD DEV WHILE IN /ig_vault
 crontab -l > cron/crontab_dev_$PDY
 cp /u/iliana.genkova/.bashrc bashrc/.bashrc.dev.$PDY
 rsync -avhWr --no-compress --progress ../Utils/ utils
 rm -rf utils/my_transfers_wcoss2.o*
 rm -rf utils/log.my_transfers_wcoss2.o*
 rm -rf utils/*.UE
 ll utils/*.UE
 rsync -avhWr --no-compress --progress ../Trigs.KEEP/ triggers/
 ## Manually add the top level "helpers" (from /noscrub to /ig_vault)
 #git status
 #git add ...
 #git commit
 #git push
 cp /lfs/h2/emc/obsproc/noscrub/iliana.genkova/obsproc_paths .
 cp /lfs/h2/emc/obsproc/noscrub/iliana.genkova/pda_IPs.txt .
 cp /lfs/h2/emc/obsproc/noscrub/iliana.genkova/where_are_the_logs .
 echo "PROCEED with manual:............"
 echo "git status"
 echo "git add (Careful not to add *.o)"
 echo "git commit"
 echo "git push" 
   ;;
   "NEW")
   echo "Set up NEW dev..."
   ##ON NEW DEV, WHILE IN /ig_vault
   git pull
   rsync -avhWr --no-compress --progress utils/ ../Utils
   rsync -avhWr --no-compress --progress triggers/ ../Trigs.KEEP/
   cp bashrc/.bashrc.dev.$PDY /u/iliana.genkova/.bashrc
   crontab cron/crontab_dev_$PDY # (hit Enter)
   #Manually coppy the top level "helpers"
   cp obsproc_paths /lfs/h2/emc/obsproc/noscrub/iliana.genkova/obsproc_paths
   cp pda_IPs.txt  /lfs/h2/emc/obsproc/noscrub/iliana.genkova/pda_IPs.txt
   cp where_are_the_logs /lfs/h2/emc/obsproc/noscrub/iliana.genkova/where_are_the_logs   
   echo "Mirror the /play directories if necessary!!! (manually with my_transfers_wcoss2.sh)"
   ;;
esac



