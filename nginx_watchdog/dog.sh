function start(){
    local file_path=/usr/local/nginx/logs
    local file_name=access.log
    local check_time=0.1
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
            ip=`echo ${content} | awk -F '|'  '{print $1}'`
            time=`echo ${content} | awk -F '|'  '{print $3}'`
            method=`echo ${content} | awk -F '|'  '{print $4}'`
            code=`echo ${content} | awk -F '|'  '{print $5}'`
            # size=`echo ${content} | awk -F- '{print $5}'`
            user_agent=`echo ${content} | awk -F '|'  '{print $7}'`
            

            # ip to address
            ip_addr=`curl  'http://ip.zxinc.org/api.php?type=json&ip='$ip   -H 'Accept: */*' -H 'Referer: http://ip.zxinc.org/ipquery/' -H 'X-Requested-With: XMLHttpRequest' -H 'Proxy-Connection: keep-alive' --compressed`
            # location=`echo ${ip_addr} |jq '.data.location'`
            range=`echo ${ip_addr} |jq '.data.ip'`
            country=`echo ${ip_addr} |jq '.data.country'`
            type=`echo ${ip_addr} |jq '.data.local'`
            
            # echo content  ${content}
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo -e "[location]: ${country}\n [type]: ${type}\n [range]: ${range}\n [IP address]: ${ip}\n [UserAgent]: ${user_agent}\n [Time]: ${time}\n [check time]: ${check_time}" >  /root/watchdogs/temp.txt
            dos2unix -k /root/watchdogs/temp.txt
            mail -s "${date}" 1419864987@qq.com < /root/watchdogs/temp.txt
            sleep 1
            echo "mail sent successfully!"
        fi
    done
}

start



