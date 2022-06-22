#!/bin/sh
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
mysql -e "CREATE USER '$DB_ADMIN_NAME'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_ADMIN_NAME'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PW shutdown

exec mysqld_safe
