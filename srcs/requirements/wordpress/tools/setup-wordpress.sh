#!/bin/sh

DB_PASS=$(cat /run/secrets/db_pass)
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_pass)
WP_USER_PASS=$(cat /run/secrets/wp_user_pass)

# Check if WordPress is already installed in the volume
if [ ! -f "/var/www/html/wp-config.php" ]; then
    
    # Download WordPress
    cd /tmp
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    
    # Move to volume directory
    cp -r wordpress/* /var/www/html/
    # Remove the leftovers
    rm -rf /tmp/wordpress /tmp/latest.tar.gz
    
    # Create config
    cp /wp-config.php /var/www/html/wp-config.php
    sed -i "s/the_awesome_db_name/${DB_NAME}/" /var/www/html/wp-config.php
    sed -i "s/the_awesome_db_user/${DB_USER}/" /var/www/html/wp-config.php
    sed -i "s/the_awesome_db_pass/${DB_PASS}/" /var/www/html/wp-config.php
    # envsubst < /wp-config-template.php > /var/www/html/wp-config.php

    # Set proper ownership
    chown -R nobody:nobody /var/www/html
    
    ## wp shit
    cd /tmp
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html

    wp core install \
        --url="rreimann.42.fr" \
        --title="Robert's Awesome Site" \
        --admin_user="robert" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="secure@admin.email" \
        --skip-email \
        --allow-root \
        --locale="en_US"
    
    wp user create user secure@user.email --role=author --user_pass="${WP_USER_PASS}" --allow-root
else
    echo "Skipping installation, as WP is already installed :c"
fi

# Start PHP-FPM
php-fpm83 --nodaemonize
