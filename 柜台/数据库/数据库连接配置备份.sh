# 拉取
ip=192.25.108.172

scp -rp  root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/tnsnames.ora   /home/h3c_file/${ip}_back/
scp -rp  root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/listener.ora   /home/h3c_file/${ip}_back/
scp  -rp root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/sqlnet.ora   /home/h3c_file/${ip}_back/
scp  -rp root@$ip:/etc/hosts   /home/h3c_file/${ip}_back/
scp  -rp root@$ip:/etc/sysconfig/network  /home/h3c_file/${ip}_back/


# 推送
scp -rp    /home/h3c_file/${ip}_back/        root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/tnsnames.ora 
scp -rp    /home/h3c_file/${ip}_back/     root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/listener.ora 
scp  -rp /home/h3c_file/${ip}_back/     root@$ip:/u01/app/oracle/product/11.2.0/db_1/network/admin/sqlnet.ora   
scp  -rp /home/h3c_file/${ip}_back/     root@$ip:/etc/hosts                                                     
scp  -rp    /home/h3c_file/${ip}_back/     root@$ip:/etc/sysconfig/network                                         