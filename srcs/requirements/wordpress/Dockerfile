FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install -y \
		curl \
		wget \
		tar \
		php \
        php-fpm \
		php-mysql \
		redis \
		php-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

COPY ./tools/create_wp.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/create_wp.sh"]

WORKDIR /var/www/html

EXPOSE 9000

CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
