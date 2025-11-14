FROM alpine:3.22.2

WORKDIR /var/www/html

# Install PHP-FPM and required PHP extensions for WordPress
RUN apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-curl \
    php81-dom \
    php81-exif \
    php81-fileinfo \
    php81-mbstring \
    php81-openssl \
    php81-xml \
    php81-zip \
    php81-redis \
    wget \
    unzip

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf

# Copy WordPress setup script
COPY setup-wordpress.sh /setup-wordpress.sh
RUN chmod +x /setup-wordpress.sh

EXPOSE 9000

CMD ["/setup-wordpress.sh"]
