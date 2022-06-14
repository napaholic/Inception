FROM debian:buster
EXPOSE 3306

RUN		apt-get -y update &&\
		apt-get -y upgrade &&\
		apt-get -y install -yq mariadb-server mariadb-client

COPY	./tools/mariadb.sh		/
COPY	./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

CMD		bash /mariadb.sh
