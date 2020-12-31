FROM registry.cn-shanghai.aliyuncs.com/devnavi/web-base:latest


LABEL MAINTAINER="1419864987@qq.com"


ENV FLOW_WEB_DIR=/usr/share/nginx/html
WORKDIR $FLOW_WEB_DIR

COPY ./dist/ /usr/share/nginx/html
COPY ./docker/nginx.conf /etc/nginx/


EXPOSE 80

CMD bash $FLOW_WEB_DIR/flow-web.sh && nginx -g 'daemon off;'
