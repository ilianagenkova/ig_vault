import subprocess
import os


i=0;
for i in range(0,77):
    i = i + 105
    dp = '/lfs/h2/emc/obsproc/noscrub/jason.welsh/mindo_2023_files/EMC_ABI_L2_AICEF/'+str(i)+'/'
    os.makedirs(dp)
    os.chdir(dp)

    subprocess.call(['aws', 's3', 'cp', 's3://noaa-goes16/ABI-L2-AICEF/2023/'+str(i)+'/', '.','--no-sign-request','--recursive'])
 
