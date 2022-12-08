
find . -type f -size -500M  (files smaller than 500Mb) 

#BE VERY CAREFUL !!!

find . -name "*.bufrT" -type f -size -1k -delete (delete smaller than 1Kb)

LIST all *.bufrT files (recursevly) with sie less than 1000 bytes:
find . -name "*.bufrT" -type f -size -1000c -list


DELETE all *.bufrT files (RECURSEVLY) with sie less than 1000 bytes:
find . -name "*.bufrT" -type f -size -1000c -delete


find . -name "*.bufrT" -type f -size +1000c -list    <--list files LARGER than 1000 bytes
find . -name "*.bufrT" -type f -size +1000k -list    <--list files LARGER than 1000 KB
find . -name "*.bufrT" -type f -size +1000M -list    <--list files LARGER than 1000 MB

https://linuxconfig.org/how-to-use-find-command-to-search-for-files-based-on-file-size

