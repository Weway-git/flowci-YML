ps aux | grep "tomcat" |grep -v "grep" |grep -v "tomcat_up_check.sh" &> /dev/null
if [ $? -ne 0 ]
  then 
    echo "tomcat not run"
else
    echo "tomcat is running"
    sh /usr/local/apache-tomcat-9.0.24/bin/shutdown.sh
fi