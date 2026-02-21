#!/bin/sh
set -e
export PORT=${PORT:-8080}
envsubst '${PORT}' < /tmp/nginx.railway.conf.template > /etc/nginx/nginx.conf
# Eliminar config por defecto para evitar conflictos
rm -f /etc/nginx/conf.d/default.conf
nginx
exec php-fpm
