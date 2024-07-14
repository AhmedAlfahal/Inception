FROM alpine:3.19

RUN apk update && apk add php php-fpm wget curl mysql-client php-phar php-mysqli php-iconv

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

RUN mkdir -p /var/www/html/ && ln -s /wordpress /var/www/html/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

# CMD ["sleep", "1000000"]