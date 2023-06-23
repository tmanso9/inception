FROM debian:bullseye

RUN apt-get update

RUN apt install -y redis

COPY ./tools/redis_launch.sh .

EXPOSE 6379

CMD [ "./redis_launch.sh" ]
