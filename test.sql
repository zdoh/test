-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dbTest
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `admin` bit(1) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `new_tablecol_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'den',33,'','2016-05-12 21:28:55'),(2,'Ivanov',22,'\0','2016-05-19 21:28:14'),(3,'Alisa',33,'\0','2016-05-14 23:10:06'),(4,'Sidorov',33,'\0','2016-05-14 23:39:15'),(5,'Misha',43,'\0','2016-05-14 23:39:15'),(6,'tttt',33,'\0','2016-05-16 21:13:42'),(7,'aaaaa',12,'\0','2016-05-19 21:26:47'),(8,'Tett',22,'\0','2016-05-16 21:26:30'),(9,'11',11,'\0','2016-05-18 22:28:58'),(10,'22',22,'\0','2016-05-18 22:29:05'),(11,'33',33,'\0','2016-05-19 19:37:07'),(13,'55',55,'','2016-05-19 20:22:25'),(14,'66',66,'','2016-05-19 21:02:38'),(15,'77',77,'\0','2016-05-19 21:02:43'),(17,'99',33,'','2016-05-22 20:01:59'),(18,'100',42,'','2016-05-22 20:14:29'),(19,'110',33,'\0','2016-05-22 20:15:49'),(20,'43',77,'\0','2016-05-22 20:15:58'),(21,'daer',79,'\0','2016-05-22 20:16:07'),(22,'54',43,'\0','2016-05-22 20:16:42'),(23,'ttew',32,'\0','2016-05-22 20:18:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-23 10:13:02
