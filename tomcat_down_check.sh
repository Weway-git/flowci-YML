ps aux | grep "tomcat" |grep -v "tomcat" |grep -v "sh tomcat_down_check.sh" &> /dev/null       
for i in {1..3}
  do
      echo "Check round $i"
      ps aux | grep "tomcat" |grep -v "tomcat" |grep -v "sh tomcat_down_check.sh" &> /dev/null   
      if [ $? -ne 0 ]
          then
            echo "Tomcat has been shutdown! "
            break
      else
        sleep 5
       fi
  done
ps aux | grep "tomcat" |grep -v "tomcat" |grep -v "sh tomcat_check.sh"
if [ $? -eq 0 ]
    then
        echo "time out, tomcat shutdown error "
        error
fi




