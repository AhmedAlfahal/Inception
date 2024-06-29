FROM alpine:3.19

RUN apk update && apk add php82 fcgi php82-cgi wget mysql mysql-client

EXPOSE 9000

WORKDIR /etc/php7

COPY . .

CMD ["/bin/sh"]