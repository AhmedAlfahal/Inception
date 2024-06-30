#!/bin/sh

cd /usr/share/webapps/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mkdir -p /var/www/html/
ln -s /usr/share/webapps/wordpress/ /var/www/html/