-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nutrs
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `cgm`
--

DROP TABLE IF EXISTS `cgm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cgm` (
  `cgm_id` int NOT NULL AUTO_INCREMENT,
  `cgm_first_name` varchar(500) NOT NULL,
  `cgm_last_name` varchar(500) NOT NULL,
  `cgm_email` varchar(500) NOT NULL,
  `cgm_discord_username` varchar(500) DEFAULT NULL,
  `max_players` int NOT NULL,
  PRIMARY KEY (`cgm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgm`
--

LOCK TABLES `cgm` WRITE;
/*!40000 ALTER TABLE `cgm` DISABLE KEYS */;
INSERT INTO `cgm` VALUES (1,'Rob','Maina','maina.r@northeastern.edu','Rmaina4',6),(2,'Audrija','Sarkar','sarkar.a@northeastern.edu','cosmo.frog',5),(3,'Oliver','Baer-Benson','Baer-benson.o@northeastern.edu','oliver',8),(4,'Payton','Taylor','taylor.pa@northeastern.edu','kale5248',7),(5,'Ali','Eustice','eustice.a@northeastern.edu','ali.ria',5),(6,'Jack','Price','price.jack@northeastern.edu','thirdprice',4);
/*!40000 ALTER TABLE `cgm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cgm_pref_genre`
--

DROP TABLE IF EXISTS `cgm_pref_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cgm_pref_genre` (
  `cgm_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`cgm_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `cgm_id` FOREIGN KEY (`cgm_id`) REFERENCES `cgm` (`cgm_id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgm_pref_genre`
--

LOCK TABLES `cgm_pref_genre` WRITE;
/*!40000 ALTER TABLE `cgm_pref_genre` DISABLE KEYS */;
INSERT INTO `cgm_pref_genre` VALUES (5,1),(1,2),(2,2),(3,2),(6,3),(4,9),(5,14),(1,15),(5,18),(3,22),(6,22),(3,31),(4,39),(2,40),(6,40);
/*!40000 ALTER TABLE `cgm_pref_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cgm_preferred_game`
--

DROP TABLE IF EXISTS `cgm_preferred_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cgm_preferred_game` (
  `cgm_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`cgm_id`,`genre_id`),
  KEY `genre_id_foreign` (`genre_id`),
  CONSTRAINT `cgm_id_fk` FOREIGN KEY (`cgm_id`) REFERENCES `cgm` (`cgm_id`),
  CONSTRAINT `genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgm_preferred_game`
--

LOCK TABLES `cgm_preferred_game` WRITE;
/*!40000 ALTER TABLE `cgm_preferred_game` DISABLE KEYS */;
INSERT INTO `cgm_preferred_game` VALUES (1,8),(2,8),(3,8),(4,8),(6,8),(2,17),(6,17),(5,22),(2,28),(3,28),(5,28);
/*!40000 ALTER TABLE `cgm_preferred_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `game_name` varchar(500) NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `system_id` int DEFAULT NULL,
  `physical_copy` tinyint(1) NOT NULL,
  `digital_copy` tinyint(1) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `system_id` FOREIGN KEY (`system_id`) REFERENCES `nutrs_system` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Alien RPG',1,1,1,0),(2,'A Penny For My Thoughts',2,2,0,1),(3,'Basic Fantasy Role-Playing 3rd Edition',3,3,1,0),(4,'Blades In The Dark',2,4,1,0),(5,'Cortex Prime RPG',4,5,1,0),(6,'Cypher System',5,6,1,0),(7,'Cyberpunk Red',6,7,1,0),(8,'DND 5th Edition',7,3,1,0),(9,'DND Player\'s Handbook',7,3,1,0),(10,'Dread RPG',8,8,1,1),(11,'Dust Devils',9,9,0,1),(12,'Fate Core System',2,10,1,0),(13,'Fiasco',10,2,1,0),(14,'Index Card RPG',11,11,1,0),(15,'Lancer',12,12,0,1),(16,'Masks: A New Generation',13,13,1,0),(17,'Monster of the Week',2,13,1,0),(18,'Nine Worlds',14,2,0,1),(19,'Paranoia Perfect Edition',2,2,1,1),(20,'Pathfinder Core Rulebook',3,3,1,0),(21,'Quest',15,15,0,1),(22,'Scum and Villainy',2,4,1,1),(23,'Swords and Wizardry',18,14,1,0),(24,'Tales from the Loop RPG',1,1,1,0),(25,'The Extraordinary Adventures of Baron Munchausen',19,16,1,0),(26,'Warhammer Fantasy 4th Edition',20,17,1,0),(27,'Vampire Masquerade 5e',21,18,1,0),(28,'Stars Without Number',22,19,0,1);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_genre`
--

DROP TABLE IF EXISTS `game_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_genre` (
  `game_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`genre_id`),
  KEY `genre_id_fk` (`genre_id`),
  CONSTRAINT `game_id` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  CONSTRAINT `genre_id_fk` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_genre`
--

LOCK TABLES `game_genre` WRITE;
/*!40000 ALTER TABLE `game_genre` DISABLE KEYS */;
INSERT INTO `game_genre` VALUES (1,1),(10,1),(17,1),(1,2),(28,2),(2,3),(17,3),(24,3),(2,4),(3,5),(20,5),(21,5),(3,6),(23,6),(4,7),(4,8),(27,8),(5,9),(14,9),(5,10),(16,10),(6,11),(6,12),(7,13),(7,14),(19,14),(8,15),(9,15),(12,15),(8,17),(9,17),(20,17),(10,18),(11,19),(11,20),(22,20),(12,21),(21,21),(13,22),(25,22),(13,23),(14,24),(15,25),(15,26),(16,27),(18,28),(18,29),(19,30),(22,31),(28,31),(23,32),(24,33),(25,34),(26,35),(26,36),(27,37);
/*!40000 ALTER TABLE `game_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(500) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Horror'),(2,'Sci-Fi'),(3,'Mystery'),(4,'Psychological Thriller'),(5,'High Fantasy'),(6,'Sword and Sorcery'),(7,'Steampunk'),(8,'Urban Fantasy'),(9,'Action'),(10,'Superheroes'),(11,'Science Fantasy'),(12,'Post-Apocalyptic'),(13,'Cyberpunk'),(14,'Dystopian'),(15,'Fantasy'),(16,'Bestiary'),(17,'Adventure'),(18,'Survival'),(19,'Western'),(20,'Supernatural'),(21,'Pulp'),(22,'Comedy'),(23,'Drama'),(24,'Minimalist'),(25,'Mecha'),(26,'Military Sci-Fi'),(27,'Teen Drama'),(28,'Mythic Fantasy'),(29,'Norse Mythology'),(30,'Satirical'),(31,'Old School Revival'),(32,'Classic Fantasy'),(33,'Space Opera'),(34,'Crime'),(35,'1980s Nostalgia'),(36,'Historical Fiction'),(37,'Dark Fantasy'),(38,'Grimdark'),(39,'Gothic Horror'),(40,'Worldbuilding');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `meeting_date` date NOT NULL,
  `meeting_theme` varchar(500) NOT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` VALUES (1,'2024-04-06','GM\'s Choice'),(2,'2024-03-09','Horror Games');
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrs_system`
--

DROP TABLE IF EXISTS `nutrs_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrs_system` (
  `system_id` int NOT NULL AUTO_INCREMENT,
  `system_name` varchar(500) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrs_system`
--

LOCK TABLES `nutrs_system` WRITE;
/*!40000 ALTER TABLE `nutrs_system` DISABLE KEYS */;
INSERT INTO `nutrs_system` VALUES (1,'Year Zero Engine'),(2,'Custom System'),(3,'D20 System'),(4,'Forged in the Dark'),(5,'Cortex Prime System'),(6,'Cypher System'),(7,'Interlock System'),(8,'Jenga-based System'),(9,'Playing Cards System'),(10,'Fate System'),(11,'Index Card RPG System'),(12,'Narrative and Tactical System'),(13,'Powered by the Apocalypse'),(14,'Original D&D System'),(15,'Quest System'),(16,'Narrative Storytelling'),(17,'Warhammer Fantasy System'),(18,'Storyteller System'),(19,'Without Number System');
/*!40000 ALTER TABLE `nutrs_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrs_table`
--

DROP TABLE IF EXISTS `nutrs_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrs_table` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int DEFAULT NULL,
  `cgm_id` int DEFAULT NULL,
  `game_id` int DEFAULT NULL,
  `num_players` int NOT NULL,
  PRIMARY KEY (`table_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `cgm_id_foreign` (`cgm_id`),
  KEY `game_id_fk` (`game_id`),
  CONSTRAINT `cgm_id_foreign` FOREIGN KEY (`cgm_id`) REFERENCES `cgm` (`cgm_id`),
  CONSTRAINT `game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  CONSTRAINT `meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrs_table`
--

LOCK TABLES `nutrs_table` WRITE;
/*!40000 ALTER TABLE `nutrs_table` DISABLE KEYS */;
INSERT INTO `nutrs_table` VALUES (1,1,3,15,4),(2,1,2,17,5),(3,1,1,4,3),(4,2,6,19,4),(6,2,4,8,3);
/*!40000 ALTER TABLE `nutrs_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(500) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Free League Publishing'),(2,'Evil Hat Productions'),(3,'Chris Gonnerman'),(4,'Fandom Tabletop'),(5,'Monte Cook Games'),(6,'R. Talsorian Games'),(7,'Wizards of the Coast'),(8,'The Impossible Dream'),(9,'Stories You Play'),(10,'Bully Pulpit Games'),(11,'Runehammer Games'),(12,'Massif Press'),(13,'Magpie Games'),(14,'Green Ronin Publishing'),(15,'Mongoose Publishing'),(16,'Paizo Inc.'),(17,'The Adventure Guild'),(18,'Frog God Games'),(19,'Fantasy Flight Games'),(20,'Cubicle 7 Entertainment'),(21,'Modiphius Entertainment'),(22,'Sine Nomine Publishing');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 21:16:22
