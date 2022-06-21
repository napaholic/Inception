# database의 값을 환경변수에서 받아서 설정하기
if [ ! -d /var/lib/mysql/$WP_DB_NAME ]; then
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
    mysql -e "CREATE USER '${DB_LOGIN}'@'%' IDENTIFIED BY '${DB_PASS}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_LOGIN}'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOTPASS}';"
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p${DB_ROOTPASS} shutdown
fi

# mariadb foreground로 실행하기
exec mysqld_safe
