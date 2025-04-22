# Variables
COMPOSE=sudo docker compose --env-file srcs/.env -f srcs/docker-compose.yml

# Cibles
.PHONY: all up down clean fclean re

all: up

up:
	@echo "🔧 Lancement des services..."
	@$(COMPOSE) up -d --build

down:
	@echo "🛑 Arrêt des services..."
	@$(COMPOSE) down

clean:
	@echo "🧹 Suppression des conteneurs, volumes, réseaux..."
	@$(COMPOSE) down -v

fclean: clean
	@echo "🔥 Suppression des images Docker..."
	sudo docker rmi $$(sudo docker images -q) || true

re: fclean all
