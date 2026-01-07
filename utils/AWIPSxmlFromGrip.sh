#!/bin/bash
# checks to see what the AWIPS formated xml for this grib is.

if [[ $# -ne 1 ]]
then
   echo "Useage $0 filename- please enter a grib file name to check"
      exit 1
      fi

center=$(degrib2  $1 | grep -m 1 "SECTION 1:" | awk '{print $3}' )
subcenter=$(degrib2  $1 | grep -m 1 "SECTION 1:" | awk '{print $4}' )
process_id=$(degrib2 $1 | grep -m 1 "PRODUCT TEMPLATE" | awk '{print $17}')
echo -e "to ingest the file \n$1\ninto AWIPS you need the following"
echo "in Localization-->Edex --> Grib --> Model"
echo "you need an entry in one of the xml files that contains"
echo "<model>"
echo "<name>YOUR_CHOICE_OF_NAME</name>"
echo "<center>$center</center>"
echo "<subcenter>$subcenter</subcenter>"
echo "<process>"
echo "<id>$process_id</id>"
echo "</process>"
echo "</model>"
echo "Hint 1: NCEP models are in NCEP-7.xml"
echo "Hint 2: You may have multiple process ids per model"
