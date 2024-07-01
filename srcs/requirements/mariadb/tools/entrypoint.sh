#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	rc-service mariadb start

    if rc-service mariadb status; then
        echo "MariaDB is already running."
    else
        rc-service mariadb start
    fi  


	mysql -u root -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost' WITH GRANT OPTION;"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

	mysql -u root -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;"
	mysql -u root -e "FLUSH PRIVILEGES;"

	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'toor';"

fi

# # Comment skip-networking
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb restart
rc-service mariadb stop


# this command will make the container alive by running the mariadb deamon in the foreground
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid