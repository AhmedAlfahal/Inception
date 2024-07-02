FROM alpine:3.19

RUN apk update && apk add php php-fpm wget mysql mysql-client openrc php-phar php-mysqli php-iconv

RUN openrc 

RUN touch /run/openrc/softlevel


WORKDIR /usr/share/webapps/

COPY ./tools/entrypoint.sh /entrypoint.sh

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

EXPOSE 9000

RUN chmod +x /entrypoint.sh

# CMD ["sleep", "infinity"]

ENTRYPOINT ["/entrypoint.sh"]