for i in f*; do
    #sed -i 's/iliana/ILIANA/g' $i
     sed -i.bak $'s/ryan=best/ryan=best.11\\\nryan=best.21/g' $i
done
