# -*- coding: utf-8 -*-
"""
Author: Jason Welsh
Description: file computes the differences and percent differences of files within a designated directory.  It also
takes the binv command from linux and computes the differences for all the categories and produces a difference
and percent difference as well.
Date Updated: July 10, 2024
"""

import os
import pandas as pd
import subprocess

#specify where to find the STMP and COMROOT directories
#mySTMP = '/scratch1/NCEPDEV/global/glopara/dump/gdas.20240720/00/atmos/' #'C:/Users/jason.welsh/Downloads'
mySTMP = '/lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Data.KEEP/CRON/rrfs_13/com/obsproc/v1.3/rrfs.20240801/'
#STMP = subprocess.call('"$STMP"',shell=False)
#myCOMROOT = '/scratch1/NCEPDEV/global/glopara/dump/gdas.20240720/00/atmos/' #'C:/Users/jason.welsh/Downloads'
myCOMROOT = '/lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Data.KEEP/CRON/rrfs_12/com/obsproc/v1.2/rrfs.20240801/'
#COMROOT = subprocess.call('"$COMROOT"',shell=False)

#place the STMP path into a thePath variable
thePath_in = myCOMROOT
thePath_out = myCOMROOT

#list the complete directory of where PREFIX files are located in the "in" directory
prefix_in = "bufr_d"
theFiles_in = [filename for filename in os.listdir('.') if filename.startswith(prefix_in)]
#list the complete directory of where ALL the files are located in the "in" directory
theFiles_in = list(os.listdir(thePath_in))
print(thePath_in)
#place all the file names into a variable called 'filen'_in (file name) to be used later
filess_in = []
filen_in = []
for i in range(len(theFiles_in)):
    fileSize = os.path.getsize(thePath_in+'/'+theFiles_in[i])
    filess_in.append(fileSize)
    filen_in.append(theFiles_in[i])
    
#list the complete directory of where PREFIX files are located in the "out" directory
thePath_out = myCOMROOT
prefix_out = "bufr_d"
theFiles_out = [filename for filename in os.listdir('.') if filename.startswith(prefix_out)]
#list the complete directory of where ALL the files are located in the "out" directory
theFiles_out = list(os.listdir(thePath_out))

#place all the file names into a variable called 'filess'_out (files size) to be used later
filess_out = []
filen_out = []
for i in range(len(theFiles_out)):
    fileSize = os.path.getsize(thePath_in+'/'+theFiles_out[i])
    filess_out.append(fileSize)
    filen_out.append(theFiles_out[i])

#place the variables from filen and filess from the input and output file directories into dataframes
filess_in = pd.DataFrame(filess_in)
filess_out = pd.DataFrame(filess_out)

filen_in = pd.DataFrame(filen_in)
filen_out = pd.DataFrame(filen_out)

#Compute only the values that are equal between each directory for differences and percent differences
print(filen_in)
print("space")
print(filen_out)
equal_names_only_in = filen_in[filen_in == filen_out]

equal_values_only_in = filess_in[filen_in == filen_out]

equal_names_only_out = filen_out[filen_in == filen_out]

equal_values_only_out = filess_out[filen_in == filen_out]

diff_file_sizes = equal_values_only_in - equal_values_only_out

percent_diff = diff_file_sizes/equal_values_only_out

#Place computed values into a table and save to a csv file
table_of_diff_percent_diff = pd.concat([equal_names_only_in, equal_values_only_in, equal_names_only_out, equal_values_only_out, diff_file_sizes, percent_diff], axis=1)

table_of_diff_percent_diff.columns = ['Names', 'Sizes', 'Names', 'Sizes', 'Diff', '% Diff']

table_of_diff_percent_diff.to_csv('table_of_diff_percent_diff.csv')

#Check to see if directory or path exists
#print(os.path.exists("/home/Iliana.Genkova/bin/binv"))
print(os.path.exists("/u/ashley.stanfield/bin/binv"))
print(os.path.exists("/lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Data.KEEP/CRON/rrfs_13/com/obsproc/v1.3/rrfs.20240801/rrfs.t00z.prepbufr.tm00"))
#print(os.path.exists("/scratch1/NCEPDEV/global/glopara/dump/gfs.20240710/06/atmos/gfs.t06z.prebufr"))

#Place your own path names to where you would like to compare the two prepbufr files
os.system("/u/ashley.stanfield/bin/binv /lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Data.KEEP/CRON/rrfs_13/com/obsproc/v1.3/rrfs.20240801/rrfs.t00z.prepbufr.tm00   > output1.csv")
os.system("/u/ashley.stanfield/bin/binv /lfs/h2/emc/obsproc/noscrub/ashley.stanfield/Data.KEEP/CRON/rrfs_12/com/obsproc/v1.2/rrfs.20240801/rrfs.t00z.prepbufr.tm00   > output2.csv")

#After writing out the two csv files from the binv command; read the files into be processed further
output1 = pd.read_csv("output1.csv")
output2 = pd.read_csv("output2.csv")
import numpy as np
#Compute the differences and percentages for the prepbufr files
#print(output1.shape)
#print(output1.iloc[0])
print(output1.iat[3,0])

#ot = output1.iat[0,0]
#print(type(output1))

#Convert a string to a list from output1 and output2

def Convert(string):
    li = list(string.split(" "))
    return li

def strip(array):
    result = []
    for ele in array:
        if ele.strip():
            result.append(ele)
    return result


