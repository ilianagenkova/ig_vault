
for dd in 18 19 20
do
 htar -xvf /NCEPPROD/hpssprod/runhistory/rh2024/202412/202412${dd}/dcom_202412${dd}.tar    ./b001
 htar -xvf /NCEPPROD/hpssprod/runhistory/rh2024/202412/202412${dd}/dcom_202412${dd}.tar    ./b031
 mv b001 202412${dd}/.
 mv b031 202412${dd}/.
done

