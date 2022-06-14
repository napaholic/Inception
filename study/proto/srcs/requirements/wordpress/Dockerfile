FROM debian:buster
EXPOSE 9000
COPY install.sh .
RUN chmod 777 ./install.sh
RUN ./install.sh

COPY 	./tools/start.sh /
WORKDIR /var/www/wordpress
ENTRYPOINT ["sh","start.sh"]
