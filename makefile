all: build up

build:
	mkdir -p ~/data/mysql ~/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down -v

clean: down
	docker system prune --all --force;
	rm -fr ~/data

re: clean all