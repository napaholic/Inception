#!bin/bash
apt-get update
apt-get install -yq nginx openssl
rm -rf /var/www/html/*
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Tak/CN=localhost" -keyout /etc/ssl/private/jaewkim.key -out /etc/ssl/certs/jaewkim.crt
chmod 600 /etc/ssl/certs/jaewkim.crt /etc/ssl/private/jaewkim.key