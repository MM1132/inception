-- change the root password
-- ALTER USER 'root'@'localhost' IDENTIFIED BY 'my-root-password';

-- remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- disallow remote root login
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');

-- drop test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';

-- apply changes
FLUSH PRIVILEGES;
