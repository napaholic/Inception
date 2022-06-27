sleep 5
if [ ! -f /var/www/wordpress/wp-config.php ]; then
# wp-config.php file 만들기
	wp cli update
	wp core download --allow-root --path='/var/www/wordpress'
    wp core config		--allow-root\
    					--dbname=$DB_NAME\
    					--dbuser=$DB_LOGIN\
    					--dbpass=$DB_PASS\
    					--dbhost=mariadb:3306\
    					--path='/var/www/wordpress'
	sleep 2
    # wordpress 세팅하기
    # --allow-root : 관리자 권한 허용
    wp core install     --allow-root		\
    					--url=$DOMAIN	\
    					--title=$WP_TITLE	\
    					--admin_user=$WP_ADMIN	\
                        --admin_password=$WP_ADMINPASS	\
                        --admin_email="jaewkim@student.42seoul.com"	\
                        --path='/var/www/wordpress' >> /log.txt
    wp user create      --allow-root	$WP_USER \
    									$WP_EMAIL2	\
    					--user_pass=$WP_USERPASS --role=author	\
                        --path='/var/www/wordpress' >> /log.txt
fi

# foreground로 실행하기
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F

# user 확인하기
# wp user list --allow-root
