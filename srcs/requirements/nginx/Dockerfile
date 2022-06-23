FROM	debian:buster

RUN 	apt-get -y update &&	\
    	apt-get -y upgrade &&	\
    	apt-get -y install nginx	\
    	openssl	\
     	vim		\
     	procps

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509\
        -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42/CN=localhost"\
        -keyout /etc/ssl/private/localhost_p.key\
        -out /etc/ssl/certs/localhost.crt &&\
        chmod 777 /etc/ssl/certs/localhost.crt /etc/ssl/private/localhost_p.key \

COPY	./conf/default	/etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]