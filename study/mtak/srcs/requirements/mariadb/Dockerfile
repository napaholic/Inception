FROM debian:buster
EXPOSE 3306
RUN apt-get update
RUN apt-get install -yq mariadb-server mariadb-client
COPY ./tools/start.sh .
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db
ENTRYPOINT ["sh", "start.sh"]
