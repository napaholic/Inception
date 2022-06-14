FROM debian:buster
EXPOSE 3306
RUN		apt-get -y update
RUN		apt-get -y upgrade
RUN		apt-get install -yq mariadb-server mariadb-client
COPY	./tools/mariadb.sh .
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/mariadb.sh     /mariadb.sh
CMD		bash/mariadb.sh
