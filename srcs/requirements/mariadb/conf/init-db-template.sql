-- Create the database
CREATE DATABASE IF NOT EXISTS `${DB_NAME}`;

-- Create the user with access from any host
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON `${DB_NAME}`.* TO '${DB_USER}'@'%';

-- Flush privileges
FLUSH PRIVILEGES;
