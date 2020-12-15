for i in {1..3}
do
    echo "Check round $i"
    ps aux | grep "tomcat" |grep -v "grep" 
    if [ $? -ne 0 ]
        then
           sleep 5
    else
        
         echo "Tomcat has been shutdown! "
            break
fi
done
ps aux | grep "tomcat" |grep -v "grep" 
if [ $? -ne 0 ]
    then
        echo "time out, tomcat shutdown error "
        error
fi