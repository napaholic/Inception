if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file 만들기
    until   wp config create	--allow-root \
    							--dbname=$WP_DB_NAME \
    							--dbuser=$DB_ADMIN_NAME\
                                --dbpass=$DB_ADMIN_PASSWORD \
                                --dbhost=mariadb:3306 --path='/var/www/wordpress'
            echo "asdf"
            sleep 2
    # --allow-root : 관리자 권한 허용
    wp core install     --allow-root --url=$DOMAIN \
    					--title=$WP_TITLE \
    					--admin_user=$WP_ADMIN \
                        --admin_password=$WP_ADMINPASS \
                        --admin_email=$WP_EMAIL1 \
                        --path='/var/www/wordpress'
    wp user create      --allow-root $WP_USER $WP_EMAIL2 \
    					--user_pass=$WP_USERPASS \
    					--role=author\
                        --path='/var/www/wordpress'
fi

# foreground로 실행하기
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F

# user 확인하기
# wp user list --allow-root
