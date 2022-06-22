#!/bin/sh
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER '$DB_LOGIN'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_LOGIN'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOTPASS shutdown

exec mysqld_safe
