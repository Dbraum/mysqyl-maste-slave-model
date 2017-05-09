#!/bin/bash

mkdir -p $PWD/data
mkdir -p $PWD/logs
chmod 644 $PWD/conf/my.cnf

# 强制杀死正在运行的 mysql-slave
docker rm -f mysql-slave

# mysql master
docker run -d --restart=on-failure:5 --name mysql-slave \
              -p 3306:3306 \
              -e "MYSQL_ROOT_PASSWORD=my-secret-ab" \
              -e "MYSQL_DATABASE=appbricks" \
              -v $PWD/conf/master-slave:/etc/mysql/conf.d \
              -v $PWD/sql/slave:/docker-entrypoint-initdb.d \
              -v $PWD/data:/var/lib/mysql \
              -v $PWD/logs:/var/log \
              mysql:5.7.12 --server_id=3 --skip-slave-start --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci


docker logs -f mysql-slave
