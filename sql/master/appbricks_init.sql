-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version 5.7.13

CREATE DATABASE IF NOT EXISTS appbricks DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
use appbricks;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `custom_meta` text,
  `custom_meta_sql` varchar(255) DEFAULT NULL,
  `custom_path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `info` text,
  `meta` varchar(255) DEFAULT NULL,
  `methods` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `structure` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `menu_resource`
--

DROP TABLE IF EXISTS `menu_resource`;
CREATE TABLE `menu_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_person_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `methods` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort_no` int(11) NOT NULL,
  `structure` varchar(255) NOT NULL,
  `update_person_id` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_person_id` int(11) DEFAULT NULL,
  `create_person_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_person_id` int(11) DEFAULT NULL,
  `update_person_name` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,1,NULL,'2016-05-31 14:35:49','系统管理员',NULL,1,NULL,'2016-05-31 14:35:20'),(2,1,NULL,'2016-05-31 14:34:04','管理层',NULL,1,NULL,'2016-05-31 14:34:18'),(3,1,NULL,'2016-05-31 14:34:42','普通用户',NULL,1,NULL,'2016-05-31 14:34:50'),(4,1,NULL,'2016-05-30 10:51:53','CEO',NULL,1,NULL,'2016-05-30 10:51:41');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_resource`
--

DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_person_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `methods` varchar(255) DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `update_person_name` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `create_person` varchar(255) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `is_lock` bit(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_person` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2016-05-23 17:54:46',NULL,1,'技术部',NULL,'系统管理员','male','\0','\0','63a9f0ea7bb98050796b649e85481845',NULL,'2016-05-23 17:55:13',NULL,'admin',NULL),(2,'2016-05-23 18:15:36',NULL,1,'技术部',NULL,'张三','female','\0','\0','63a9f0ea7bb98050796b649e85481845',NULL,'2016-05-23 18:15:36',NULL,'jingli',NULL),(3,'2016-05-23 18:16:35',NULL,2,'财务部',NULL,'李四','male','\0','\0','63a9f0ea7bb98050796b649e85481845',NULL,'2016-05-23 18:37:56',NULL,'yuangong',NULL),(4,'2016-05-31 14:39:40',NULL,3,'人事部',NULL,'王五','male','\0','\0','63a9f0ea7bb98050796b649e85481845',NULL,'2016-05-31 14:39:50',NULL,'ceo',NULL),(5,'2016-05-31 14:51:27',NULL,3,'人事部',NULL,'赵六','male','\0','\0','63a9f0ea7bb98050796b649e85481845',NULL,'2016-05-31 14:52:35',NULL,'yonghu',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_person_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `update_person_name` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,NULL,NULL,2,NULL,NULL,2),(2,NULL,NULL,4,NULL,NULL,4),(3,NULL,NULL,3,NULL,NULL,3),(4,NULL,NULL,3,NULL,NULL,5);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test'
--
-- Dump completed on 2016-06-15 15:47:48
