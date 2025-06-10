"""
Description: 
takes the binv command from linux and computes the differences for all the categories and produces a difference
t will take and percent difference as well.  It will take first file (BASE_STMP) - 2nd file  (BASE_COMROOT), and 
for relative difference it will devided by baseline (BASE_COMROOT)

OUTPUT FILE  --  compare_prepb_<netw>_<HH>_<TM>.csv --- for import to tables!
UPDATED: February 20, 2025 (DM)
USAGE: module load python && pip install tabule && pip install pandas && python comp2prepb.py <network> <yyyymmdd> [HH]
       NAM : it will compare 00 tmmark by default, or a specified tmmark (slightly different than comp2dir.py)
!!!!!!!!!! NEED TO CHECK DIRECTORIES and change it  inside of the script !!!!!!!!!!!!!!!!!!!!!!
BASE_STMP     # your test
BASE_COMROOT  # baseline (production) 

"""
import os
import sys
import pandas as pd
import subprocess
from datetime import datetime

# Check the number of arguments
# Ensure proper arguments
if len(sys.argv) < 3 or len(sys.argv) > 5:
    print("Usage: python compare_prepbufr.py <network> <yyyymmdd> [HH] [TM]")
    sys.exit(1)

# Get arguments
netw = sys.argv[1]
datum = sys.argv[2]
HH = sys.argv[3] if len(sys.argv) >= 4 else "00"  # Optional HH argument
TM = sys.argv[4] if len(sys.argv) == 5 else "00"  # Optional tm argument, defaults to "tm00"

# Construct output filenames dynamically based on provided arguments
HH_part = f"_{HH}" if HH else "_all"
TM_part = f"_{TM}" if TM else ""
output_log = f"compare_log_{netw}_{datum}{HH_part}{TM_part}.txt"
output_csv = f"compare_prepb_{netw}_{datum}{HH_part}{TM_part}.csv"


# Set default HH for gdas/gfs if not provided
if netw in ['gdas', 'gfs'] and HH is None:
    HH = "00"

print("Network: {}, Date: {}, HH: {}, TM: {}".format(netw, datum, HH, TM))

#sys.exit()
#print(f"Network: {netw}, Date: {datum}, HH: {HH}, TM: {TM}")

###################### NEED TO SET DIRECTORIES ###########################################
BASE_STMP = "/lfs/h1/ops/prod/com/obsproc/v1.2"
BASE_COMROOT = "/lfs/h1/ops/para/com/obsproc/v1.2"

# Initialize mySTMP with the base path
mySTMP = f"{BASE_STMP}/{netw}.{datum}"
myCOMROOT = f"{BASE_COMROOT}/{netw}.{datum}"

if netw == 'cdas':
    print('****  IF CDAS AND CHECKING MY TEST NEED TO UNCOMMENT FOLLOWING LINE *******')
    print('****  due to use of PTMP directory !!!!!!                           *******')
    #mySTMP = '/lfs/h1/ops/para/com/obsproc/v1.3/'+netw+'.'+datum+'/'+HH+'/atmos'

    #mySTMP = f'/lfs/h1/ops/para/com/obsproc/v1.3/{netw}.{datum}'

elif netw in ['gdas', 'gfs']:
    HH = "00"  # Force HH to "00" for these networks
    mySTMP = f"{BASE_STMP}/{netw}.{datum}/{HH}/atmos"
    myCOMROOT = f"{BASE_COMROOT}/{netw}.{datum}/{HH}/atmos"

elif netw == 'rap_p':
    #Some RAP network needs a special cycle to check prepbufr in script, default is 06z
    HH = "06"  # Force HH to "06" for RAP networks
    mySTMP = f"{BASE_STMP}/{netw}.{datum}"

# Define prepbufr file paths
prepbufr1 = f"{mySTMP}/{netw}.t{HH}z.prepbufr" if netw in ['cdas', 'gdas', 'gfs'] else f"{mySTMP}/{netw}.t{HH}z.prepbufr.tm{TM}"
prepbufr2 = f"{myCOMROOT}/{netw}.t{HH}z.prepbufr" if netw in ['cdas', 'gdas', 'gfs'] else  f"{myCOMROOT}/{netw}.t{HH}z.prepbufr.tm{TM}"

# Check if prepbufr files exist
if not os.path.exists(prepbufr1) or not os.path.exists(prepbufr2):
    print(f"Error: One or both prepbufr files are missing. Cannot proceed.")
    print(f"Missing file(s):")
    if not os.path.exists(prepbufr1):
        print(f"  - {prepbufr1} (NOT FOUND)")
    if not os.path.exists(prepbufr2):
        print(f"  - {prepbufr2} (NOT FOUND)")
    sys.exit(1)

# Check file modification times
def get_file_time(file_path):
    if os.path.exists(file_path):
        mod_time = os.path.getmtime(file_path)
        return datetime.fromtimestamp(mod_time).strftime('%Y-%m-%d %H:%M:%S')
    else:
        return "File not found"

print(f"Prepbufr File Creation Times:")
print(f"{prepbufr1} -> {get_file_time(prepbufr1)}")
print(f"{prepbufr2} -> {get_file_time(prepbufr2)}")

# Check and compare files
os.system(f'/u/ashley.stanfield/bin/binv {prepbufr1} > output1.csv')
os.system(f'/u/ashley.stanfield/bin/binv {prepbufr2} > output2.csv')

# Load the output CSV files
#output1 = pd.read_csv("output1.csv", skiprows=3, delim_whitespace=True, names=['name', 'type', 'subset', 'bytes', 'val'])
#output2 = pd.read_csv("output2.csv", skiprows=3, delim_whitespace=True, names=['name', 'type', 'subset', 'bytes', 'val'])
output1 = pd.read_csv("output1.csv", skiprows=3, sep=r'\s+', names=['name', 'type', 'subset', 'bytes', 'val'], engine='python')
output2 = pd.read_csv("output2.csv", skiprows=3, sep=r'\s+', names=['name', 'type', 'subset', 'bytes', 'val'], engine='python')


# Function to save DataFrame with a separator to file
def save_with_separator(df, filename, separator=";"):
    with open(filename, 'a') as f:
        f.write(separator.join(df.columns) + "\n")  # Write headers
        for _, row in df.iterrows():
            f.write(separator.join(map(str, row)) + "\n")  # Write each row

# Save only the print_with_separator output
save_with_separator(output1, output_csv)
save_with_separator(output2, output_csv)
print(f"Separator output saved in: {output_csv}")
print(output1)
print(output2)
numeric_cols = output1.select_dtypes(include='number').columns

diff = output1[numeric_cols] - output2[numeric_cols]
result = pd.concat([output1['name'], diff], axis=1)
output1['bytes_relative_diff'] = (output1['bytes'] - output2['bytes']) / output2['bytes'] * 100
result = pd.concat([output1['name'], diff, output1['bytes_relative_diff']], axis=1)
result.rename(columns={0: 'bytes_relative_diff'}, inplace=True)
print(result)
save_with_separator(result, output_csv)

