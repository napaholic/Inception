#!/bin/sh
service mysql start;


mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB";
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PW'";
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%'";
mysql -u $MYSQL_ROOT $MYSQL_DB < wp-saved.sql;
mysql -e "set password=password('$MYSQL_ROOT_PW')";
mysql -e "FLUSH PRIVILEGES";

mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PW shutdown

exec mysqld_safe
