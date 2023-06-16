FROM debian:bullseye

RUN mkdir -p /etc/nginx/ssl

RUN apt update && apt upgrade

RUN apt install -y nginx openssl

RUN openssl req \
-x509 \
-sha256 \
-days 365 \
-nodes \
-newkey rsa:2048 \
-subj "/C=PT/L=Lisbon/O=42 Lisboa/CN=touteiro.42.fr" \
-out /etc/nginx/ssl/touteiro.crt \
-keyout /etc/nginx/ssl/touteiro.key 

COPY tools/index.html /var/www/html/index.html

COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]