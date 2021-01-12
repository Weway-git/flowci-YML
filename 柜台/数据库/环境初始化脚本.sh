# -------------数据库相关--------------------
#                在220上
# 对两边数据库
db_ip=192.168.43.150
cd ~
chmod 600 ~/.ssh/authorized_keys
ssh-copy-id -i .ssh/id_rsa.pub root@${db_ip}
# ssh-keygen
ssh root@${db_ip}  " mkdir -p  /home/h3c_file/" & exit
cd /home/h3c_file/script
scp DB*  root@${db_ip}:/home/h3c_file/

# 对数据库源环境
db_ip=192.168.43.150
scp vsftpd-2.2.2-24.el6.x86_64.rpm  root@${db_ip}:/home/h3c_file/
ssh root@${db_ip} "rpm -ivh  /home/h3c_file/vsftpd-2.2.2-11.el6_4.1.x86_64.rpm --nodeps "
ssh root@${db_ip} "service vsftpd start"
ssh root@${db_ip} "useradd ftpuser"
ssh root@${db_ip} "passwd ftpuser"

# 对数据库目标环境
db_ip=192.168.43.150
scp flow-agent.jar  root@${db_ip}:/home/h3c_file/
scp jre-8u271-linux-x64.rpm  root@${db_ip}:/home/h3c_file/
scp ftp-0.17-54.el6.x86_64.rpm  root@${db_ip}:/home/h3c_file/
ssh root@${db_ip} "rpm -ivh  /home/h3c_file/ftp-0.17-54.el6.x86_64.rpm --nodeps "
vi start.sh #提前编辑start.sh中agent token
ssh root@${db_ip} " /bin/bash /home/h3c_file/start.sh & "

# ---------------------中间件相关---------------------
#                在220上
cd ~
chmod 600 ~/.ssh/authorized_keys
ssh-copy-id -i .ssh/id_rsa.pub root@${MD_ip}
# ssh-keygen
ssh root@${MD_ip}  " mkdir -p  /home/h3c_file/" & exit
# AS
MD_ip=192.168.43.150
cd /home/h3c_file/script
scp AS*  root@${MD_ip}:/home/h3c_file/
# LS
MD_ip=192.168.43.150
cd /home/h3c_file/script
scp LS*  root@${MD_ip}:/home/h3c_file/