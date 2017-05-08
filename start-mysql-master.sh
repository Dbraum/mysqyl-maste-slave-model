#!/bin/bash

mkdir -p $PWD/data
mkdir -p $PWD/logs
chmod 644 $PWD/conf/my.cnf

# 强制杀死正在运行的 mysql-master
docker rm -f mysql-master

# mysql master
docker run -d --restart=on-failure:5 --name mysql-master \
              -p 3306:3306 \
              -e "MYSQL_ROOT_PASSWORD=my-secret-ab" \
              -e "MYSQL_DATABASE=appbricks" \
              -v $PWD/conf/master-slave:/etc/mysql/conf.d \
              -v $PWD/sql/master:/docker-entrypoint-initdb.d \
              -v $PWD/data:/var/lib/mysql \
              -v $PWD/logs:/var/log \
              mysql:5.7.12 --server_id=1 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci