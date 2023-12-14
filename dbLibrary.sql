CREATE DATABASE  IF NOT EXISTS `libraryappdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libraryappdatabase`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: libraryappdatabase
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AUTHORNAME` varchar(50) NOT NULL,
  `AUTHORSURNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTHORINDEX` (`AUTHORNAME`,`AUTHORSURNAME`),
  CONSTRAINT `authors_chk_1` CHECK (regexp_like(`AUTHORNAME`,_utf8mb4'^[A-Za-z]+$')),
  CONSTRAINT `authors_chk_2` CHECK (regexp_like(`AUTHORNAME`,_utf8mb4'^[A-Za-z]+$'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AUTHORID` int NOT NULL,
  `CATEGORYID` int NOT NULL,
  `LANGUAGE` int NOT NULL,
  `ADDITIONDATE` date NOT NULL,
  `BOOKNAME` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTHORID` (`AUTHORID`),
  KEY `CATEGORYID` (`CATEGORYID`),
  KEY `LANGUAGE` (`LANGUAGE`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AUTHORID`) REFERENCES `authors` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`CATEGORYID`) REFERENCES `categories` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`LANGUAGE`) REFERENCES `languages` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booksreleasedthismonth`
--

DROP TABLE IF EXISTS `booksreleasedthismonth`;
/*!50001 DROP VIEW IF EXISTS `booksreleasedthismonth`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booksreleasedthismonth` AS SELECT 
 1 AS `BOOKNAME`,
 1 AS `AUTHORNAME`,
 1 AS `AUTHORSURNAME`,
 1 AS `CATEGORYNAME`,
 1 AS `LANGUAGE`,
 1 AS `ADDITIONDATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrowedbooks`
--

