ps aux | grep "tomcat" |grep -v "tomcat" |grep -v "sh tomcat_up_check.sh" &> /dev/null
if [ $? -ne 0 ]
  then 
    echo "tomcat not run"
else
    sh /usr/local/bin/shutdown.sh
fi