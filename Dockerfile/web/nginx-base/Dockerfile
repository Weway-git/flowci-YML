FROM nginx:latest


LABEL MAINTAINER="1419864987@qq.com"


ENV FLOW_WEB_DIR=/usr/share/nginx/html
WORKDIR $FLOW_WEB_DIR

COPY ./flow-web.sh $FLOW_WEB_DIR/flow-web.sh

EXPOSE 80
