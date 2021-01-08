docker run -it \
   --name plat1  \
   -e MYSQL_HOST=47.116.137.249 \
   -e MYSQL_USER=root \
   -e MYSQL_PASSWORD=qiang666 \
   -e FLOW_SYS_USERNAME=admin \
   -e FLOW_SYS_PASSWORD=123456  \
   -e FLOW_API_DOMAIN=192.168.43.150 \
   -e FLOW_API_PORT=8080 \
   -e FLOW_WEB_DOMAIN=192.168.43.150 \
   -e JENKINS_URL=http://47.116.137.249:8080/jenkins/  \
   -e JENKINS_USERNAME=admin  \
   -e JENKINS_PASSWORD=123456  \
   -e SONAR_URL=http://192.25.105.196:9090  \
   -e SONAR_USERNAME=admin  \
   -e SONAR_PASSWORD=123456  \
   -p 8080:8080 \
    registry.cn-shanghai.aliyuncs.com/devnavi/platform:1.0.1
