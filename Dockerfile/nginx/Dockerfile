FROM nginx:latest


LABEL MAINTAINERmaintainer="1419864987@qq.com"


ENV FLOW_WEB_DIR=/usr/share/nginx/html
WORKDIR $FLOW_WEB_DIR

COPY ./dist/ /usr/share/nginx/html
COPY ./docker/nginx.conf /etc/nginx/
COPY ./docker/flow-web.sh $FLOW_WEB_DIR/flow-web.sh

EXPOSE 80

CMD bash $FLOW_WEB_DIR/flow-web.sh && nginx -g 'daemon off;'