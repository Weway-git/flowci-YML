export LANG=zh_CN.UTF-8
ori_ip="asd"
while :
do
    # wlan0网卡信息
    ip_info=`ip addr show wlan0|grep 'inet6'` 
    # 筛选出当前ipv6地址
    ipaddr=`ip addr show wlan0|grep 'inet6' |grep 'scope global mngtmpaddr dynamic'|sed 's/^.*inet6 //g'|sed 's#/64.*$##g' `  


    echo $ipaddr|grep ${ori_ip} >> /dev/null
    if [ $? -ne 0 ]
    then
        echo "ipv6 addr has missed or changed"
        echo ${ip_info} |mail -s "ipv6 missed! `date`" 1419864987@qq.com
        ori_ip=${ipaddr}
        # echo ${ipaddr} >> ipaddr.txt
        # slee
        sleep 1200
    else
        echo `date`
        echo "ipv6 run stable"
        sleep 1200
    fi

done