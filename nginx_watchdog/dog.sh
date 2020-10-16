function start(){
    local file_path=/usr/local/nginx/logs
    local file_name=access.log
    local check_time=2
    while :
    do
        file_old_stat="`du -b ${file_path}/${file_name}`"
        # echo old${file_old_stat}
        sleep ${check_time}
        file_new_stat="`du -b ${file_path}/${file_name}`"
        # echo filenew${file_new_stat}
        if [[ `echo ${file_old_stat}` == `echo ${file_new_stat}` ]]; then
            # not change
            echo "not change" >> /dev/null
        else
            # changed
            export LANG=zh_CN.UTF-8
            date=`date`
            content=`cat ${file_path}/${file_name} | awk 'END {print}'`
            ip=`echo ${content} | awk -F- '{print $1}'`
            time=`echo ${content} | awk -F- '{print $2}'`
            method=`echo ${content} | awk -F- '{print $3}'`
            code=`echo ${content} | awk -F- '{print $4}'`
            size=`echo ${content} | awk -F- '{print $5}'`
            user_agent=`echo ${content} | awk -F- '{print $6}'`
            

            # ip to address
            ip_addr=`curl  'http://ip.zxinc.org/api.php?type=json&ip='$ip   -H 'Accept: */*' -H 'Referer: http://ip.zxinc.org/ipquery/' -H 'X-Requested-With: XMLHttpRequest' -H 'Proxy-Connection: keep-alive' --compressed`

            # echo content  ${content}
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo -e "IPaddr is ${ip_addr}\n IP address is ${ip}\n UserAgent is ${user_agent}\n Time is ${time}\n check time is ${check_time}" >  /root/watchdogs/temp.txt
            dos2unix -k /root/watchdogs/temp.txt
            mail -s "${date}" 1419864987@qq.com < /root/watchdogs/temp.txt
            sleep 2
            echo "mail sent successfully!"
        fi
    done
}

start



