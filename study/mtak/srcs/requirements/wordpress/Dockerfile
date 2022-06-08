FROM debian:buster
EXPOSE 9000
COPY ./conf/www.conf . 
COPY ./tools/install.sh .
RUN chmod 777 ./install.sh
RUN ./install.sh
COPY ./tools/start.sh /var/www/wordpress/
WORKDIR /var/www/wordpress
ENTRYPOINT ["sh","start.sh"]
