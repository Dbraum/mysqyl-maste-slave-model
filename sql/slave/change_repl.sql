-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: appbricks
-- ------------------------------------------------------
-- Server version	5.7.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


/*
change master to master_host='112.74.112.195',master_user='repl',master_password='ab-mysql',MASTER_AUTO_POSITION = 1;
start slave;
show slave status\G;
*/
-- 避免和master数据库冲突


stop slave;
reset slave;

-- 为了设置gtid_purged，必须先清除gtid_executed。
reset master;
-- 这个gtid set是主库的gtid_executed。
-- set global gtid_purged='146ca884-97f0-11e5-aa16-50e54948b96b:1-472';

show global variables like '%GTID%';
show master status\G;

change master to master_host='112.74.112.195',
master_user='repl',
master_password='ab-mysql'；

show slave status\G;
start slave;