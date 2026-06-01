
## rsync a directory to all remote machines

##########set -x
# Check for proper number of command line args.
myhelp="rsync_hera <local file/dir> <remote dir>"

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo $myhelp
  exit $E_BADARGS
fi

##rsync -pr $1 Sudhir.Nadiga@edtn.fairmont.rdhpcs.noaa.gov:$2
rsync -pr $1 Sudhir.Nadiga@dtn-hera.fairmont.rdhpcs.noaa.gov:$2
err=$?

if [ $err -ne 0 ]; then
   echo "####### rsync to Hera FAILED!!!!!!"
else
   echo "rsync $1 to Hera successful"
fi
