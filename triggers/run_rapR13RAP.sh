my_desc=R13RAP
yy=2025



for mm in 07 # {01..04}
do
	        for dd in {03..03} # {20..23}
			        do
					                  echo 'YEAR/MONTH/DAY::' ${yy} '-' ${mm} '-' ${dd}
							                    for hh in {00..15} #00 06 12 18
										                      do

													                        echo 'HH::' ${hh}
																                jtyp=rap cyc=${hh} PDY=${yy}${mm}${dd} desc=${my_desc} /u/iliana.genkova/bin/cycqsub /lfs/h2/emc/obsproc/noscrub/iliana.genkova/Trigs.KEEP/jrap_dump.wc2.pbs.${my_desc}

																		                  done #hh
																				           done #dd
																				   done #mm

