all: build up
	mkdir -p ./data/wordpress
	mkdir -p ./data/mysql

build:
	mkdir -p ./data/wordpress
	mkdir -p ./data/mysql
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

clean: down
	docker system prune --all --force;
	rm -fr ./data

re: clean all