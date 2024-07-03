FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client openrc

EXPOSE 3306

RUN openrc

RUN touch /run/openrc/softlevel

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]