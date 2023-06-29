NAME = inception
SHELL = /bin/bash
COMPOSE = ./srcs/docker-compose.yml

inception: all

all:
	@docker compose -f $(COMPOSE) up -d --build

bonus: COMPOSE = ./srcs/docker-compose-bonus.yml
bonus: bbuilt all

bbuilt:
	@touch .bbuilt

env:
	@if [ ! -f srcs/.env ] ; then\
		read -p "Env file path: " ENV_FILE; \
		if [ -a $$ENV_FILE ] ; then\
			cp $$ENV_FILE srcs/.env ;\
		else\
			echo "Wrong env file path"; \
			exit 42; \
		fi; \
	fi;
	@mkdir -p /home/touteiro/data/wordpress/
	@mkdir -p /home/touteiro/data/mysql/
	@mkdir -p /home/touteiro/data/vue/

down:
	@if [ ! -f .bbuilt ] ; then\
		docker compose -f ./srcs/docker-compose.yml down; \
	else \
		docker compose -f ./srcs/docker-compose-bonus.yml down; \
		rm .bbuilt; \
	fi;

clean: down
	@docker system prune -fa
	@sudo rm -rf /home/touteiro/data/wordpress/*
	@sudo rm -rf /home/touteiro/data/mysql/*
	@sudo rm -rf /home/touteiro/data/vue/*
	@docker volume ls -q > test
	@if [ -s test ]; then docker volume rm $$(docker volume ls -q); fi;
	@sudo rm -rf test

fclean: clean
	@sudo rm -rf srcs/.env

re: clean all

.PHONY: all down clean fclean re env bonus
