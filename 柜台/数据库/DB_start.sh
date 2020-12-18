echo "starting..."
id
cd /home/oracle/
source .bash_profile
sqlplus / as sysdba <<EOF
startup;
EOF
exit
