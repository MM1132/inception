FROM alpine:3.22.2

WORKDIR /

RUN apk add mariadb mariadb-client

RUN mariadb-install-db --user=wpuser --datadir=/var/lib/mysql

RUN rc-service mariadb start

RUN mariadb-secure-installation

RUN rc-update add mariadb default
