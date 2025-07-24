#!/bin/bash

touch /etc/mysql/init.sql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

exec "$@"