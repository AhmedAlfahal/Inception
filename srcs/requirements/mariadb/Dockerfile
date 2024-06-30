FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-common mariadb-client openrc

EXPOSE 3306

RUN openrc

RUN touch /run/openrc/softlevel

WORKDIR /app/mariadb

COPY . .

RUN chmod +x ./tools/entrypoint.sh

CMD ["sleep", "infinity"]

# ENTRYPOINT ["./tools/entrypoint.sh"]