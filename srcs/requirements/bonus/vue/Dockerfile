FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install -y curl gpg

RUN mkdir -p static-inception

RUN mkdir -p /var/www/bonus

COPY tools/setup.sh .

COPY tools/static-inception/ /static-inception/

WORKDIR /static-inception

CMD [ "./../setup.sh" ]
