ps aux | grep "tomcat" |grep -v "grep" |grep -v "tomcat_up_check.sh" &> /dev/null
if [ $? -ne 0 ]
  then 
    echo "tomcat not run"
else
    echo "tomcat is running"
    ps -ef | grep -v grep | grep tomcat  | awk '{print $2}' | xargs kill -9
fi