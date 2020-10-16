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
            mail_content=`cat ${file_path}/${file_name} | awk 'END {print}'`
            # echo mail_content  ${mail_content}
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo "${mail_content}" |mail -s "${date}" 1419864987@qq.com
            sleep 10
        fi
    done
}

start