FROM debian:buster
EXPOSE 9000
COPY ./conf/www.conf .
COPY ./tools/install.sh .
RUN chmod 777 ./install.sh
RUN ./install.sh
RUN chmod 777 /var/www/wordpress/
COPY ./tools/run.sh /var/www/wordpress/
WORKDIR /var/www/wordpress
ENTRYPOINT ["bash","run.sh"]
