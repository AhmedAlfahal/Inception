#!/bin/sh

cd /wordpress/

wp config create --dbname=$(cat /run/secrets/DB_NAME) --dbuser=$(cat /run/secrets/DB_USER) --dbhost=mariadb --dbpass=$(cat /run/secrets/DB_PASS)

wp core install --url=$(cat /run/secrets/domain) --title=aalfahal --admin_user=$(cat /run/secrets/WP_AMDIN_USER) --admin_password=$(cat /run/secrets/WP_ADMIN_PASS) --admin_email=admin@admin.ae
wp user create $(cat /run/secrets/WP_USER) aalfahal@student.42abudhabi.com --role=subscriber --user_pass=$(cat /run/secrets/WP_PASS)

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php82/php-fpm.d/www.conf

php-fpm82 -FR