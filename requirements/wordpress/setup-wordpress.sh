#!/bin/sh

# Check if WordPress is already installed in the volume
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Installing WordPress..."
    
    # Download WordPress
    cd /tmp
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    
    # Move to volume directory
    cp -r wordpress/* /var/www/html/
    rm -rf /tmp/wordpress /tmp/latest.tar.gz
    
    # Create config from sample
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    
    # Configure WordPress database connection
    sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
    sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
    sed -i "s/password_here/wppassword/" /var/www/html/wp-config.php
    sed -i "s/localhost/mariadb/" /var/www/html/wp-config.php
    
    # Set proper ownership
    chown -R nobody:nobody /var/www/html
    
    echo "WordPress installation complete!"
else
    echo "WordPress already exists in volume, skipping installation..."
fi

# Start PHP-FPM
php-fpm81 --nodaemonize