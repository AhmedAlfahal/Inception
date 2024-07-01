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

wp config create --dbname=wordpress --dbuser=wordpress --dbhost=mariadb --dbpass=wordpress

wp core install --url=localhost --title=aalfahal --admin_user=admin --admin_email=admin@admin.ae
# this command will make the container alive by running the wordpress deamon in the foreground and am downloading this php82-cgi package to run the php scripts
php-fpm82 -FR