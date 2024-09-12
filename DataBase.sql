-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: machine management system
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
-- Table structure for table `job_requests`
--

DROP TABLE IF EXISTS `job_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `requested_by` int NOT NULL,
  `machine_id` int NOT NULL,
  `job_description` text NOT NULL,
  `request_date` varchar(45) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requests`
--

LOCK TABLES `job_requests` WRITE;
/*!40000 ALTER TABLE `job_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_allocations`
--

DROP TABLE IF EXISTS `machine_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine_allocations` (
  `allocation_id` int NOT NULL AUTO_INCREMENT,
  `machine_id` int NOT NULL,
  `user_id` int NOT NULL,
  `job_id` enum('Maintenance','Repair','Upgrade') NOT NULL,
  `allocation_start` text NOT NULL,
  `allocation_end` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_allocations`
--

LOCK TABLES `machine_allocations` WRITE;
/*!40000 ALTER TABLE `machine_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmachineoperation`
--

DROP TABLE IF EXISTS `tblmachineoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmachineoperation` (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  `machine_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `operation_type` enum('Maintenance','Repair','Upgrade') NOT NULL,
  `description` text,
  `operation_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmachineoperation`
--

LOCK TABLES `tblmachineoperation` WRITE;
/*!40000 ALTER TABLE `tblmachineoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmachineoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmachineregistration`
--

DROP TABLE IF EXISTS `tblmachineregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmachineregistration` (
  `Machine ID` int NOT NULL AUTO_INCREMENT,
  `Machine Name` varchar(45) NOT NULL,
  `Machine Type` varchar(45) DEFAULT NULL,
  `Model` varchar(45) NOT NULL,
  `Serial Number` varchar(45) NOT NULL,
  `Purchase Date` date NOT NULL,
  `Location` varchar(45) NOT NULL,
  `Date Registered` date NOT NULL,
  `Responsible Person` varchar(45) NOT NULL,
  `Number of Employees` varchar(45) NOT NULL,
  PRIMARY KEY (`Machine ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmachineregistration`
--

LOCK TABLES `tblmachineregistration` WRITE;
/*!40000 ALTER TABLE `tblmachineregistration` DISABLE KEYS */;
INSERT INTO `tblmachineregistration` VALUES (1,'Dell XPS 13','Laptop','XPS 13','SN12345678','2024-06-25','Accounts','2024-06-27','Nimal','100'),(2,'HP Workstation','Desktop Computer','Z4 G4','SN87654321','2024-06-25','Engineering','2024-06-28','Kamal','101');
/*!40000 ALTER TABLE `tblmachineregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblusers` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role` enum('Admin','Operator','Manager') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`User_Name`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers`
--

LOCK TABLES `tblusers` WRITE;
/*!40000 ALTER TABLE `tblusers` DISABLE KEYS */;
INSERT INTO `tblusers` VALUES (1,'Admin','12',NULL,NULL,'Admin');
/*!40000 ALTER TABLE `tblusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-27 17:35:39
