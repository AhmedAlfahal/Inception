#!/bin/sh

/etc/init.d/mariadb setup
/usr/bin/mysql_install_db --user=mysql
rc-service mariadb start && rc-update add mariadb default
/usr/bin/mysqladmin -u root password 'password'
mysql -u root -e "CREATE DATABASE wordpress;";
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';";
mysql -u root -e "FLUSH PRIVILEGES;";