if [ ! -d /var/lib/mysql/$DB_NAME ]; then	#Test whether wordpress is already installed
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -e "CREATE USER '$DB_LOGIN'@'%' identified by '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_LOGIN'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';"
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$DB_ROOTPASS shutdown
fi

exec mysqld_safe
# mariadb foreground 실행