#!/bin/sh
# database의 값을 환경변수에서 받아서 설정하기
# service mysql start
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
mysql -e "CREATE USER '$DB_ADMIN_NAME'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_ADMIN_NAME'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PW shutdown
# mariadb foreground로 실행하기
exec mysqld_safe
