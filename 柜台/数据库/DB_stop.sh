echo "stopping..."
id
cd /home/oracle/
source .bash_profile
sqlplus / as sysdba <<EOF
shutdown immediate;
EOF
exit
echo "oracle stopped succeed£¡"
