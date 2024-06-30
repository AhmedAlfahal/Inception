all: build up

build:
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
	rm -fr ./srcs/requirements/wordpress/wordpress
	docker system prune --all --force;

re: clean all