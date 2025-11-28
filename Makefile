all: up

up:
	@mkdir -p ${HOME}/data/www
	@mkdir -p ${HOME}/data/db
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@docker compose -f ./srcs/docker-compose.yml down

status:
	@docker compose -f ./srcs/docker-compose.yml ps

clean:
	@rm -rf ${HOME}/data/db/*
	@rm -rf ${HOME}/data/www/*
