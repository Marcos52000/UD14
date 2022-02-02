CREATE DATABASE  IF NOT EXISTS `RECETAS` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `RECETAS`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.156    Database: RECETAS
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
-- Table structure for table `INGREDIENTES`
--

DROP TABLE IF EXISTS `INGREDIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INGREDIENTES` (
  `idIngrediente` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idReceta` int DEFAULT NULL,
  PRIMARY KEY (`idIngrediente`),
  KEY `idReceta` (`idReceta`),
  CONSTRAINT `INGREDIENTES_ibfk_1` FOREIGN KEY (`idReceta`) REFERENCES `RECETA` (`idReceta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INGREDIENTES`
--

LOCK TABLES `INGREDIENTES` WRITE;
/*!40000 ALTER TABLE `INGREDIENTES` DISABLE KEYS */;
INSERT INTO `INGREDIENTES` VALUES (1,'pescado',3),(2,'HELADO',4),(3,'aguacate',8),(4,'patatas',12),(5,'ajo',13),(6,'harina',5),(7,'huevos',7),(8,'leche',7),(9,'atun',15),(10,'carne',5);
/*!40000 ALTER TABLE `INGREDIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECETA`
--

DROP TABLE IF EXISTS `RECETA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECETA` (
  `idReceta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duracion` float DEFAULT NULL,
  `idTipo` int DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idTipo` (`idTipo`),
  CONSTRAINT `RECETA_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `TIPOS_PLATO` (`idTipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECETA`
--

LOCK TABLES `RECETA` WRITE;
/*!40000 ALTER TABLE `RECETA` DISABLE KEYS */;
INSERT INTO `RECETA` VALUES (3,'pollo al aguacate',30,10),(4,'pollo al aguacate',30,10),(5,'TORTA helado',45,9),(6,'carne semi cocida',25,8),(7,'TORTA',45,9),(8,'pollo al aguacate',30,10),(9,'pescado al ajillo',45,3),(10,'pate',1.3,5),(11,'atun',30,3),(12,'carne estofado',1.1,2),(13,'pescado al ajillo',45,3),(14,'pate',1.3,5),(15,'atun',30,3),(16,'carne estofado',1.1,2);
/*!40000 ALTER TABLE `RECETA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_PLATO`
--

DROP TABLE IF EXISTS `TIPOS_PLATO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPOS_PLATO` (
  `idTipo` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_PLATO`
--

LOCK TABLES `TIPOS_PLATO` WRITE;
/*!40000 ALTER TABLE `TIPOS_PLATO` DISABLE KEYS */;
INSERT INTO `TIPOS_PLATO` VALUES (1,'rapidos'),(2,'OCASION ESPECIAL'),(3,'pescados'),(4,'carnes'),(5,'postres'),(6,'aperitivos'),(7,'ligeros'),(8,'familiares'),(9,'especailizados'),(10,'rapidos');
/*!40000 ALTER TABLE `TIPOS_PLATO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-31 13:46:25
