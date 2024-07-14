#!/bin/sh
sed -i 's/ServerNamePlaceHolder/'$(cat /run/secrets/domain)'/' /etc/nginx/nginx.conf
nginx -g "daemon off;"