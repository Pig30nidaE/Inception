SRCS = srcs
RM = rm -rf
DB_V = /home/sanghyol/data/db
WWW_V = /home/sanghyol/data/wordpress
COMPOSE_FILE = $(SRCS)/docker-compose.yml

all:
	@if [ ! -d $(DB_V) ]; then \
		mkdir -p $(DB_V); \
	else \
		echo "Directory already exists."; \
	fi
	@if [ ! -d $(WWW_V) ]; then \
		mkdir -p $(WWW_V); \
	else \
		echo "Directory already exists."; \
	fi
	@docker compose -f $(COMPOSE_FILE) build

up:
	@docker compose -f $(COMPOSE_FILE) up -d

down:
	@docker compose -f $(COMPOSE_FILE) down

logs:
	@docker compose -f $(COMPOSE_FILE) logs

clean:
	@make down
	@docker system prune -f --all

fclean:
	@make down
	@volumes=$(shell docker volume ls -q); \
	if [ -z "$$volumes" ]; then \
	    echo "No volumes to remove."; \
	else \
	    docker volume rm $$volumes; \
	fi
	@make clean
	@sudo $(RM) $(DB_V)/*
	@sudo $(RM) $(WWW_V)/*

re:
	@make fclean
	@make all

.PHONY: all clean fclean re up down
