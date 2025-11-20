FROM alpine:3.22.2

WORKDIR /var/www/html

# Install PHP-FPM and required PHP extensions for WordPress
RUN apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-mbstring \
    php83-openssl \
    php83-xml \
    php83-zip \
    php83-redis \
    wget \
    unzip

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php83/php-fpm.d/www.conf

COPY ./conf/wp-config-template.php /wp-config.php

# Copy WordPress setup script
COPY ./tools/setup-wordpress.sh /setup-wordpress.sh
RUN chmod +x /setup-wordpress.sh

EXPOSE 9000

CMD ["/setup-wordpress.sh"]
