HOMEDIR = /home/mtak

all: start

start:
	@sleep 1
	@echo "adding mtak.42.fr to hosts..."
	@sudo echo '127.0.0.1 mtak.42.fr' >> /etc/hosts;
	@sudo echo '127.0.0.1 www.mtak.42.fr' >> /etc/hosts;	
	@echo "creating volume dirs..."
	@sudo mkdir -p $(HOMEDIR)/data/wordpress
	@sudo mkdir -p $(HOMEDIR)/data/mariadb
	@echo "building..."
	docker-compose -f ./srcs/docker-compose.yml up --build

build:
	docker-compose -f ./srcs/docker-compose.yml up --build

up:
	@echo "starting containers..."
	docker-compose -f ./srcs/docker-compose.yml up

down:
	@echo "stopping containers..."
	docker-compose -f ./srcs/docker-compose.yml down

ps:
	docker-compose -f ./srcs/docker-compose.yml ps

rmvol: down
	docker volume rm $$(docker volume ls -q);
	sudo rm -R $(HOMEDIR)/data/wordpress;\
	sudo rm -R $(HOMEDIR)/data/mariadb;\
	mkdir -p $(HOMEDIR)/data/wordpress;\
	mkdir -p $(HOMEDIR)/data/mariadb;

clean:	
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker network rm $$(docker network ls -q);\
	docker volume rm $$(docker volume ls -q);\
	sudo rm -R $(HOMEDIR)/data/wordpress;\
	sudo rm -R $(HOMEDIR)/data/mariadb;

re: rmvol start

.PHONY: start build up down clean re ps
