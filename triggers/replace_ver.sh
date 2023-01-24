
for fi in *wc2.pbs ;  
#for fi in * ;
#for fi in jglobal_dump.wc2.pbs* ;  ## #PBS -l place=vscatter,select=1:ncpus=14:mem=60gb	
do	
  echo "$fi"; 
  #sed -i 's/export obsproc_ver=v1.0.0/export obsproc_ver=v1.0\nexport obsproc_ver_pckg=v1.0.0/g' $fi
  #sed -i 's/PACKAGEROOT}\/obsproc.${obsproc_ver/PACKAGEROOT}\/obsproc.${obsproc_ver_pckg/g' $fi
  #sed -i 's/PACKAGEROOTpara}\/obsproc.${obsproc_ver/PACKAGEROOTpara}\/obsproc.${obsproc_ver_pckg/g' $fi
  #sed -i 's/outputdir=\/lfs\/h2\/emc\/ptmp\/${USER}\/CRON\/${DESC}\/output/outputdir=\/lfs\/h2\/emc\/stmp\/${USER}\/CRON\/${DESC}\/output/g' $fi
  #sed -i 's/\/lfs\/h2\/emc\/obsproc\/noscrub\/iliana.genkova/${userROOT}/g' $fi
  #sed -i 's/ptmp/stmp/g' $fi
  #sed -i 's/obsproc_ver_pckg=v1.0.0/obsproc_ver_pckg=v1.0.1/g' $fi
  #sed -i 's/shelley.melchior/iliana.genkova/g' $fi
  #sed -i 's/genkova\/triggers/genkova\Trigs.KEEP/g' $fi
  #sed -i 's/Iliana.Genkova/iliana.genkova/g' $fi
  #sed -i 's/PBS -l place=vscatter,select=1:ncpus=14:mem=60gb/PBS -l place=vscatter,select=1:ncpus=14:mem=160gb/g' $fi
  sed -i 's/obsproc_ver_pckg=v1.1.2/export obsproc_ver_pckg=v1.1.2/g' $fi
  sed -i 's/obsproc_ver=v1.1/export obsproc_ver=v1.1/g' $fi
  sed -i 's/export bufr_dump_ver=1.0.0/export bufr_dump_ver=1.1.2/g' $fi
done

for fi in *wc2.pbs.hr* ;
#for fi in * ;
#for fi in jglobal_dump.wc2.pbs* ;  ## #PBS -l place=vscatter,select=1:ncpus=14:mem=60gb
do
  echo "$fi";
  #sed -i 's/export obsproc_ver=v1.0.0/export obsproc_ver=v1.0\nexport obsproc_ver_pckg=v1.0.0/g' $fi
  #sed -i 's/PACKAGEROOT}\/obsproc.${obsproc_ver/PACKAGEROOT}\/obsproc.${obsproc_ver_pckg/g' $fi
  #sed -i 's/PACKAGEROOTpara}\/obsproc.${obsproc_ver/PACKAGEROOTpara}\/obsproc.${obsproc_ver_pckg/g' $fi
  #sed -i 's/outputdir=\/lfs\/h2\/emc\/ptmp\/${USER}\/CRON\/${DESC}\/output/outputdir=\/lfs\/h2\/emc\/stmp\/${USER}\/CRON\/${DESC}\/output/g' $fi
  #sed -i 's/\/lfs\/h2\/emc\/obsproc\/noscrub\/iliana.genkova/${userROOT}/g' $fi
  #sed -i 's/ptmp/stmp/g' $fi
  #sed -i 's/obsproc_ver_pckg=v1.0.0/obsproc_ver_pckg=v1.0.1/g' $fi
  #sed -i 's/shelley.melchior/iliana.genkova/g' $fi
  #sed -i 's/genkova\/triggers/genkova\Trigs.KEEP/g' $fi
  #sed -i 's/Iliana.Genkova/iliana.genkova/g' $fi
  #sed -i 's/PBS -l place=vscatter,select=1:ncpus=14:mem=60gb/PBS -l place=vscatter,select=1:ncpus=14:mem=160gb/g' $fi
  sed -i 's/obsproc_ver_pckg=v1.1.2/export obsproc_ver_pckg=v1.1.2/g' $fi
  sed -i 's/obsproc_ver=v1.1/export obsproc_ver=v1.1/g' $fi
  sed -i 's/export bufr_dump_ver=1.0.0/export bufr_dump_ver=1.1.2/g' $fi
done


