FROM debian:bullseye

RUN apt-get update

RUN apt-get install vsftpd -y

RUN adduser --gecos vsftpd vsftpd --disabled-password

RUN mkdir -p /var/www/html

RUN touch /var/log/vsftpd.log

RUN chown -R vsftpd:vsftpd /var/log/vsftpd.log /var/www/html

EXPOSE 9876

# COPY tools/launch_ftp.sh .
COPY tools/vsftpd.conf /etc/vsftpd.conf

RUN mkdir /var/www/html/images

COPY ./images /var/www/images/

# USER vsftpd

# ENTRYPOINT [ "./launch_ftp.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]