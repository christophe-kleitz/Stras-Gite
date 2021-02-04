-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: projet2DB
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `room_id` int NOT NULL,
  `arrival` date NOT NULL,
  `departure` date NOT NULL,
  `nb_adult` int NOT NULL,
  `nb_child` int NOT NULL,
  `nb_nights` int NOT NULL,
  `paid_price` int NOT NULL,
  `room_service` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_ibfk_1` (`client_id`),
  KEY `booking_ibfk_2` (`room_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (12,58,6,'2020-12-04','2020-12-12',3,0,8,2400,0),(13,59,4,'2020-12-03','2020-12-17',3,0,14,1400,0),(14,58,6,'2020-11-28','2020-12-05',2,1,7,2150,1),(20,58,6,'2020-11-29','2020-12-05',2,1,6,1800,0),(21,58,5,'2020-11-29','2020-12-06',2,1,7,1450,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` int NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (45,'Yavuz','Yavuz','yavuz.kutuk@wildcodeschool.com',321654987,'$2y$10$eXn4iaolozaQKVqQYhko6.eobogEMYgRwimY5ulcANYEbgr8Qjg2u',1),(58,'Machin.truc@chose.org','Machin.truc@chose.org','machin.truc@chose.org',321654987,'$2y$10$ad0e/JLzDQ4lmXcaDx0w5OXPwMjEhv6XNMuCtaZD.VaA8ryIbHdAm',0),(59,'Georges','Washington','georges.washington@gmail.com',321654987,'$2y$10$MFlNHsLq4iBBwhFQO1vtIemlhEeGKoQL2g9ADdjqcB4jxrYK6Valm',0);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(200) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (2,'Georges','Washington','georges.washington@gmail.com','Trop bien ce site !!!!!!!'),(3,'Barbie','Mattel','barbie.mattel@online.com','What a wonderful website !\r\nBe sure I\'ll come to your place next time I come to Strasbourg !');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `room` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` text NOT NULL,
  `price_per_night` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (4,'Standard','                <p class=\"text-center\">Réservez votre chambre 24h/24 en ligne !<br>Passez un moment unique au cœur de Strasbourg</p>\r\n            </div>\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-10 col-lg-7 col-xl-7 offset-md-1 offset-lg-0 offset-xl-1\"><a class=\"text-left\" href=\"#\"><img class=\"img-fluid chambre\" src=\"/assets/images/general/luxe.jpg\"></a>\r\n                            <h6 class=\"text name\"><br><B>Chambre à coucher moderne</B></h6>\r\n                            <p class=\"text description\">Cette suite de luxe est la chambre idéale pour se reposer et passer un agréable moment à Strasbourg.\r\n                            Elle comprend : <br>\r\n                                <ul>\r\n                                    <li>Un lit 180x200cm pour un confort inestimable</li>\r\n                                    <li>Une superficie de 45m²</li>\r\n                                    <li>Climatiseur indépendant</li>\r\n                                    <li>Un balcon, une vue sur la magnifique cathédrale</li>\r\n                                <br>\r\n                                <br>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n        </div>\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-12 col-lg-7 offset-md-1 offset-lg-0 offset-xl-4\"><a href=\"#\"><img class=\"img-fluid sdb\"  src=\"/assets/images/general/salle-de-bain-luxe.jpg\"></a>\r\n                            <h6 class=\"text name\"><br><B>Salle de bain</B></h6>\r\n                                    <p class=\"text description\">Une salle de bain ultra moderne équipée de matériels très haut de gamme.<br> Elle comprend : </p>\r\n                                    <ul class=\"sdbb\">\r\n                                        <li>Mitigeur d\'exception Elizabeth</li>\r\n                                        <li>Baignoire Villeroy & Boch</li>\r\n                                        <li>Miroir lumineux</li>\r\n                                        <li>Meuble Hudson Reed</li>\r\n                                        <li>Pièce marbré</li>\r\n                                        <li>Jacuzzi ultra luxe</li>\r\n                                    </ul>\r\n                        </div>\r\n                    </div>\r\n                <br>\r\n                    <h5 class=\"text-center\"><br><br><br><br><br>Services</h5>\r\n                        <p><i class=\"fa fa-wifi\"></i>&nbsp;Wi-Fi gratuit</p>\r\n                        <p><i class=\"fa fa-glass\"></i>&nbsp;Bar</p>\r\n                        <img src=\"https://img.icons8.com/pastel-glyph/50/000000/no-animals--v2.png\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" <p> Animaux interdit</p>\r\n                        <img src=\"https://img.icons8.com/ios/50/000000/restaurant.png\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" <p> Restaurant</p>\r\n                        <svg class=\"bk-icon -streamline-city\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path></svg> Vue sur la ville</p>\r\n','        <div class=\"container text-right\">\r\n            <div class=\"intro\">\r\n                <h1 class=\"text-center\">Chambre Standard</h1>',100),(5,'Suite','            <p class=\"text-center\">Réservez votre chambre <span style=\"background-color: rgb(255, 255, 0);\"><font color=\"#000000\">24h/24 </font></span>en ligne !<br>Passez un moment unique au cœur de Strasbourg</p>\r\n        \r\n        <div class=\"row\">\r\n            <div class=\"col-md-10 col-lg-7 col-xl-7 offset-md-1 offset-lg-0 offset-xl-1\"><a class=\"text-left\" href=\"#\"><img class=\"img-fluid chambre\" src=\"/assets/images/general/standard1.jpg\"></a>\r\n                <h6 class=\"text name\"><br><b>Chambre à coucher moderne</b></h6>\r\n                <p class=\"text description\">Cette suite de luxe est la chambre idéale pour se reposer et passer un agréable moment à Strasbourg.\r\n                Elle comprend : <br>\r\n                    </p><ul>\r\n                        <li>Un lit 180x200cm pour un confort inestimable</li>\r\n                        <li>Une superficie de 45m²</li>\r\n                        <li>Climatiseur indépendant</li>\r\n                        <li>Un balcon, une vue sur la magnifique cathédrale</li>\r\n                    <br>\r\n                    <br>\r\n                    </ul>\r\n                <p></p>\r\n            </div>\r\n        </div>\r\n    \r\n    <div class=\"row\">\r\n        <div class=\"col-md-12 col-lg-7 offset-md-1 offset-lg-0 offset-xl-4\"><a href=\"#\"><img class=\"img-fluid sdb\" src=\"/assets/images/general/salle-de-bain-luxe.jpg\"></a>\r\n            <h6 class=\"text name\"><br><b>Salle de bain</b></h6>\r\n                <p class=\"text description\">Une salle de bain ultra moderne équipée de matériels très haut de gamme.<br> Elle comprend : </p>\r\n                    <ul class=\"sdbb\">\r\n                        <li>Mitigeur d\'exception Elizabeth</li>\r\n                        <li>Baignoire Villeroy &amp; Boch</li>\r\n                        <li>Miroir lumineux</li>\r\n                        <li>Meuble Hudson Reed</li>\r\n                        <li>Pièce marbré</li>\r\n                    </ul>\r\n            </div>\r\n        </div>\r\n    <br>\r\n    <h5 class=\"text-center\"><br><br><br><br><br>Services</h5>\r\n        <p><i class=\"fa fa-wifi\"></i>&nbsp;Wi-Fi gratuit</p>\r\n        <p><i class=\"fa fa-glass\"></i>&nbsp;Bar</p>\r\n        <img src=\"https://img.icons8.com/pastel-glyph/50/000000/no-animals--v2.png\" fill=\"\" size=\"medium\" <p=\"\" width=\"16\" height=\"16\"> Animaux interdit<p></p>\r\n        <img src=\"https://img.icons8.com/ios/50/000000/restaurant.png\" fill=\"\" size=\"medium\" <p=\"\" width=\"16\" height=\"16\"> Restaurant<p></p>\r\n        <svg class=\"bk-icon -streamline-city\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path></svg> Vue sur la ville<p></p>\r\n</div>\r\n    ','    <div class=\"container text-right\">\r\n        <div class=\"intro\">\r\n            <h1 class=\"text-center\">Suite standard</h1>',200),(6,'Royale','            <p class=\"text-center\">Réservez votre chambre 24h/24 en ligne !<br>Passez un moment unique au cœur de Strasbourg</p>\r\n        </div>\r\n        <div class=\"row\">\r\n                <div class=\"col-md-10 col-lg-7 col-xl-7 offset-md-1 offset-lg-0 offset-xl-1\"><a class=\"text-left\" href=\"#\"><img class=\"img-fluid chambre\" src=\"/assets/images/general/standard2.jpg\"></a>\r\n                    <h6 class=\"text name\"><br><B>Chambre à coucher moderne</B></h6>\r\n                    <p class=\"text description\">Cette suite de luxe est la chambre idéale pour se reposer et passer un agréable moment à Strasbourg.\r\n                        Elle comprend : <br>\r\n                            <ul>\r\n                                <li>Un lit 180x200cm pour un confort inestimable</li>\r\n                                <li>Une superficie de 45m²</li>\r\n                                <li>Climatiseur indépendant</li>\r\n                                <li>Un balcon, une vue sur la magnifique cathédrale</li>\r\n                                <br>\r\n                                <br>\r\n                            </ul>\r\n                        </p>\r\n                </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"row\">\r\n        <div class=\"col-md-12 col-lg-7 offset-md-1 offset-lg-0 offset-xl-4\"><a href=\"#\"><img class=\"img-fluid sdb\"  src=\"/assets/images/general/sdb2.jpg\"></a>\r\n            <h6 class=\"text name\"><br><B>Salle de bain</B></h6>\r\n                <p class=\"text description\">Une salle de bain ultra moderne équipée de matériels très haut de gamme.<br> Elle comprend : </p>\r\n                    <ul class=\"sdbb\">\r\n                        <li>Mitigeur d\'exception Elizabeth</li>\r\n                        <li>Baignoire Villeroy & Boch</li>\r\n                        <li>Miroir lumineux</li>\r\n                        <li>Meuble Hudson Reed</li>\r\n                        <li>Pièce marbré</li>\r\n                    </ul>\r\n        </div>\r\n    </div>\r\n    <br>\r\n        <h5 class=\"text-center\"><br><br><br><br><br>Services</h5>\r\n            <p><i class=\"fa fa-wifi\"></i>&nbsp;Wi-Fi gratuit</p>\r\n            <p><i class=\"fa fa-glass\"></i>&nbsp;Bar</p>\r\n            <img src=\"https://img.icons8.com/pastel-glyph/50/000000/no-animals--v2.png\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path> Animaux interdit</p>\r\n            <img src=\"https://img.icons8.com/ios/50/000000/restaurant.png\"fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path></svg> Restaurant</p>\r\n            <p><svg class=\"bk-icon -streamline-city\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path></svg> Vue sur la ville</p>\r\n       ','    <div class=\"container text-right\">\r\n        <div class=\"intro\">\r\n            <h1 class=\"text-center\">Chambre Royale</h1>',300),(7,'Luxe','               <p class=\"text-center\">Réservez votre chambre 24h/24 en ligne !<br>Passez un moment unique au cœur de Strasbourg</p>\r\n            </div>\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-10 col-lg-7 col-xl-7 offset-md-1 offset-lg-0 offset-xl-1\"><a class=\"text-left\" href=\"#\"><img class=\"img-fluid chambre\" src=\"/assets/images/general/luxe1.jpg\"></a>\r\n                            <h6 class=\"text name\"><br><B>Chambre à coucher moderne</B></h6>\r\n                            <p class=\"text description\">Cette suite de luxe est la chambre idéale pour se reposer et passer un agréable moment à Strasbourg.\r\n                            Elle comprend : <br>\r\n                                <ul>\r\n                                    <li>Un lit 180x200cm pour un confort inestimable</li>\r\n                                    <li>Une superficie de 45m²</li>\r\n                                    <li>Climatiseur indépendant</li>\r\n                                    <li>Un balcon, une vue sur la magnifique cathédrale</li>\r\n                                <br>\r\n                                <br>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n        </div>\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-12 col-lg-7 offset-md-1 offset-lg-0 offset-xl-4\"><a href=\"#\"><img class=\"img-fluid sdb\"  src=\"/assets/images/general/jacuzzi.jpg\"></a>\r\n                            <h6 class=\"text name\"><br><B>Salle de bain</B></h6>\r\n                                    <p class=\"text description\">Une salle de bain ultra moderne équipée de matériels très haut de gamme.<br> Elle comprend : </p>\r\n                                    <ul class=\"sdbb\">\r\n                                        <li>Mitigeur d\'exception Elizabeth</li>\r\n                                        <li>Baignoire Villeroy & Boch</li>\r\n                                        <li>Miroir lumineux</li>\r\n                                        <li>Meuble Hudson Reed</li>\r\n                                        <li>Pièce marbré</li>\r\n                                        <li>Jacuzzi ultra luxe</li>\r\n                                    </ul>\r\n                        </div>\r\n                    </div>\r\n                <br>\r\n                    <h5 class=\"text-center\"><br><br><br><br><br>Services</h5>\r\n                        <p><i class=\"fa fa-wifi\"></i>&nbsp;Wi-Fi gratuit</p>\r\n                        <p><i class=\"fa fa-glass\"></i>&nbsp;Bar</p>\r\n                        <img src=\"https://img.icons8.com/pastel-glyph/50/000000/no-animals--v2.png\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" <p> Animaux interdit</p>\r\n                        <img src=\"https://img.icons8.com/ios/50/000000/restaurant.png\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" <p> Restaurant</p>\r\n                        <svg class=\"bk-icon -streamline-city\" fill=\"\" size=\"medium\" width=\"16\" height=\"16\" viewBox=\"0 0 24 24\"><path d=\"M2.75 6h9.5a.25.25 0 0 1-.25-.25v17.5l.75-.75H2.25l.75.75V5.75a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v17.5c0 .414.336.75.75.75h10.5a.75.75 0 0 0 .75-.75V5.75c0-.69-.56-1.25-1.25-1.25h-9.5zm3-1.5h3.5A.25.25 0 0 1 9 2.75v2.5l.75-.75h-4.5l.75.75v-2.5a.25.25 0 0 1-.25.25zm0-1.5c-.69 0-1.25.56-1.25 1.25v2.5c0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75v-2.5c0-.69-.56-1.25-1.25-1.25h-3.5zM5.25 9h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zm0 3h4.5a.75.75 0 0 0 0-1.5h-4.5a.75.75 0 0 0 0 1.5zM7.5.75v1.5a.75.75 0 0 0 1.5 0V.75a.75.75 0 0 0-1.5 0zM15.75 24h6a.75.75 0 0 0 .75-.75V10.5A1.5 1.5 0 0 0 21 9h-4.5a1.5 1.5 0 0 0-1.5 1.5v12.75a.75.75 0 0 0 1.5 0V10.5H21v12.75l.75-.75h-6a.75.75 0 0 0 0 1.5zM19.5 8.25v1.5a.75.75 0 0 0 1.5 0v-1.5a.75.75 0 0 0-1.5 0zM.75 24h22.5a.75.75 0 0 0 0-1.5H.75a.75.75 0 0 0 0 1.5z\"></path></svg> Vue sur la ville</p>\r\n\r\n\r\n\r\n','        <div class=\"container text-right\">\r\n            <div class=\"intro\">\r\n                <h1 class=\"text-center\">Chambre Luxe</h1>',500);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 14:33:00
