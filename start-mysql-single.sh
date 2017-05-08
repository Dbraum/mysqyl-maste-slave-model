#!/bin/bash

mkdir -p $PWD/data
mkdir -p $PWD/logs
chmod 644 $PWD/conf/my.cnf

# 强制杀死正在运行的 mysql-single
docker rm -f mysql-single

# mysql single
docker run -d --restart=on-failure:5 --name mysql-single \
              -p 3306:3306 \
              -e "MYSQL_ROOT_PASSWORD=my-secret-ab" \
              -e "MYSQL_DATABASE=appbricks" \
              -v $PWD/conf:/etc/mysql/conf.d \
              -v $PWD/sql/single:/docker-entrypoint-initdb.d \
              -v $PWD/data:/var/lib/mysql \
              -v $PWD/logs:/var/log \
              mysql:5.7.12 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
