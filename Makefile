NAME = inception

inception: all

all: env
	@docker compose -f ./srcs/docker-compose.yml up -d --build

env:
	@if [ ! -f srcs/.env ]; then cp /home/touteiro/data/.env srcs/.env ; fi;
	@mkdir -p /home/touteiro/data/wordpress/
	@mkdir -p /home/touteiro/data/mysql/

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -fa
	@sudo rm -rf /home/touteiro/data/wordpress/*
	@sudo rm -rf /home/touteiro/data/mysql/*
	@rm -rf srcs/.env

re: clean all

.PHONY: all down clean re

