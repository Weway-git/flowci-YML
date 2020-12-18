# 目录建立
ssh root@192.168.135.102  " mkdir -p  /home/h3c_file/" & exit
# 脚本拷贝
scp *  root@192.168.135.102:/home/h3c_file/
# 免密
ssh-copy-id -i .ssh/id_rsa.pub root@192.168.135.102