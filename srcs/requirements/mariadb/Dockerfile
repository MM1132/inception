FROM debian:13

WORKDIR /

# Install MariaDB
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y mariadb-server mariadb-client galera-4 gettext-base

# Create socket directory
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Secure installation stuff
RUN mkdir -p ./conf/
COPY ./conf/secure-installation.sql ./conf/
RUN mysqld --bootstrap --skip-networking < ./conf/secure-installation.sql

# Database Configuration
COPY ./conf/init-db-template.sql ./conf/

# Make MariaDB listen on app ips not just localhost
# 99 in the name because conf files are ran alphabetically
# adding 99 will make sure it is ran last and therefore overrides the default configuration
RUN echo "[mysqld]\nbind-address = 0.0.0.0" > /etc/mysql/mariadb.conf.d/99-bind.cnf

# Run the database configuration again, just in case
# And then run the mariadb itself
RUN mkdir -p ./tools/
COPY ./tools/run.sh ./tools/
RUN chmod +x ./tools/run.sh

EXPOSE 3306

CMD ["./tools/run.sh"]
