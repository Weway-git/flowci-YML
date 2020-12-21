# LS nrs backup
mkdir -p /home/h3c_file/LS_backup|true
date1=$(date +%F-%H%M%S)
mkdir -p /home/h3c_file/LS_backup/$date1
cp  /home/hundsun/workspace/nrs.xml   /home/h3c_file/LS_backup/$date1
echo "nrs.xml before sync:"
cat /home/h3c_file/LS_backup/$date1/nrs.xml