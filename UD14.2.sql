CREATE DATABASE  IF NOT EXISTS `BIBLIOTECA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BIBLIOTECA`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.156    Database: BIBLIOTECA
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `AUTOR`
--

DROP TABLE IF EXISTS `AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOR` (
  `claveAutor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`claveAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOR`
--

LOCK TABLES `AUTOR` WRITE;
/*!40000 ALTER TABLE `AUTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDITORIAL`
--

DROP TABLE IF EXISTS `EDITORIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORIAL` (
  `claveEditorial` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`claveEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDITORIAL`
--

LOCK TABLES `EDITORIAL` WRITE;
/*!40000 ALTER TABLE `EDITORIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDITORIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EJEMPLAR`
--

DROP TABLE IF EXISTS `EJEMPLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EJEMPLAR` (
  `claveEjemplar` int NOT NULL AUTO_INCREMENT,
  `claveLibro` int DEFAULT NULL,
  `numeroOrden` int DEFAULT NULL,
  `edición` int DEFAULT NULL,
  `ubicacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `categoria` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`claveEjemplar`),
  KEY `claveLibro` (`claveLibro`),
  CONSTRAINT `EJEMPLAR_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `LIBRO` (`claveLibro`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EJEMPLAR`
--

LOCK TABLES `EJEMPLAR` WRITE;
/*!40000 ALTER TABLE `EJEMPLAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `EJEMPLAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESCRITO_POR`
--

DROP TABLE IF EXISTS `ESCRITO_POR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESCRITO_POR` (
  `claveLibro` int NOT NULL,
  `claveAutor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  KEY `claveLibro` (`claveLibro`),
  KEY `claveAutor` (`claveAutor`),
  CONSTRAINT `ESCRITO_POR_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `LIBRO` (`claveLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ESCRITO_POR_ibfk_2` FOREIGN KEY (`claveAutor`) REFERENCES `AUTOR` (`claveAutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESCRITO_POR`
--

LOCK TABLES `ESCRITO_POR` WRITE;
/*!40000 ALTER TABLE `ESCRITO_POR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ESCRITO_POR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRO`
--

DROP TABLE IF EXISTS `LIBRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIBRO` (
  `claveLibro` int NOT NULL,
  `titulo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idioma` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `formato` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `claveEditorial` int DEFAULT NULL,
  PRIMARY KEY (`claveLibro`),
  KEY `claveEditorial` (`claveEditorial`),
  CONSTRAINT `LIBRO_ibfk_1` FOREIGN KEY (`claveEditorial`) REFERENCES `EDITORIAL` (`claveEditorial`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRO`
--

LOCK TABLES `LIBRO` WRITE;
/*!40000 ALTER TABLE `LIBRO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIBRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESTAMO`
--

DROP TABLE IF EXISTS `PRESTAMO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRESTAMO` (
  `claveSocio` int DEFAULT NULL,
  `claveEjemplar` int DEFAULT NULL,
  `numeroOrden` int NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `notas` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clavePrestamo` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`clavePrestamo`),
  KEY `claveSocio` (`claveSocio`),
  KEY `claveEjemplar` (`claveEjemplar`),
  CONSTRAINT `PRESTAMO_ibfk_1` FOREIGN KEY (`claveSocio`) REFERENCES `SOCIO` (`claveSocio`),
  CONSTRAINT `PRESTAMO_ibfk_2` FOREIGN KEY (`claveEjemplar`) REFERENCES `EJEMPLAR` (`claveEjemplar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESTAMO`
--

LOCK TABLES `PRESTAMO` WRITE;
/*!40000 ALTER TABLE `PRESTAMO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESTAMO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOCIO`
--

DROP TABLE IF EXISTS `SOCIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOCIO` (
  `claveSocio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dirección` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `categoria` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`claveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOCIO`
--

LOCK TABLES `SOCIO` WRITE;
/*!40000 ALTER TABLE `SOCIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SOCIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEMA`
--

DROP TABLE IF EXISTS `TEMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEMA` (
  `claveTema` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`claveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMA`
--

LOCK TABLES `TEMA` WRITE;
/*!40000 ALTER TABLE `TEMA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRATA_SOBRE`
--

DROP TABLE IF EXISTS `TRATA_SOBRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRATA_SOBRE` (
  `claveLibro` int NOT NULL,
  `claveTema` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  KEY `claveLibro` (`claveLibro`),
  KEY `claveTema` (`claveTema`),
  CONSTRAINT `TRATA_SOBRE_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `LIBRO` (`claveLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TRATA_SOBRE_ibfk_2` FOREIGN KEY (`claveTema`) REFERENCES `TEMA` (`claveTema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRATA_SOBRE`
--

LOCK TABLES `TRATA_SOBRE` WRITE;
/*!40000 ALTER TABLE `TRATA_SOBRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRATA_SOBRE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-31 13:47:45