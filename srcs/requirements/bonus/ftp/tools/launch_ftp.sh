#!/bin/bash

if [ -a /etc/vsftpd.conf.bak ]
then
	echo "FTP server already created"
else

# cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
# cp ./vsftpd.conf /etc/vsftpd.conf

# mkdir -p /var/www/html

# adduser $FTP_USER << _EOS_
# $FTP_PASSWD
# $FTP_PASSWD
# \n
# \n
# \n
# \n
# \n
# \n
# _EOS_

# touch /var/log/vsftpd.log
# chown -R $FTP_USER:$FTP_USER /var/log/vsftpd.log /var/www/html

# echo $FTP_USER | tee -a /etc/vsftpd.conf

fi

exec "$@"