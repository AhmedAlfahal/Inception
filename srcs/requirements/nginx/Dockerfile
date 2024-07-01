FROM alpine:3.19

RUN apk update && apk add nginx openrc

EXPOSE 80

RUN openrc

RUN touch /run/openrc/softlevel

RUN mkdir -p /run/nginx

RUN mkdir -p /var/www/html

RUN mkdir -p /var/lib/nginx

WORKDIR /app/nginx

RUN chown -R nginx:nginx /var/lib/nginx

RUN chown -R nginx:nginx /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# CMD ["sleep", "9999999"]

ENTRYPOINT ["/entrypoint.sh"]