#!bin/bash
FILE=/create_db.sql
if [ ! -d /var/lib/mysql/$DB_NAME ]; then	#Test whether wordpress is already installed
    service mysql start
    mysql "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql "CREATE USER '$DB_LOGIN'@'%' identified by '$DB_PASS';"
    mysql "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_LOGIN'@'%';"
    mysql "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';"
    mysql "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$DB_ROOTPASS shutdown
fi

exec mysqld_safe
# mariadb foreground 실행