-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hquiz
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `answer_history`
--

DROP TABLE IF EXISTS `answer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_history` (
  `ahid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  `answer` longtext,
  `answer_status` varchar(45) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`ahid`),
  KEY `fk_question2_idx` (`qid`),
  KEY `fk_user_profile2_idx` (`empid`),
  CONSTRAINT `fk_question2` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile2` FOREIGN KEY (`empid`) REFERENCES `user_profile` (`empid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_history`
--

LOCK TABLES `answer_history` WRITE;
/*!40000 ALTER TABLE `answer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answered_correct`
--

DROP TABLE IF EXISTS `answered_correct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answered_correct` (
  `accid` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`accid`),
  KEY `fk_user_profile1_idx` (`empid`),
  KEY `fk_question_idx` (`qid`),
  KEY `fk_question4_idx` (`qid`),
  CONSTRAINT `fk_question4` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile1` FOREIGN KEY (`empid`) REFERENCES `user_profile` (`empid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answered_correct`
--

LOCK TABLES `answered_correct` WRITE;
/*!40000 ALTER TABLE `answered_correct` DISABLE KEYS */;
/*!40000 ALTER TABLE `answered_correct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `difficulty` int(11) DEFAULT '3',
  `option_a` longtext,
  `option_b` longtext,
  `option_c` longtext,
  `option_d` longtext,
  `correct_ans` longtext,
  `status` varchar(45) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Table that stores all the question related data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'MCQ','What is the price of a Hilti Drill?',2,'$100','$200','$250','$300','c','Active',NULL),(2,'MCQ','What is the color of hilti drill?',3,'Red','Blue','Green','Yellow','a','Active',NULL),(3,'MCQ','What is the wattage of Hilti Drill?',4,'1500W','2000W','2500W','3000W','d','Active',NULL),(4,'MCQ','What is the price of Hilti Chain saw?',3,'$1000','$1200','$1400','$1600','c','Active',NULL),(5,'MCQ','What is the the length of the Hilti chain saw?',4,'1ft','2ft','3ft','4ft','d','Active',NULL),(6,'MCQ','What is the color of the Hilti chain saw?',2,'Red','Blue','Green','Yellow','a','Inactive',NULL),(7,'MCQ','What is the length of Hilti Hammer?',4,'10 inch','12 inch','13 inch','15 inch','c','Active',NULL),(8,'MCQ','What is the weight of the Hilti Hammer?',4,'250 gm','180 gm','300 gm','500 gm','d','Active',NULL),(9,'MCQ','What is the price of the Hilti hammer?',5,'$100','$150','$200','$250','1','Active',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_topic`
--

DROP TABLE IF EXISTS `related_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_topic` (
  `rtopicid` int(11) NOT NULL AUTO_INCREMENT,
  `topicid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rtopicid`),
  KEY `fk_question_idx` (`qid`),
  KEY `fk_topic_idx` (`topicid`),
  CONSTRAINT `fk_question` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_topic` FOREIGN KEY (`topicid`) REFERENCES `topic` (`topicid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_topic`
--

LOCK TABLES `related_topic` WRITE;
/*!40000 ALTER TABLE `related_topic` DISABLE KEYS */;
INSERT INTO `related_topic` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9);
/*!40000 ALTER TABLE `related_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topicid` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(100) NOT NULL,
  PRIMARY KEY (`topicid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tags for quiz objects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Drill'),(2,'Chain saw'),(3,'Hammer');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `tool_id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_title` varchar(100) NOT NULL,
  `tool_img_res` varchar(100) NOT NULL,
  `tool_feature` text,
  `tool_application` text,
  PRIMARY KEY (`tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `empid` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `display_pic` varchar(100) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `as_of_date` datetime NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'1234','poorna_1','Poorna','Thejasvi','Prajna','BI','0000-00-00 00:00:00','pthejasv@andrew.cmu.edu'),(2,'1234','karthik_2','Karthik','B',NULL,'IT','0000-00-00 00:00:00','karthikb@andrew.cmu.edu'),(3,'1234','nikhil_3','Nikhil','Agarwal',NULL,'Marketing','0000-00-00 00:00:00','nikhilba@andrew.cmu.edu'),(4,'1234','himanshu_4','Himanshu','Agarwal',NULL,'HR','0000-00-00 00:00:00','himanshua@andrew.cmu.edu');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-11  0:47:57
