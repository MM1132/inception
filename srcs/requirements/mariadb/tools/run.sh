#!/bin/sh

DB_PASS=$(cat /run/secrets/db_pass)
export DB_PASS

# Check if database is already initialized
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then

    # Fill with env variables and create a new file from the template
    envsubst < ./conf/init-db-template.sql > ./conf/init-db.sql
    
    # Start MariaDB temporarily in the background
    mysqld --user=mysql --datadir=/var/lib/mysql &
    
    # Wait for MariaDB to start
    sleep 5
    
    # Wait more :p 
    until mysqladmin ping -h localhost --silent; do
        sleep 2
    done
    
    # Run the init sql file we got from the template
    mysql < ./conf/init-db.sql
    
    # Stop MariaDB
    mysqladmin shutdown
else
    echo "Database already initialized, skipping..."
fi

# Start MariaDB in foreground
exec mysqld --user=mysql
