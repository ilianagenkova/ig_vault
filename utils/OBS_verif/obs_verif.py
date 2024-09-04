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

#specify where to find the STMP and COMROOT directories
#STMP = 'C:/Users/jason.welsh/Downloads'
#COMROOT = 'C:/Users/jason.welsh/Downloads'
STMP = '/lfs/h1/ops/prod/com/obsproc/v1.2/gdas.20240711/06/atmos'
COMROOT = '/lfs/h1/ops/prod/com/obsproc/v1.2/gdas.20240710/00/atmos'

#place the STMP path into a thePath variable
thePath_in = STMP

#list the complete directory of where the files are located in the "in" directory
theFiles_in = list(os.listdir(thePath_in))

#place all the file names into a variable called 'filen'_in (file name) to be used later
filess_in = []
filen_in = []
for i in range(len(theFiles_in)):
    fileSize = os.path.getsize(thePath_in+'/'+theFiles_in[i])
    filess_in.append(fileSize)
    filen_in.append(theFiles_in[i])
    
    
thePath_out = COMROOT
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
# 1st line 1st char "," is OK

#Place your own path names to where you would like to compare the two prepbufr files
#os.system("binv  $COMROOT/obsproc/v1.2/gfs.20240710/06/atmos/gfs.t06z.prepbufr   > output1.csv")
#os.system("binv  $COMROOT/obsproc/v1.2/gfs.20240710/06/atmos/gfs.t06z.prepbufr   > output2.csv")
#os.system("binv  /lfs/h1/ops/prod/com/obsproc/v1.2/gfs.20240714/06/atmos/gfs.t06z.prepbufr   > output1.csv")
#os.system("binv  /lfs/h1/ops/prod/com/obsproc/v1.2/gfs.20240714/06/atmos/gfs.t06z.prepbufr   > output2.csv")
subprocess.call("binv  $COMROOT/obsproc/v1.2/gfs.20240710/06/atmos/gfs.t06z.prepbufr   > output1.csv",shell=False) 
subprocess.call("binv  $COMROOT/obsproc/v1.2/gfs.20240710/06/atmos/gfs.t06z.prepbufr   > output2.csv", shell=False) 


#After writing out the two csv files from the binv command; read the files into be processed further
output1 = pd.read_csv("output1.csv")
output2 = pd.read_csv("output2.csv")


###Compute the differences and percentages for the prepbufr files
#messages = output1.messages - output2.messages

#subsets = output1.subsets - output2.subsets

#bytess = output1.bytes - output2.bytes

unamed = output1.iloc[:,4:] - output2.iloc[:,4:]

#percent_prepbufr_diff_output1 = subsets/output1.subsets

#percent_prepbufr_diff_output2 = subsets/output2.subsets

###Place output from computations into a csv file with column headings

#table_of_diff_percent_diff_prepbufr = pd.concat([output1.type, messages, subsets, bytess, unamed, percent_prepbufr_diff_output1, percent_prepbufr_diff_output2], axis=1)

#table_of_diff_percent_diff_prepbufr.columns = ['Type', 'messages', 'subsets', 'bytes', 'unamed', 'percent_prepbufr_diff_output1', 'percent_prepbufr_diff_output2']

#table_of_diff_percent_diff_prepbufr.to_csv('table_of_diff_percent_diff_prepbufr.csv')
