# 目标环境：------------------------
# 目录建立
ssh root@192.25.101.13  " mkdir -p  /home/h3c_file/" & exit
# 脚本拷贝
scp *  root@192.25.101.13:/home/h3c_file/
# 免密
ssh-copy-id -i .ssh/id_rsa.pub root@192.25.101.13

# 数据库源环境:------------------------------
# 数据库拷贝时源数据库vsftpd搭建
rpm -ivh  vsftpd-2.2.2-24.el6.x86_64.rpm --nodeps
service  vsftpd start
useradd ftpuser
passwd ftpuser
# 数据库目标环境:---------------------

# ftp客户端安装
rpm -ivh ftp-0.17-54.el6.x86_64.rpm

# java
rpm -ivh jre-8u271-linux-x64.rpm


# crontab 每天一点执行
0 1 * * ?

# too open
chmod 600 