cd /home/hundsun/workspace
echo "checking..."
number1=$(cat /home/hundsun/workspace/runall|grep hsserver|wc -l)
number2=$(cat /home/hundsun/workspace/runall|grep "#hsserver"|wc -l)
snum1=$(ps -ef | grep 'hsserver'|wc -l)-$(ps -ef | grep 'hsserver'|grep 'grep'|wc -l)

echo '====================================='
echo 
echo " Process number is"  $[($number1-$number2)] !
echo 
echo '====================================='
if [ $[($snum1)] == $[($number1-$number2)] ] ;then
 echo "Checking OK! All process is running!"
else
  echo "please wait..."
  sleep 120
  if [ $[($snum1)] == $[($number1-$number2)] ] ;then
  echo "Checking OK! All process is running!"
  else
   echo "Error£¡ Process is not normal£¡Please check!"
   NOT EXIST!
  fi
fi
