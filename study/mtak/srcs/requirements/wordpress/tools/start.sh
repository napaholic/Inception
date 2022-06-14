#!bin/bash
sleep 5
FILE=/var/www/wordpress/wp-config.php 
if [ ! -f "$FILE" ]; then
	wp cli update
   	wp core download --allow-root --path='/var/www/wordpress'
	wp core config \
		--allow-root \ #관리자권한옵션
		--dbname=$DB_NAME \
		--dbuser=$DB_LOGIN \
		--dbpass=$DB_PASS \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	wp core install \
		--allow-root \
		--url=$DOMAIN \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMINPASS \
		--admin_email="jaewkim@student.42seoul.kr" \
		--skip-email \
		--path='/var/www/wordpress'

	wp user create \
		--allow-root \
		$WP_USER \
		kimja5163@gmail.com \
		--user_pass=$WP_USERPASS \
		--role=author
fi
php-fpm7.3 --nodaemonize