
#for i in f*; 
for fi in j*wc2.pbs.hrl*R12 ; 
do
    #sed -i 's/iliana/ILIANA/g' $i
     sed -i.bak $'s/export TANK=$DCOMROOT/export TANK=$DCOMROOT\\\nexport TANK_003010=\/lfs\/h1\/ops\/dev\/dcom\\\nexport TANK_255034=\/lfs\/h1\/ops\/dev\/dcom/g' $fi
done

#export TANK=$DCOMROOT
#export TANK_003010=/lfs/h1/ops/dev/dcom
#export TANK_255034=/lfs/h1/ops/dev/dcom 

