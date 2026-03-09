#!/bin/sh

#Micronesia stations
#
#Woleai: 91317
#Lukunoch: 91339
#Kapingamarangi: 91434
#Nukuoro: 91425
#Kosrae: 91356
#Ailinglaplap: 91367
#Mili: 91378
#Wotje: 91371
#Utirik: 91258

for rpid in  91317 91339 91434 91425 91356 91367 91378 91371 91258 
do
        ## /home/people/emc/ftp/jcsda/WDQMS/NCEP/SYNOP/06/NCEP_SYNOP_20251115_06.csv
        # grep $rpid /home/people/emc/ftp/jcsda/WDQMS/NCEP/SYNOP/??/NCEP_SYNOP_20260101_??.csv 

#!/bin/sh

# It's always a good practice to wrap string variables in quotes
#rpid="01002"

month="202602"

awk -F',' -v prefix="$rpid" '
    # This tells awk: Only run the block below IF the line starts with our prefix
    $0 ~ "^" prefix {
        # Extract the first 5 characters of the first field (before the 1st comma)
        first_five = substr($1, 1, 5); 
        
        # $6 represents the value between the 5th and 6th commas
        print first_five, $6; 
    }
'  /home/people/emc/ftp/jcsda/WDQMS/NCEP/SYNOP/??/NCEP_SYNOP_${month}??_??.csv | sort | uniq -c

done

