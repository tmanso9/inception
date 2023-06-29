FROM debian:bullseye

RUN mkdir -p /var/www/static-inception

COPY ./static-inception/dist/* /var/www/static-inception/

COPY ./tools/launch_vue.sh .

CMD ["./launch_vue.sh"]