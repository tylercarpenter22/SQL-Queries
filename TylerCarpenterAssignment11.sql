-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: petboarding
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `petId` int NOT NULL,
  `ratetypeId` int NOT NULL,
  `days` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `petId` (`petId`),
  KEY `ratetypeId` (`ratetypeId`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`petId`) REFERENCES `pet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`ratetypeId`) REFERENCES `ratetype` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,700,1,3),(2,705,2,4),(3,710,3,2),(4,715,4,5),(5,720,1,3),(6,725,2,4),(7,730,3,6),(8,735,4,9),(9,740,1,2),(10,745,2,1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (230,'Abyssinian'),(211,'Australian Shepherd'),(207,'Beagle'),(231,'Bengal'),(232,'Bombay'),(227,'Border Collie'),(222,'Boston Terrier'),(215,'Boxer'),(205,'Bulldog'),(233,'Burmese'),(217,'Cane Corso'),(213,'Cavalier King Charles Spaniel'),(226,'Cocker Spaniel'),(234,'Cornish Rex'),(208,'Dachshund'),(235,'Devon Rex'),(214,'Doberman Pinscher'),(229,'Domestic Longhair'),(228,'Domestic Shorthair'),(224,'English Springer Spaniel'),(200,'French Bulldog'),(203,'German Shepherd'),(209,'German Shorthaired Pointer'),(202,'Golden Retriever'),(218,'Great Dane'),(223,'Havanese'),(236,'Himalayan'),(201,'Labrador Retriever'),(237,'Maine Coon'),(238,'Manx'),(216,'Miniature Schnauzer'),(210,'Pembroke Welsh Corgi'),(239,'Persian'),(221,'Pomeranian'),(204,'Poodle'),(240,'Ragdoll'),(206,'Rottweiler'),(241,'Russian Blue'),(242,'Scottish Fold'),(225,'Shetland Sheepdog'),(219,'Shih Tzu'),(243,'Siamese'),(220,'Siberian Husky'),(244,'Sphynx'),(245,'Turkish Angora'),(246,'Turkish Van'),(247,'Unknown'),(212,'Yorkshire Terrier');
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystatezip`
--