DROP TABLE IF EXISTS `borrowedbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowedbooks` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BOOKID` int NOT NULL,
  `USERID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BOOKID` (`BOOKID`),
  KEY `USERID` (`USERID`),
  KEY `BORROWEDINDEX` (`BOOKID`),
  CONSTRAINT `borrowedbooks_ibfk_1` FOREIGN KEY (`BOOKID`) REFERENCES `books` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `borrowedbooks_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedbooks`
--

LOCK TABLES `borrowedbooks` WRITE;
/*!40000 ALTER TABLE `borrowedbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowedbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORYNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `categories_chk_1` CHECK (regexp_like(`CATEGORYNAME`,_utf8mb4'^[A-Za-z]+$'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classiccategory`
--

DROP TABLE IF EXISTS `classiccategory`;
/*!50001 DROP VIEW IF EXISTS `classiccategory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classiccategory` AS SELECT 
 1 AS `ID`,
 1 AS `AUTHORID`,
 1 AS `CATEGORYID`,
 1 AS `LANGUAGE`,
 1 AS `ADDITIONDATE`,
 1 AS `BOOKNAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `en_cok_okunan_kitap_view`
--

DROP TABLE IF EXISTS `en_cok_okunan_kitap_view`;
/*!50001 DROP VIEW IF EXISTS `en_cok_okunan_kitap_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `en_cok_okunan_kitap_view` AS SELECT 
 1 AS `BOOKID`,
 1 AS `BOOKNAME`,
 1 AS `read_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `kitaplar_dil_bazli`
--

DROP TABLE IF EXISTS `kitaplar_dil_bazli`;
/*!50001 DROP VIEW IF EXISTS `kitaplar_dil_bazli`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kitaplar_dil_bazli` AS SELECT 
 1 AS `ID`,
 1 AS `book_name`,
 1 AS `AUTHORID`,
 1 AS `CATEGORYID`,
 1 AS `language_name`,
 1 AS `author_name`,
 1 AS `author_surname`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LANGUAGE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LANGUAGE` (`LANGUAGE`),
  KEY `LANGUAGEINDEX` (`ID`),
  CONSTRAINT `languages_chk_1` CHECK (regexp_like(`LANGUAGE`,_utf8mb4'^[A-Za-z]+$'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `okunan_kitaplar_18_30`
--

DROP TABLE IF EXISTS `okunan_kitaplar_18_30`;
/*!50001 DROP VIEW IF EXISTS `okunan_kitaplar_18_30`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `okunan_kitaplar_18_30` AS SELECT 
 1 AS `ID`,
 1 AS `book_name`,
 1 AS `AUTHORID`,
 1 AS `CATEGORYID`,
 1 AS `LANGUAGE`,
 1 AS `author_name`,
 1 AS `surname`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `AGE` int DEFAULT NULL,
  `USERTYPEID` int NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  KEY `deneme` (`USERTYPEID`),
  KEY `USERINDEX` (`FIRSTNAME`,`LASTNAME`),
  CONSTRAINT `deneme` FOREIGN KEY (`USERTYPEID`) REFERENCES `usertypes` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `deneme1` CHECK ((`AGE` >= 18)),
  CONSTRAINT `users_chk_1` CHECK (regexp_like(`FIRSTNAME`,_utf8mb4'^[A-Za-z]+$')),
  CONSTRAINT `users_chk_2` CHECK (regexp_like(`LASTNAME`,_utf8mb4'^[A-Za-z]+$')),
  CONSTRAINT `users_chk_3` CHECK (regexp_like(`AGE`,_utf8mb4'^[0-9]+$'))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertypes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USERTYPENAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypes`
--

LOCK TABLES `usertypes` WRITE;
/*!40000 ALTER TABLE `usertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `booksreleasedthismonth`
--

/*!50001 DROP VIEW IF EXISTS `booksreleasedthismonth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booksreleasedthismonth` AS select `books`.`BOOKNAME` AS `BOOKNAME`,`authors`.`AUTHORNAME` AS `AUTHORNAME`,`authors`.`AUTHORSURNAME` AS `AUTHORSURNAME`,`categories`.`CATEGORYNAME` AS `CATEGORYNAME`,`languages`.`LANGUAGE` AS `LANGUAGE`,`books`.`ADDITIONDATE` AS `ADDITIONDATE` from (((`books` join `authors` on((`authors`.`ID` = `books`.`AUTHORID`))) join `categories` on((`categories`.`ID` = `books`.`CATEGORYID`))) join `languages` on((`languages`.`ID` = `books`.`LANGUAGE`))) where ((month(`books`.`ADDITIONDATE`) = month(now())) and (year(`books`.`ADDITIONDATE`) = year(now()))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classiccategory`
--

/*!50001 DROP VIEW IF EXISTS `classiccategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classiccategory` AS select `books`.`ID` AS `ID`,`books`.`AUTHORID` AS `AUTHORID`,`books`.`CATEGORYID` AS `CATEGORYID`,`books`.`LANGUAGE` AS `LANGUAGE`,`books`.`ADDITIONDATE` AS `ADDITIONDATE`,`books`.`BOOKNAME` AS `BOOKNAME` from `books` where (`books`.`CATEGORYID` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `en_cok_okunan_kitap_view`
--

/*!50001 DROP VIEW IF EXISTS `en_cok_okunan_kitap_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `en_cok_okunan_kitap_view` AS select `borrowedbooks`.`BOOKID` AS `BOOKID`,`books`.`BOOKNAME` AS `BOOKNAME`,count(`borrowedbooks`.`BOOKID`) AS `read_count` from (`borrowedbooks` join `books` on((`borrowedbooks`.`BOOKID` = `books`.`ID`))) group by `borrowedbooks`.`BOOKID`,`books`.`BOOKNAME` order by `read_count` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kitaplar_dil_bazli`
--

/*!50001 DROP VIEW IF EXISTS `kitaplar_dil_bazli`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kitaplar_dil_bazli` AS select `books`.`ID` AS `ID`,`books`.`BOOKNAME` AS `book_name`,`books`.`AUTHORID` AS `AUTHORID`,`books`.`CATEGORYID` AS `CATEGORYID`,`books`.`LANGUAGE` AS `language_name`,`authors`.`AUTHORNAME` AS `author_name`,`authors`.`AUTHORSURNAME` AS `author_surname`,`categories`.`CATEGORYNAME` AS `category_name` from ((`books` join `authors` on((`books`.`AUTHORID` = `authors`.`ID`))) join `categories` on((`books`.`CATEGORYID` = `categories`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `okunan_kitaplar_18_30`
--

/*!50001 DROP VIEW IF EXISTS `okunan_kitaplar_18_30`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `okunan_kitaplar_18_30` AS select `books`.`ID` AS `ID`,`books`.`BOOKNAME` AS `book_name`,`books`.`AUTHORID` AS `AUTHORID`,`books`.`CATEGORYID` AS `CATEGORYID`,`books`.`LANGUAGE` AS `LANGUAGE`,`authors`.`AUTHORNAME` AS `author_name`,`authors`.`AUTHORSURNAME` AS `surname`,`categories`.`CATEGORYNAME` AS `category_name` from ((((`books` join `authors` on((`books`.`AUTHORID` = `authors`.`ID`))) join `categories` on((`books`.`CATEGORYID` = `categories`.`ID`))) join `borrowedbooks` on((`books`.`ID` = `borrowedbooks`.`BOOKID`))) join `users` on((`borrowedbooks`.`USERID` = `users`.`ID`))) where (`users`.`AGE` between 18 and 30) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 14:39:51
