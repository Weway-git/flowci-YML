# AS nrs backup
mkdir -p /home/h3c_file/AS_backup|true
date1=$(date +%F-%H%M%S)
mkdir -p /home/h3c_file/AS_backup/$date1
cp  /home/hundsun/workspace/nrs.xml   /home/h3c_file/AS_backup/$date1
