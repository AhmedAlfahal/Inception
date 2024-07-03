#!/bin/sh

/etc/init.d/mariadb setup

rc-service mariadb start

mysql -u $(cat /run/secrets/MARIADB_ROOT_USER) -e "CREATE DATABASE $(cat /run/secrets/DB_NAME) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

mysql -u $(cat /run/secrets/MARIADB_ROOT_USER) -e "CREATE USER '$(cat /run/secrets/DB_USER)'@'%' IDENTIFIED BY '$(cat /run/secrets/DB_PASS)';"

mysql -u $(cat /run/secrets/MARIADB_ROOT_USER) -e "GRANT ALL PRIVILEGES ON $(cat /run/secrets/DB_NAME).* TO '$(cat /run/secrets/DB_USER)'@'%' IDENTIFIED BY '$(cat /run/secrets/DB_PASS)' WITH GRANT OPTION;"

mysql -u $(cat /run/secrets/MARIADB_ROOT_USER) -e "FLUSH PRIVILEGES;"

mysql -u $(cat /run/secrets/MARIADB_ROOT_USER) -e "ALTER USER '$(cat /run/secrets/MARIADB_ROOT_USER)'@'localhost' IDENTIFIED BY '$(cat /run/secrets/MARIADB_ROOT_PASSWORD)';"


sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb restart
rc-service mariadb stop

/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid