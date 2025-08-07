CREATE DATABASE  IF NOT EXISTS `railway_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `railway_system`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: railway_system
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` varchar(50) NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `paid_on` timestamp NULL DEFAULT NULL,
  `booking_status` varchar(50) DEFAULT NULL,
  `booked_on` timestamp NULL DEFAULT NULL,
  `seat_allocated` varchar(10) DEFAULT NULL,
  `meal_booked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey`
--

DROP TABLE IF EXISTS `journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey` (
  `journey_id` varchar(50) NOT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `train_id` varchar(50) DEFAULT NULL,
  `booking_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`journey_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `journey_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `journey_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train_details` (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey`
--

LOCK TABLES `journey` WRITE;
/*!40000 ALTER TABLE `journey` DISABLE KEYS */;
/*!40000 ALTER TABLE `journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` varchar(100) NOT NULL,
  `user_passcord` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `sign_up_on` date DEFAULT NULL,
  `email_id` varchar(150) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `user_passcord` (`user_passcord`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`user_passcord`) REFERENCES `user_login` (`user_passcord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `station_id` varchar(50) NOT NULL,
  `station_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_details`
--

DROP TABLE IF EXISTS `train_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_details` (
  `train_id` varchar(50) NOT NULL,
  `train_type_id` varchar(50) DEFAULT NULL,
  `train_type_name` varchar(100) DEFAULT NULL,
  `source_station_id` varchar(50) DEFAULT NULL,
  `destination_station_id` varchar(50) DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `passenger_strength` int DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`train_id`),
  KEY `train_type_id` (`train_type_id`),
  KEY `source_station_id` (`source_station_id`),
  KEY `destination_station_id` (`destination_station_id`),
  CONSTRAINT `train_details_ibfk_1` FOREIGN KEY (`train_type_id`) REFERENCES `train_type` (`train_type_id`),
  CONSTRAINT `train_details_ibfk_2` FOREIGN KEY (`source_station_id`) REFERENCES `stations` (`station_id`),
  CONSTRAINT `train_details_ibfk_3` FOREIGN KEY (`destination_station_id`) REFERENCES `stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_details`
--

LOCK TABLES `train_details` WRITE;
/*!40000 ALTER TABLE `train_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_routes`
--

DROP TABLE IF EXISTS `train_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_routes` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `train_id` varchar(50) DEFAULT NULL,
  `station_id` varchar(50) DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `halt_duration_minutes` int DEFAULT NULL,
  `estimated_arrival` time DEFAULT NULL,
  `estimated_departure` time DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `train_id` (`train_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `train_routes_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train_details` (`train_id`),
  CONSTRAINT `train_routes_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_routes`
--

LOCK TABLES `train_routes` WRITE;
/*!40000 ALTER TABLE `train_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_type`
--

DROP TABLE IF EXISTS `train_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_type` (
  `train_type_id` varchar(50) NOT NULL,
  `train_type_name` varchar(100) DEFAULT NULL,
  `coach_count` int DEFAULT NULL,
  PRIMARY KEY (`train_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_type`
--

LOCK TABLES `train_type` WRITE;
/*!40000 ALTER TABLE `train_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `user_passcord` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `sign_up_on` date DEFAULT NULL,
  `email_id` varchar(150) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_passcord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES ('UP001','Shubham','Singh','2025-08-07','shubham@gmail.com','6287620091');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-07 20:05:47
