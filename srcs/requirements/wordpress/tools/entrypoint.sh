#!/bin/sh

cd /usr/share/webapps/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mkdir -p /var/www/html/
ln -s /usr/share/webapps/wordpress/ /var/www/html/

cd wordpress/

apk add curl
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp config create --dbname=$(cat /run/secrets/DB_NAME) --dbuser=$(cat /run/secrets/DB_USER) --dbhost=mariadb --dbpass=$(cat /run/secrets/DB_PASS)

wp core install --url=$(cat /run/secrets/domain) --title=aalfahal --admin_user=$(cat /run/secrets/WP_AMDIN_USER) --admin_password=$(cat /run/secrets/WP_ADMIN_PASS) --admin_email=admin@admin.ae
wp user create $(cat /run/secrets/WP_USER) aalfahal@student.42abudhabi.com --role=subscriber --user_pass=$(cat /run/secrets/WP_PASS)


#this command will replace the default listen ip address from 127.0.0.1 to 0.0.0.0
sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php82/php-fpm.d/www.conf

# this command will make the container alive by running the php deamon in the foreground.
php-fpm82 -FR