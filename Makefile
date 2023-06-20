NAME = inception

inception: all

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -fa

re: clean all

.PHONY: all down clean re

