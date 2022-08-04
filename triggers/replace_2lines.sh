#for i in f*; 

for fi in jcdas_*wc2.pbs ; 
do
    #sed -i 's/iliana/ILIANA/g' $i
     sed -i.bak $'s/export obsproc_ver=v1.0/export obsproc_ver=v1.0\\\nexport obsproc_ver_pckg=v1.0.2/g' $fi
done


