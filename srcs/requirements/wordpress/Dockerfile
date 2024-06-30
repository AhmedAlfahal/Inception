FROM alpine:3.19

RUN apk update && apk add php82 fcgi php82-cgi wget mysql mysql-client


WORKDIR /usr/share/webapps/

COPY . .

EXPOSE 9000

RUN chmod +x ./tools/entrypoint.sh

# CMD ["sleep", "infinity"]

ENTRYPOINT ["./tools/entrypoint.sh"]