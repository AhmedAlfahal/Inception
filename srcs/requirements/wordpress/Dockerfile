FROM alpine:3.19

RUN apk update && apk add php php-fpm wget mysql-client php-phar php-mysqli php-iconv

COPY ./tools/entrypoint.sh /entrypoint.sh

EXPOSE 9000

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]