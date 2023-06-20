FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/mysqld.conf /etc/mysql/my.cnf

COPY ./tools/wordpress.sql /usr/local/bin

COPY ./tools/script.sh /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]