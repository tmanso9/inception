FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install -y php php-curl php-imagick php-xml php-zip php-xmlreader php-ssh2 php-gd php-fpm php-mysql

RUN apt install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

CMD [ "/script.sh" ]