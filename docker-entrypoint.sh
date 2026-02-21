#!/bin/sh
set -e
export PORT=${PORT:-8080}
envsubst '${PORT}' < /tmp/nginx.railway.conf.template > /etc/nginx/nginx.conf
rm -f /etc/nginx/conf.d/default.conf
# php-fpm primero (en segundo plano), luego nginx (en primer plano para mantener el contenedor)
php-fpm -D
exec nginx
