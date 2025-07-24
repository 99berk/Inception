#!/bin/bash

cd /var/www/html
if [ ! -f wp-config.php ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --allow-root
    ./wp-cli.phar core install --url="$URL" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root
    ./wp-cli.phar user create "$USER" "$USER_EMAIL" --role=author --user_pass="$USER_PASSWORD" --allow-root
fi
mkdir -p /run/php
exec "$@"