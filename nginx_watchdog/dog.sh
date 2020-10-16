function start(){
    echo haha
    local file_path=/var/log/nginx
    local file_name=access.log
    local check_time=2
    while :
    do
        file_old_stat="`du -b ${file_path}/${file_name}`"
        echo old${file_old_stat}
        sleep ${check_time}
        file_new_stat="`du -b ${file_path}/${file_name}`"
        echo filenew${file_new_stat}
        if [[ `echo ${file_old_stat}` == `echo ${file_new_stat}` ]]; then
            # not change
            echo "not change"
        else
            # changed
            date=`date`
            content=`cat ${file_path}/${file_name} | awk 'END {print}'`
            ip=`echo ${content} | awk -F- '{print $1}'`
            time=`echo ${content} | awk -F- '{print $2}'`
            method=`echo ${content} | awk -F- '{print $3}'`
            code=`echo ${content} | awk -F- '{print $4}'`
            size=`echo ${content} | awk -F- '{print $5}'`
            user_agent=`echo ${content} | awk -F- '{print $6}'`
            
            # echo content  ${content}
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo -e " IP address is ${ip}\n UserAgent is ${user_agent}\n Time is ${time}\n check time is ${check_time}" |mail -s "${date}" 1419864987@qq.com
            sleep 10
        fi
    done
}

start