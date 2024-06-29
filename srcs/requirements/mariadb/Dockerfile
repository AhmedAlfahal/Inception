FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client

EXPOSE 3306

WORKDIR /etc/mysql

COPY . .

CMD ["/bin/sh"]