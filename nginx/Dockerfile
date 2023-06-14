FROM nginx:alpine3.17

RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY content /usr/share/nginx/html
COPY conf/* /etc/nginx
