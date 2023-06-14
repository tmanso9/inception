FROM debian:11

RUN apt update && apt upgrade

RUN apt install -y nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]