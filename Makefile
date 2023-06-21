NAME = inception

inception: all

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -fa
	@sudo rm -rf /home/touteiro/data/wordpress/*
	@sudo rm -rf /home/touteiro/data/mysql/*

re: clean all

.PHONY: all down clean re

