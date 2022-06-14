FROM debian:buster
EXPOSE 9000

RUN		apt-get update -y &&\
		apt-get upgrade -y
RUN		apt-get -y install php7.3\
		php-fpm\
		php-mysqli\
		mariadb-client\
		wget\
		curl

# wordpress 다운받기
RUN		wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www
RUN		cd /var/www &&\
		tar -xvf wordpress-5.9.2.tar.gz &&\
		rm wordpress-5.9.2.tar.gz

COPY ./conf/www.conf ./etc/php/7.3/fpm/pool.d
RUN		chown -R www-data:www-data /var/www/wordpress

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp
#COPY install.sh .
#RUN chmod 777 ./install.sh
#RUN ./install.sh

COPY 	./tools/start.sh /
CMD		bash /start.sh
#WORKDIR /var/www/wordpress
#ENTRYPOINT ["sh","start.sh"]
