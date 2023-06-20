#!/bin/bash

wget http://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

sed -i "s/username_here/$MYSQL_DB_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_DB_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DB_NAME/g" wp-config-sample.php

cp wp-config-sample.php wp-config.php

exec "$@"