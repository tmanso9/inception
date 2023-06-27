FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt-get install vsftpd -y

RUN adduser --gecos vsftpd vsftpd --disabled-password

RUN mkdir -p /var/www/html

RUN touch /var/log/vsftpd.log

RUN chown -R vsftpd:vsftpd /var/log/vsftpd.log /var/www/html

EXPOSE 20 21

COPY tools/launch_ftp.sh .

COPY tools/vsftpd.conf /etc/vsftpd.conf

RUN chown -R vsftpd:vsftpd /etc/vsftpd.conf

USER vsftpd

CMD [ "./launch_ftp.sh" ]
