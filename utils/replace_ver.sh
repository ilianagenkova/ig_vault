
for fi in *wc2.pbs* ;  
do	
  echo "$fi"; 
  sed -i 's/export obsproc_ver=v1.0.0/export obsproc_ver=v1.0\nexport obsproc_ver_pckg=v1.0.0/g' $fi
  sed -i 's/PACKAGEROOT}\/obsproc.${obsproc_ver/PACKAGEROOT}\/obsproc.${obsproc_ver_pckg/g' $fi
  sed -i 's/PACKAGEROOTpara}\/obsproc.${obsproc_ver/PACKAGEROOTpara}\/obsproc.${obsproc_ver_pckg/g' $fi


done

