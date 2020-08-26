echo "============================================"
echo "升级前端"
echo "============================================"
echo "备份和清空文件"
date1=$(date +%F)
mkdir -p backup/$date1
tar -cvf backup/$date1/webdist.tar /usr/share/nginx/html/*
rm -rf /usr/share/nginx/html/*
echo "部署"
tar -xvf /h3c/update/Prepare/web* -C /usr/share/nginx/html/
cd /usr/share/nginx/html/
echo "配置替换"
sed -i '/^.*end.*flow-api"$/c  $endPoint: "http://192.25.106.220:8081/flow-api"' index.html
# sed -i "s/^.*endPoint: \"http.*$/      \$endPoint: \"http:\/\/192.25.106.220:8081\/flow-api\"/"  index.html
cat index.html
echo "重启"
nginx -s reload


echo "============================================"
echo "升级后台"
echo "============================================"
echo "停止tomcat"
sh /h3c/apache-tomcat-8.5.51/bin/shutdown.sh
sleep 15
ps aux |grep tomcat
echo "备份和清空文件"
cp /h3c/apache-tomcat-8.5.51/webapps/flow*.war backup/$date1/
rm -rf /h3c/apache-tomcat-8.5.51/webapps/flow*
echo "文件升级"
cp -rf /h3c/update/Prepare/flow* /h3c/apache-tomcat-8.5.51/webapps/
ls /h3c/apache-tomcat-8.5.51/webapps/
echo "启动tomcat"
export FLOW_API_CONFIG_PATH="/h3c/app-api.properties"
export FLOW_CC_CONFIG_PATH="/h3c/app-cc.properties"
sh /h3c/apache-tomcat-8.5.51/bin/startup.sh
tail -f /h3c/apache-tomcat-8.5.51/logs/catalina.out
