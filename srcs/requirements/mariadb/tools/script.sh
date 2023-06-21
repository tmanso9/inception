#!/bin/sh

service mariadb start

mysql_upgrade --force

if [ -d "/var/lib/mysql/$MYSQL_DB_NAME" ]
then 

	echo "Database already exists"
else

mysql_secure_installation << _EOS_

Y
Y
$MYSQL_DB_ROOT_PASSWORD
$MYSQL_DB_ROOT_PASSWORD
Y
n
Y
Y
_EOS_

mariadb -u root << EOS
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD'; FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME; GRANT ALL ON $MYSQL_DB_NAME.* TO '$MYSQL_DB_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD'; FLUSH PRIVILEGES;
EOS

mariadb -u root -p$MYSQL_DB_ROOT_PASSWORD $MYSQL_DB_NAME < /usr/local/bin/wordpress.sql

fi

service mariadb stop

exec "$@"
