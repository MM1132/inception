all: up

up:
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

status:
	@docker compose -f ./srcs/docker-compose.yml ps

clean:
	@rm -rf ~/data/db/*
	@rm -rf ~/data/www/*
