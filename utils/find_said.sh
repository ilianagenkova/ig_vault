
for FILE in $DCOMROOT/20250626/b*/* ; do
	  # Do something with each file. For example, print the filename:
	     echo "$FILE" 
	     #sinv $FILE | grep -e "285 " -e "286 " #DMSP SSMI/S
	     sinv $FILE | grep "223 "               #NOAA-19
done
