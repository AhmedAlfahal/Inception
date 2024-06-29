FROM alpine:3.19

RUN apk update && apk add nginx openrc

EXPOSE 443

WORKDIR /etc/nginx

COPY . .

CMD ["/bin/sh"]