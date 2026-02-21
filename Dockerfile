# Dockerfile para Railway: PHP + Nginx en un solo contenedor
FROM php:8.2-fpm

# Instalar nginx y dependencias (gettext proporciona envsubst)
RUN apt-get update && apt-get install -y \
    nginx \
    gettext-base \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libwebp-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Extensiones PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip mbstring xml

WORKDIR /var/www/html

# Copiar aplicación (respetando .dockerignore, que incluye config/database.php)
COPY . .

# Configuración Nginx para contenedor único (php-fpm en localhost)
# Se usa como plantilla; envsubst sustituye ${PORT} al arrancar
COPY nginx.railway.conf /tmp/nginx.railway.conf.template

# Script de arranque: sustituye PORT y lanza nginx + php-fpm
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

CMD ["/bin/sh", "/docker-entrypoint.sh"]
