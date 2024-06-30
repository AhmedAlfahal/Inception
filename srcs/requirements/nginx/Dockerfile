FROM alpine:3.19

RUN apk update && apk add nginx openrc

EXPOSE 443

WORKDIR /app/nginx

COPY . .

CMD ["sleep", "9999999"]