#!bin/bash
apt-get update
apt-get upgrade -yq
apt-get install -yq php7.3-fpm php7.3-mysql mariadb-client wget
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mv ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /var/www/wordpress
chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/
mkdir -p /run/php/