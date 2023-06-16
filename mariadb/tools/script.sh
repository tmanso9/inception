#!/bin/bash

MYSQL_DB_NAME="testDB"
MYSQL_DB_PASSWORD="bla"
MYSQL_DB_USER="touteiro"
MYSQL_DB_ROOT_PASSWORD="bla"

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_DB_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* to '$MYSQL_DB_USER'@'%' ;" >> db1.sql
echo " ALTER USER root@localhost IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES ;" >> db1.sql

db1.sql < mysql

mysqld

# mysql -sfu root << EOS
# -- set root password
# UPDATE mysql.user SET Password=PASSWORD('bla') WHERE User='root';
# -- delete anonymous users
# DELETE FROM mysql.user WHERE User='';
# -- delete remote root capabilities
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '0.0.0.0', '::1');
# -- drop database 'test'
# DROP DATABASE IF EXISTS test;
# -- also make sure there are lingering permissions to it
# DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# -- make changes immediately
# FLUSH PRIVILEGES;
# EOS