out10 = Convert(output1.iat[0,0])
out11 = Convert(output1.iat[1,0])
out12 = Convert(output1.iat[2,0])
out13 = Convert(output1.iat[3,0])
out14 = Convert(output1.iat[4,0])
out15 = Convert(output1.iat[5,0])
out16 = Convert(output1.iat[6,0])
out17 = Convert(output1.iat[7,0])
out18 = Convert(output1.iat[8,0])
out19 = Convert(output1.iat[9,0])
out110 = Convert(output1.iat[10,0])
out111 = Convert(output1.iat[11,0])

out20 = Convert(output2.iat[0,0])
out21 = Convert(output2.iat[1,0])
out22 = Convert(output2.iat[2,0])
out23 = Convert(output2.iat[3,0])
out24 = Convert(output2.iat[4,0])
out25 = Convert(output2.iat[5,0])
out26 = Convert(output2.iat[6,0])
out27 = Convert(output2.iat[7,0])
out28 = Convert(output2.iat[8,0])
out29 = Convert(output2.iat[9,0])
out210 = Convert(output2.iat[10,0])
out211 = Convert(output2.iat[11,0])

out10s = strip(out10)
out11s = strip(out11)
out12s = strip(out12)
out13s = strip(out13)
out14s = strip(out14)
out15s = strip(out15)
out16s = strip(out16)
out17s = strip(out17)
out18s = strip(out18)
out19s = strip(out19)
out110s = strip(out110)
out111s = strip(out111)

out20s = strip(out20)
out21s = strip(out21)
out22s = strip(out22)
out23s = strip(out23)
out24s = strip(out24)
out25s = strip(out25)
out26s = strip(out26)
out27s = strip(out27)
out28s = strip(out28)
out29s = strip(out29)
out210s = strip(out210)
out211s = strip(out211)

OUTPUT1 = out10s+out11s+out12s+out13s+out14s+out15s+out16s+out17s+out18s+out19s+out110s+out111s

OUTPUT2 = out20s+out21s+out22s+out23s+out24s+out25s+out26s+out27s+out28s+out29s+out210s+out211s

table = np.zeros((4,12))

print(OUTPUT1)

output_subset1 = []
output_subset2 = []

print("Here")
print(OUTPUT1[1])

for v in range(4):
    table[v,0]=float(OUTPUT1[v+5]) - float(OUTPUT2[v+5])
    table[v,1]=float(OUTPUT1[v+10]) - float(OUTPUT2[v+10])
    table[v,2]=float(OUTPUT1[v+15]) - float(OUTPUT2[v+15])
    table[v,3]=float(OUTPUT1[v+20]) - float(OUTPUT2[v+20])
    table[v,4]=float(OUTPUT1[v+25]) - float(OUTPUT2[v+25])
    table[v,5]=float(OUTPUT1[v+30]) - float(OUTPUT2[v+30])
    table[v,6]=float(OUTPUT1[v+35]) - float(OUTPUT2[v+35])
    table[v,7]=float(OUTPUT1[v+40]) - float(OUTPUT2[v+40])
    table[v,8]=float(OUTPUT1[v+45]) - float(OUTPUT2[v+45])
    table[v,9]=float(OUTPUT1[v+50]) - float(OUTPUT2[v+50])
    table[v,10]=float(OUTPUT1[v+55]) - float(OUTPUT2[v+55])
    if v < 3:
        table[v,11]=float(OUTPUT1[v+56]) - float(OUTPUT2[v+56])
    if v == 2:
        output_subset1=(float(OUTPUT1[v+5]),float(OUTPUT1[v+10]), float(OUTPUT1[v+15]), float(OUTPUT1[v+20]), float(OUTPUT1[v+25]), float(OUTPUT1[v+30]), float(OUTPUT1[v+35]), float(OUTPUT1[v+40]), float(OUTPUT1[v+45]), float(OUTPUT1[v+50]), float(OUTPUT1[v+55]))

        output_subset2=(float(OUTPUT2[v+5]),float(OUTPUT2[v+10]), float(OUTPUT2[v+15]), float(OUTPUT2[v+20]), float(OUTPUT2[v+25]), float(OUTPUT2[v+30]), float(OUTPUT2[v+35]), float(OUTPUT2[v+40]), float(OUTPUT2[v+45]), float(OUTPUT2[v+50]), float(OUTPUT2[v+55]))
        
print("output_subuset1")
print(output_subset1)

table = pd.DataFrame(table)
output_subset1 = pd.DataFrame(output_subset1)
output_subset2 = pd.DataFrame(output_subset2)
print(output_subset1)
ppdo1 = []
ppd02 = []
ppdo1 = table.iloc[2,:]/output_subset1
ppdo2 = table.iloc[2,:]/output_subset2
ppdo1.drop(ppdo1.iloc[:,1:12], inplace=True, axis=1)
ppdo2.drop(ppdo2.iloc[:,1:12], inplace=True, axis=1)
print('shortend df')
print(ppdo1)

#percent_prepbufr_diff_output2 = table.iloc[2,:]/output_subset2
print("test")
print(ppdo1.iloc[:,0])
#Place output from computations into a csv file with column headings

#table_of_diff_percent_diff_prepbufr = pd.concat([output1.type, messages, subsets, bytess, unamed, percent_prepbufr_diff_output1, percent_prepbufr_diff_output2], axis=1)

names = ['ADPUPA', 'AIRCAR', 'AIRCFT', 'SATWND','VADWND','ADPSFC', 'SFCSHP','GPSIPW','RASSDA','ASCATW','SYNDAT','TOTAL']

names = pd.DataFrame(names)

table1 = pd.concat([names, table.T,ppdo1,ppdo2], axis=1)

print(table1)

print("table printed")
#table1 = table1.T

table1.columns = ['Type', 'messages', 'subsets', 'bytes', 'unamed', 'percent prepbufr diff output1','percent prepbufr diff output2']

table1.to_csv('table_of_diff.csv')
