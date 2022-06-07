DOCKER_COMPOSE_FILE	=	srcs/docker-compose.yml

all:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

re: clean all

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

clean: stop
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

ps:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

.PHONY : all re stop clean ps

# docker container stop $(docker ps -a -q)
# docker rmi -f $(docker images -qa)
# docker volume rm $(docker volume ls -q)
# docker system prune
# sudo rm -rf /home/seungoh/data

# mount file 만들기
# sudo mkdir -p /home/seungoh/data/wordpress
# sudo mkdir -p /home/seungoh/data/mariadb
