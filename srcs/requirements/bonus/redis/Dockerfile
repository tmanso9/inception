FROM debian:bullseye

RUN apt update && apt upgrade

RUN adduser redis && mkdir -p /run/redis

RUN apt install -y redis

RUN chown -R redis:redis /run/redis/ /var/lib/redis

COPY ./tools/redis_launch.sh .

COPY ./tools/redis.conf .

EXPOSE 6379

USER redis

ENTRYPOINT [ "./redis_launch.sh" ]

CMD [ "redis-server", "/etc/redis/redis.conf" ]