DROP TABLE IF EXISTS `citystatezip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citystatezip` (
  `city` varchar(90) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL,
  PRIMARY KEY (`zipCode`),
  UNIQUE KEY `zipCode` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystatezip`
--

LOCK TABLES `citystatezip` WRITE;
/*!40000 ALTER TABLE `citystatezip` DISABLE KEYS */;
INSERT INTO `citystatezip` VALUES ('Apopka','FL','32703'),('Christmas','FL','32709'),('Eatonville','FL','32751'),('Tangerine','FL','32777'),('Winter Park','FL','32790'),('Lockhart','FL','32810'),('Belle Isle','FL','32812'),('Sand Lake','FL','32819'),('Pine Castle','FL','32839'),('Jupiter','FL','33458'),('Windermere','FL','34786'),('Winter Garden','FL','34787');
/*!40000 ALTER TABLE `citystatezip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_client_zipCode` (`zipCode`),
  CONSTRAINT `fk_client_zipCode` FOREIGN KEY (`zipCode`) REFERENCES `citystatezip` (`zipCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Meera','White','484 Bridge St','34787','2025550166','mwhite@isp.com'),(2,'Bradlee','Esparza','7031 Gainsway St','34787','2025550173','besparza@isp.com'),(3,'Leilani','Leonard','37 Monroe Street','34787','2025550175','lleonard@isp.com'),(4,'Stefanie','Brook','7990 West Surrey St','34787','2025550179','sbrook@isp.com'),(5,'Grover','Squires','7618 Madison Court','34787','2025550180','gsquires@isp.com'),(6,'Efe','House','97 High Point Street','32839','2025550196','ehouse@isp.com'),(7,'Atticus','Atkinson','66 Harrison Dr','32839','2025550197','aatkinson@isp.com'),(8,'Michelle','Ramirez','370 Hill Field Ave','32839','2025550198','mramirez@isp.com'),(9,'Remy','Hassan','249 Devon Lane','32839','2225550199','rhassan@isp.com'),(10,'Jordana','Beck','7911 Carson Lane','32839','2025550200','jbeck@isp.com'),(11,'Igor','Prince','12 Creekside St','32777','2025550199','iprince@isp.com'),(12,'Avaya','Clarke','7771 Border Court','32777','2225550119','aclarke@isp.com'),(13,'Douglas','Guthrie','9 Wrangler Ave','32777','2225550124','dguthrie@isp.com'),(14,'Yvonne','Goodman','12 Creekside St','32790','2025550109','ygoodman@isp.com'),(15,'Dante','Mackenzie','137 Wall St','32790','2025550112','dmackenzie@isp.com'),(16,'Alysha','Rollins','411 Shirley St','32790','2025550115','arollins@isp.com'),(17,'Avaya','Gonzalez','7771 Border Court','32790','2025550119','agonzalez@isp.com'),(18,'Haniya','Kelly','6 South Sulphur Springs Street','32790','2025550121','hkelly@isp.com'),(19,'Jonathan','Kumar','25 Annadale Court','33458','2025550182','jkumar@isp.com'),(20,'Angus','Neville','9841 Smith Drive','33458','2025550187','aneville@isp.com'),(21,'Uzair','Sparrow','7999 Hall Street','33458','2025550188','usparrow@isp.com'),(22,'Amari','Currie','8411 Pleasant St','33458','2025550194','acurrie@isp.com'),(23,'Imaani','Wallace','33 Pierce Rd','33458','2025550195','iwallace@isp.com'),(24,'Nathalie','Chambers','942 New Saddle Drive','34786','2025550122','nchambers@isp.com'),(25,'Dante','Rollins','9 Wrangler Ave','34786','2025550124','drollins@isp.com'),(26,'Beverley','Mckee','7319 S. Greenview Drive','34786','2025550125','bmckee@isp.com'),(27,'Thomas','Waters','411 Shirley St','32810','2225550115','twaters@isp.com'),(28,'Haniya','Kaiser','6 South Sulphur Springs Street','32812','2225550121','hkaiser@isp.com'),(29,'Victor','Newman','942 New Saddle Drive','32812','2225550122','vnewman@isp.com'),(30,'Brian','Roberts','7319 S. Greenview Drive','32819','2225550125','broberts@isp.com'),(31,'Paris','Solis','763 West Mulberry St','32819','2025550132','psolis@isp.com'),(32,'Umaiza','Heath','545 Ohio Ave','32819','2025550135','uheath@isp.com'),(33,'Dante','Rennie','137 Wall St','32819','2225550112','drennie@isp.com'),(34,'Robin','Solis','8474 Wentworth Street','32819','2025550164','rsolis@isp.com'),(35,'Kavita','Heath','796 Hartford St','32819','2025550165','kheath@isp.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientpet`
--

DROP TABLE IF EXISTS `clientpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientpet` (
  `clientId` int NOT NULL,
  `petId` int NOT NULL,
  PRIMARY KEY (`clientId`,`petId`),
  KEY `petId` (`petId`),
  CONSTRAINT `clientpet_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clientpet_ibfk_2` FOREIGN KEY (`clientId`) REFERENCES `client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientpet`
--

LOCK TABLES `clientpet` WRITE;
/*!40000 ALTER TABLE `clientpet` DISABLE KEYS */;
INSERT INTO `clientpet` VALUES (24,700),(15,701),(31,701),(8,702),(1,703),(17,703),(34,704),(30,705),(19,706),(12,707),(5,708),(10,709),(27,710),(33,711),(13,712),(23,713),(26,714),(35,715),(16,716),(11,717),(6,718),(7,719),(2,720),(4,721),(22,723),(26,724),(29,725),(21,727),(17,728),(18,728),(14,729),(9,730),(3,731),(20,732),(25,733),(28,734),(32,735),(2,736),(10,737),(32,738),(7,739),(24,740),(15,741),(25,743),(26,744),(30,745),(19,746),(12,747),(32,748),(29,749);
/*!40000 ALTER TABLE `clientpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `color` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (101,'Black'),(111,'Blue'),(108,'Brindle'),(100,'Brown'),(114,'Calico'),(103,'Golden'),(109,'Grey'),(116,'Pointed'),(110,'Red'),(112,'Sable'),(113,'Tabby'),(107,'Tan'),(115,'Tortoiseshell'),(102,'White');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_employee_zipCode` (`zipCode`),
  CONSTRAINT `fk_employee_zipCode` FOREIGN KEY (`zipCode`) REFERENCES `citystatezip` (`zipCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Paris','Lindsey','763 West Mulberry St','32703','2025550132','plindsey@isp.com'),(2,'Umaiza','Melia','545 Ohio Ave','32703','2025550135','umelia@isp.com'),(3,'Nico','Prince','20 Middle River Street','32709','2025550137','nprince@isp.com'),(4,'Javan','Rennie','8112 North Country St','32709','2025550139','jrennie@isp.com'),(5,'Ali','Waters','83 Rockland Lane','32709','2025550144','awaters@isp.com'),(6,'JohnPaul','Clarke','1 Riverside Lane','32709','2025550153','jpcClarke@isp.com'),(7,'Dane','Kaiser','694 Wall Road','32709','2025550155','kdaiser@isp.com'),(8,'Hammad','Newman','9970 State Court','32751','2025550157','hnewman@isp.com'),(9,'Maha','Guthrie','54 Woodsman Drive','32751','2025550161','mguthrie@isp.com'),(10,'Tulisa','Roberts','7174 Studebaker Street','32751','2025550163','troberts@isp.com'),(11,'Raheem','Montgomery','71 Paris Hill Rd.','32703','4134849795','rmontgomery@isp.com'),(12,'Leo','Bird','201 Eagle Dr.','32709','7747829407','lbird@isp.com'),(13,'Oliwier','Barnett','81 Cedar Swamp St.','32703','2764343958','obarnett@isp.com'),(14,'Fern','Garner','37 Gartner Court','32709','2256254378','fgarner@isp.com'),(15,'Dawson','Marquez','90 Mammoth Street','32751','7634882879','dmarquez@isp.com'),(16,'Raja','Glass','7918 Talbot Ave.','32751','2319969540','rglass@isp.com'),(17,'Alissa','Ortiz','7756 Fulton Court','32839','2397268929','aortiz@isp.com'),(18,'Nicholas','Pena','8123 Race Ave.','33458','7815242242','npena@isp.com'),(19,'Harvey','West','9 Cherry Ave','32839','7326232762','hwest@isp.com'),(20,'Aamina','Dillon','9 West Boston Lane','33458','2035745299','adillon@isp.com'),(21,'Louis','Giles','598 North Road','34786','2708583758','lgiles@isp.com'),(22,'Krystal','Walters','583 North Nichols Street','33458','3232591832','kwalters@isp.com'),(23,'Alexa','Preston','9227 North Bow Ridge Street','34786','4098496634','apreston@isp.com'),(24,'Rebekah','Morgan','9437 East 6th Street','32810','6073928343','rmorgan@isp.com'),(25,'Ethan','Ali','167 NE. Depot Dr.','34786','2245499884','eali@isp.com'),(26,'Malik','Vincent','312 Colonial Ave.','34787','9149573014','mvincent@isp.com'),(27,'Sara','Barron','9064 E. Swanson St.','32810','8707743244','sbarron@isp.com'),(28,'Lyra','Murphy','400 Nut Swamp Drive','34787','3527673126','lmurphy@isp.com'),(29,'Awais','Carrillo','225 South Manhattan Street','32790','6369577670','acarrillo@isp.com'),(30,'Kaya','Hodge','9572 William Lane','32709','2125271561','khodge@isp.com'),(31,'Jemima','Miller','9290 Indian Spring Rd.','32790','6206673264','jmiller@isp.com'),(32,'Laila','Christensen','15 Rose Avenue','32812','9017396978','lchristensen@isp.com'),(33,'Honey','Warren','7946 Leeton Ridge Street','32777','5858531050','hwarren@isp.com'),(34,'Brodie','Gordon','71 Jackson Ave.','32709','9016899813','bgordon@isp.com'),(35,'Lauren','Morton','7931 Rockaway Street','32790','4476721422','lmorton@isp.com'),(36,'Ty','Bell','921 Brook St.','32812','2393336881','tbell@isp.com'),(37,'Floyd','Johns','2 Shore Street','32777','4065842872','fjohns@isp.com'),(38,'Mathew','Horton','1 Rockland Ave.','32709','7195789907','mhorton@isp.com'),(39,'Ernest','Higgins','451 Marshall Lane','32777','7637651247','ehiggins@isp.com'),(40,'Kamil','Lozano','75 N. Golden Star Street','32812','7638554744','klozano@isp.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedeposit`
--

DROP TABLE IF EXISTS `employeedeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedeposit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `payDeposit` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `employeedeposit_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedeposit`
--

LOCK TABLES `employeedeposit` WRITE;
/*!40000 ALTER TABLE `employeedeposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeedeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeposition`
--

DROP TABLE IF EXISTS `employeeposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeposition` (
  `employeeId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`positionId`),
  KEY `fk_employeeposition_ibfk_2` (`positionId`),
  CONSTRAINT `employeeposition_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employeeposition_ibfk_2` FOREIGN KEY (`positionId`) REFERENCES `position` (`ID`),
  CONSTRAINT `fk_employeeposition_ibfk_2` FOREIGN KEY (`positionId`) REFERENCES `position` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeposition`
--

LOCK TABLES `employeeposition` WRITE;
/*!40000 ALTER TABLE `employeeposition` DISABLE KEYS */;
INSERT INTO `employeeposition` VALUES (2,1),(12,1),(27,1),(4,2),(14,2),(28,2),(39,2),(8,3),(23,3),(30,3),(37,3),(1,4),(13,4),(29,4),(7,5),(15,5),(32,5),(34,5),(38,5),(10,6),(17,6),(21,6),(26,6),(35,6),(6,7),(36,7),(40,7),(5,8),(18,8),(19,8),(20,8),(33,8),(3,9),(11,9),(24,9),(9,10),(16,10),(22,10),(25,10),(31,10);
/*!40000 ALTER TABLE `employeeposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `breedId` int DEFAULT NULL,
  `petTypeId` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `age` int NOT NULL,
  `weight` decimal(5,1) DEFAULT NULL,
  `colorId` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `pet_ibfk_1` (`breedId`),
  KEY `pet_ibfk_2` (`petTypeId`),
  KEY `fk_pet_color` (`colorId`),
  CONSTRAINT `fk_pet_color` FOREIGN KEY (`colorId`) REFERENCES `color` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`breedId`) REFERENCES `breed` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`petTypeId`) REFERENCES `pettype` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=750 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (700,201,2,'Buddy',3,60.5,100),(702,228,1,'Lucy',3,8.7,102),(704,205,2,'Charlie',6,38.6,100),(705,230,1,'Molly',3,6.4,101),(706,231,1,'Daisy',3,9.9,102),(707,208,2,'Rocky',7,20.1,103),(708,233,1,'Sadie',3,7.2,100),(709,210,2,'Luna',5,26.8,101),(710,211,2,'Cooper',4,44.5,102),(711,235,1,'Bella',3,8.3,103),(712,213,2,'Toby',6,16.2,100),(713,236,1,'Lola',3,9.1,101),(714,215,2,'Jack',4,62.7,102),(715,216,2,'Maggie',7,19.4,103),(716,238,1,'Duke',3,5.8,100),(717,218,2,'Chloe',5,133.9,101),(718,239,1,'Bear',3,9.5,102),(719,220,2,'Buster',4,45.3,103),(720,221,2,'Zoe',6,17.8,100),(721,240,1,'Riley',3,7.1,101),(723,224,2,'Sophie',3,40.2,103),(724,225,2,'Lily',4,24.7,100),(725,226,2,'Shadow',7,18.9,101),(727,228,2,'Coco',6,16.3,103),(729,200,2,'Rosie',4,13.5,101),(730,203,2,'Oreo',5,81.1,102),(731,232,1,'Sam',3,7.8,103),(732,206,2,'Ginger',7,119.6,100),(733,234,1,'Penny',3,9.3,101),(734,207,2,'Rusty',4,24.2,102),(735,209,2,'Jake',6,17.7,103),(736,237,1,'Holly',3,6.9,100),(737,212,2,'Zeus',5,6.5,101),(738,214,2,'Sasha',3,90.8,102),(739,217,2,'Sammy',4,99.4,103),(740,219,2,'Annie',7,9.1,100),(741,242,1,'Ruby',3,9.7,101),(743,244,1,'Leo',3,5.5,103),(744,227,2,'Princess',5,11.9,100),(745,246,1,'Cody',3,9.2,101),(746,220,2,'Tucker',4,54.8,102),(747,210,2,'Emma',7,18.3,103),(748,246,1,'Lady',3,7.6,100),(749,200,2,'Sandy',5,13.4,101);
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pettype`
--

DROP TABLE IF EXISTS `pettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pettype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pettype`
--

LOCK TABLES `pettype` WRITE;
/*!40000 ALTER TABLE `pettype` DISABLE KEYS */;
INSERT INTO `pettype` VALUES (12,'Amphibian'),(4,'Bird'),(1,'Cat'),(2,'Dog'),(9,'Ferret'),(8,'Fish'),(7,'Guinea pig'),(13,'Hamster'),(3,'Horse'),(11,'Mouse'),(6,'Rabbit'),(10,'Rat'),(5,'Reptile'),(14,'Snake'),(15,'Turtle');
/*!40000 ALTER TABLE `pettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `hourly` decimal(5,2) NOT NULL DEFAULT '15.00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Manager',60.00),(2,'Animal Trainer',50.00),(3,'Groom',25.00),(4,'Receptionist',20.00),(5,'Bather',13.00),(6,'Kennel Technician',17.50),(7,'Veterinarian',85.00),(8,'Pet Exerciser',15.00),(9,'Maintenance',32.00),(10,'Groomer',18.00);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratetype`
--

DROP TABLE IF EXISTS `ratetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratetype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratetype`
--

LOCK TABLES `ratetype` WRITE;
/*!40000 ALTER TABLE `ratetype` DISABLE KEYS */;
INSERT INTO `ratetype` VALUES (1,'Standard',25.00),(2,'Deluxe',35.00),(3,'Condo',45.00),(4,'Private',55.00);
/*!40000 ALTER TABLE `ratetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timecard`
--

DROP TABLE IF EXISTS `timecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timecard` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `sun` int NOT NULL DEFAULT '0',
  `mon` int NOT NULL DEFAULT '0',
  `tues` int NOT NULL DEFAULT '0',
  `wed` int NOT NULL DEFAULT '0',
  `thurs` int NOT NULL DEFAULT '0',
  `fri` int NOT NULL DEFAULT '0',
  `sat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `timecard_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timecard`
--

LOCK TABLES `timecard` WRITE;
/*!40000 ALTER TABLE `timecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `timecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workschedule`
--

DROP TABLE IF EXISTS `workschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workschedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `startDateTime` timestamp NOT NULL,
  `endDateTime` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `workschedule_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workschedule`
--

LOCK TABLES `workschedule` WRITE;
/*!40000 ALTER TABLE `workschedule` DISABLE KEYS */;
INSERT INTO `workschedule` VALUES (1,1,'2024-04-01 12:00:00','2024-04-01 20:00:00'),(2,3,'2024-04-01 13:00:00','2024-04-01 21:00:00'),(3,4,'2024-04-01 16:00:00','2024-04-02 01:00:00'),(4,2,'2024-04-01 20:00:00','2024-04-02 03:00:00'),(5,19,'2024-04-02 11:00:00','2024-04-02 18:00:00'),(6,21,'2024-04-02 11:00:00','2024-04-02 20:00:00'),(7,12,'2024-04-02 11:00:00','2024-04-02 19:00:00'),(8,20,'2024-04-02 13:00:00','2024-04-02 21:00:00'),(9,11,'2024-04-03 10:00:00','2024-04-03 18:00:00'),(10,18,'2024-04-03 11:00:00','2024-04-03 19:00:00'),(11,23,'2024-04-03 12:00:00','2024-04-03 20:00:00'),(12,22,'2024-04-03 13:00:00','2024-04-03 21:00:00'),(13,10,'2024-04-04 10:00:00','2024-04-04 18:00:00'),(14,25,'2024-04-04 11:00:00','2024-04-04 20:00:00'),(15,24,'2024-04-04 12:00:00','2024-04-04 21:00:00'),(16,17,'2024-04-04 13:00:00','2024-04-04 22:00:00'),(17,27,'2024-04-05 11:00:00','2024-04-05 20:00:00'),(18,9,'2024-04-05 12:00:00','2024-04-05 21:00:00'),(19,26,'2024-04-05 13:00:00','2024-04-05 21:00:00'),(20,28,'2024-04-05 14:00:00','2024-04-06 22:00:00'),(21,29,'2024-04-06 11:00:00','2024-04-06 20:00:00'),(22,15,'2024-04-06 12:00:00','2024-04-06 21:00:00'),(23,16,'2024-04-06 13:00:00','2024-04-06 22:00:00'),(24,33,'2024-04-07 11:00:00','2024-04-07 18:00:00'),(25,31,'2024-04-07 11:00:00','2024-04-07 19:00:00'),(26,32,'2024-04-07 12:00:00','2024-04-07 21:00:00'),(27,30,'2024-04-07 13:00:00','2024-04-07 21:00:00'),(28,13,'2024-04-09 11:00:00','2024-04-09 19:00:00'),(29,35,'2024-04-09 12:00:00','2024-04-09 20:00:00'),(30,34,'2024-04-09 13:00:00','2024-04-09 21:00:00'),(31,14,'2024-04-09 14:00:00','2024-04-09 23:00:00'),(32,8,'2024-04-09 16:00:00','2024-04-10 00:00:00'),(33,37,'2024-04-10 11:00:00','2024-04-10 19:00:00'),(34,38,'2024-04-10 12:00:00','2024-04-10 20:00:00'),(35,39,'2024-04-10 13:00:00','2024-04-10 21:00:00'),(36,40,'2024-04-10 14:00:00','2024-04-10 22:00:00'),(37,36,'2024-04-10 17:00:00','2024-04-11 02:00:00'),(38,5,'2024-04-11 11:00:00','2024-04-11 20:00:00'),(39,6,'2024-04-11 12:00:00','2024-04-11 21:00:00'),(40,7,'2024-04-11 13:00:00','2024-04-11 22:00:00');
/*!40000 ALTER TABLE `workschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `workscheduleview`
--

DROP TABLE IF EXISTS `workscheduleview`;
/*!50001 DROP VIEW IF EXISTS `workscheduleview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `workscheduleview` AS SELECT 
 1 AS `Employee`,
 1 AS `Position`,
 1 AS `Start`,
 1 AS `End`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `workscheduleview`
--

/*!50001 DROP VIEW IF EXISTS `workscheduleview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `workscheduleview` AS select concat(`employee`.`firstName`,' ',`employee`.`lastName`) AS `Employee`,`position`.`description` AS `Position`,`workschedule`.`startDateTime` AS `Start`,`workschedule`.`endDateTime` AS `End` from (((`workschedule` join `employee` on((`workschedule`.`employeeId` = `employee`.`ID`))) join `employeeposition` on((`employee`.`ID` = `employeeposition`.`employeeId`))) join `position` on((`employeeposition`.`positionId` = `position`.`ID`))) order by `workschedule`.`startDateTime` */;
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

-- Dump completed on 2024-04-19 18:23:41
