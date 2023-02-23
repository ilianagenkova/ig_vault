LEFT_DIR=$COMROOT/obsproc/v1.0/cdas.20220921
RIGHT_DIR=/lfs/h2/emc/stmp/shelley.melchior/CRON/wc2para/com/obsproc/v1.0/cdas.20220921

echo $LEFT_DIR
echo $RIGHT_DIR

rsync -rin --ignore-existing "$LEFT_DIR"/ "$RIGHT_DIR"/|sed -e 's/^[^ ]* /LEFT              /'
rsync -rin --ignore-existing "$RIGHT_DIR"/ "$LEFT_DIR"/|sed -e 's/^[^ ]* /RIGHT             /'
rsync -rin --existing "$LEFT_DIR"/ "$RIGHT_DIR"/|sed -e 's/^/X  /'

echo "LEFT :" $LEFT_DIR
echo "RIGHT:" $RIGHT_DIR


