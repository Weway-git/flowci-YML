number1=$(lsnrctl status|grep success|wc -l)
looptimes=3
echo checking...
n=1
while [ $n -le $looptimes ]
do
  echo try times:$n
  if [ $number1 == 1 ];
  then
  	echo "Database listener is running successfully!"
    break
  else
  	echo "Database listener error, restarting..."
    lsnrctl start
    sleep 2
    number1=$(lsnrctl status|grep success|wc -l)
  fi
  ((n++))
done
#final judge
if [ $number1 != 1 ];
then
    ERROR  
    date
  	echo "Datebase listener start failed! please check!!!"
fi