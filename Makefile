# Variables
COMPOSE=docker compose -f srcs/docker-compose.yml

# Cibles
.PHONY: all up down clean fclean re data

all: up

up: data
	@$(COMPOSE) up -d --build

down:
	@$(COMPOSE) down

clean:
	@$(COMPOSE) down -v
	@sudo rm -rf /home/$(USER)/data/wpVol
	@sudo rm -rf /home/$(USER)/data/dbVol

fclean: clean
	docker rmi $$(sudo docker images -q) || true

logs :
	
db:
	docker exec -it mariadb bash
	
data:
	@mkdir -p /home/$(USER)/data/wpVol
	@mkdir -p /home/$(USER)/data/dbVol

re: fclean all
