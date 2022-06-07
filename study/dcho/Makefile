
DB = /home/dcho/data/dbdata
WP = /home/dcho/data/wp
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all:
		@sudo mkdir -p $(DB) $(WP)
		@$(DOCKER_COMPOSE) up --build -d

up:
		@$(DOCKER_COMPOSE) up --build -d

fclean:
		@$(DOCKER_COMPOSE) down --rmi all --volumes
		@docker rmi -f debian:buster
		@sudo rm -rf $(DB) $(WP)

.PHONY:	 all up fclean