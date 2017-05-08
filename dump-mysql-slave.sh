#!/bin/bash

_date=`date "+%Y%m%d"`

# 当前日期文件夹
mkdir -p $PWD/dump/$_date

# 备份整库
docker exec mysql-slave sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > $PWD/dump/$_date/all-databases.sql
