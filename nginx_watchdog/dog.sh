function start(){
    echo haha
    local file_path=/root/nginx_log_watchdog/haha.log
    local check_time=5
    while :
    do
        file_old_stat="`du -b haha.log`"
        echo ${file_old_stat}
        sleep ${check_time}
        file_new_stat="`du -b haha.log`"
        echo ${file_new_stat}
        if [[ `echo ${file_old_stat}` == `echo ${file_new_stat}` ]]; then
                        
        else
            echo "#### Wait ${check_time}s ####"
            echo "changed!!!!!!!!!!!!!!!!!!!!!!"
            echo "haha" |mail -s ${a} 1419864987@qq.com
        fi
    done
}

start