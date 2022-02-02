CREATE DATABASE  IF NOT EXISTS `HORARIO_ESCOLAR` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `HORARIO_ESCOLAR`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.156    Database: HORARIO_ESCOLAR
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
-- Table structure for table `ASIGNATURA`
--

DROP TABLE IF EXISTS `ASIGNATURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASIGNATURA` (
  `codiEuropeo` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codigoInterno` int DEFAULT NULL,
  PRIMARY KEY (`codiEuropeo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASIGNATURA`
--

LOCK TABLES `ASIGNATURA` WRITE;
/*!40000 ALTER TABLE `ASIGNATURA` DISABLE KEYS */;
INSERT INTO `ASIGNATURA` VALUES (1,'filosofía',392),(2,'idiomas',1020),(3,'cálculo',4),(4,'base de datos',392),(5,'historia',789),(6,'fol',1472),(7,'programación',4789),(8,'lenguaje de marcas',974),(9,'ficheros',3),(1878,'matemáticas',9389);
/*!40000 ALTER TABLE `ASIGNATURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AULAS`
--

DROP TABLE IF EXISTS `AULAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AULAS` (
  `codiAula` int NOT NULL,
  `numAula` int DEFAULT NULL,
  `horario` float NOT NULL,
  `metros` float DEFAULT NULL,
  PRIMARY KEY (`codiAula`),
  UNIQUE KEY `numAula` (`numAula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AULAS`
--

LOCK TABLES `AULAS` WRITE;
/*!40000 ALTER TABLE `AULAS` DISABLE KEYS */;
INSERT INTO `AULAS` VALUES (1001,112,10.3,9),(1002,116,8.3,8),(1003,111,12.3,4),(1004,6,8,5),(1005,108,10.3,3),(1006,45,9.3,6),(1007,12,10.45,4),(1008,16,10.3,9),(1009,1,10.3,4),(1010,5,9,7);
/*!40000 ALTER TABLE `AULAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AULA_OCUPADA`
--

DROP TABLE IF EXISTS `AULA_OCUPADA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AULA_OCUPADA` (
  `codiOcupada` int NOT NULL,
  `codiHora` int NOT NULL,
  `codiEuropeo` int NOT NULL,
  `codiAula` int NOT NULL,
  PRIMARY KEY (`codiOcupada`),
  KEY `codiHora` (`codiHora`),
  KEY `codiEuropeo` (`codiEuropeo`),
  KEY `codiAula` (`codiAula`),
  CONSTRAINT `AULA_OCUPADA_ibfk_1` FOREIGN KEY (`codiHora`) REFERENCES `HORARIO` (`codiHora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AULA_OCUPADA_ibfk_2` FOREIGN KEY (`codiEuropeo`) REFERENCES `ASIGNATURA` (`codiEuropeo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AULA_OCUPADA_ibfk_3` FOREIGN KEY (`codiAula`) REFERENCES `AULAS` (`codiAula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AULA_OCUPADA`
--

LOCK TABLES `AULA_OCUPADA` WRITE;
/*!40000 ALTER TABLE `AULA_OCUPADA` DISABLE KEYS */;
INSERT INTO `AULA_OCUPADA` VALUES (1,2,3,1001),(2,2,3,1001),(3,5,6,1002),(4,4,3,1003),(5,1,4,1004),(6,2,2,1005),(7,6,6,1006),(8,9,5,1007),(9,4,4,1008),(10,9,5,1010);
/*!40000 ALTER TABLE `AULA_OCUPADA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CICLOS`
--

DROP TABLE IF EXISTS `CICLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CICLOS` (
  `codiCiclo` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `especialidad` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `prelacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codiEuropeo` int DEFAULT NULL,
  PRIMARY KEY (`codiCiclo`),
  KEY `codiEuropeo` (`codiEuropeo`),
  CONSTRAINT `CICLOS_ibfk_1` FOREIGN KEY (`codiEuropeo`) REFERENCES `ASIGNATURA` (`codiEuropeo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CICLOS`
--

LOCK TABLES `CICLOS` WRITE;
/*!40000 ALTER TABLE `CICLOS` DISABLE KEYS */;
INSERT INTO `CICLOS` VALUES (1,'informatica','asix','matematicas 1',1),(2,'informatica','daw','programacion 1',2),(3,'informatica','dam','m03',3),(5,'fisiologia','fisiologia','anatomia 1',5),(6,'dietetica','nutricion','nutricion 1',6),(7,'administracion','administracion','administracion 1',7),(8,'robotica','inteligencia artificial','robotica 1',8),(9,'mercadotecnia','publicidad','publicidad 1',9),(10,'diseño','diseño','diseño 1',1);
/*!40000 ALTER TABLE `CICLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CICLO_INICIACION`
--

DROP TABLE IF EXISTS `CICLO_INICIACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CICLO_INICIACION` (
  `codiCiclo` int NOT NULL,
  `codiCicloInterno` int NOT NULL,
  PRIMARY KEY (`codiCicloInterno`),
  KEY `codiCiclo` (`codiCiclo`),
  CONSTRAINT `CICLO_INICIACION_ibfk_1` FOREIGN KEY (`codiCiclo`) REFERENCES `CICLOS` (`codiCiclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CICLO_INICIACION`
--

LOCK TABLES `CICLO_INICIACION` WRITE;
/*!40000 ALTER TABLE `CICLO_INICIACION` DISABLE KEYS */;
INSERT INTO `CICLO_INICIACION` VALUES (1,1),(1,2),(1,10),(2,3),(2,4),(5,8),(7,5),(8,7),(9,9),(10,6);
/*!40000 ALTER TABLE `CICLO_INICIACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CICLO_MEDIO`
--

DROP TABLE IF EXISTS `CICLO_MEDIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CICLO_MEDIO` (
  `codiCiclo` int NOT NULL,
  `codiCicloInterno` int NOT NULL,
  PRIMARY KEY (`codiCicloInterno`),
  KEY `codiCiclo` (`codiCiclo`),
  CONSTRAINT `CICLO_MEDIO_ibfk_1` FOREIGN KEY (`codiCiclo`) REFERENCES `CICLOS` (`codiCiclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CICLO_MEDIO`
--

LOCK TABLES `CICLO_MEDIO` WRITE;
/*!40000 ALTER TABLE `CICLO_MEDIO` DISABLE KEYS */;
INSERT INTO `CICLO_MEDIO` VALUES (1,1),(1,2),(1,10),(2,3),(2,4),(5,8),(7,5),(8,7),(9,9),(10,6);
/*!40000 ALTER TABLE `CICLO_MEDIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CICLO_SUPERIOR`
--

DROP TABLE IF EXISTS `CICLO_SUPERIOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CICLO_SUPERIOR` (
  `codiCiclo` int NOT NULL,
  `codiCicloInterno` int NOT NULL,
  PRIMARY KEY (`codiCicloInterno`),
  KEY `codiCiclo` (`codiCiclo`),
  CONSTRAINT `CICLO_SUPERIOR_ibfk_1` FOREIGN KEY (`codiCiclo`) REFERENCES `CICLOS` (`codiCiclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CICLO_SUPERIOR`
--

LOCK TABLES `CICLO_SUPERIOR` WRITE;
/*!40000 ALTER TABLE `CICLO_SUPERIOR` DISABLE KEYS */;
INSERT INTO `CICLO_SUPERIOR` VALUES (1,1),(1,2),(1,7),(1,10),(2,3),(2,4),(2,8),(3,5),(3,6),(3,9);
/*!40000 ALTER TABLE `CICLO_SUPERIOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HORARIO`
--

DROP TABLE IF EXISTS `HORARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HORARIO` (
  `codiHora` int NOT NULL,
  `numHora` int NOT NULL,
  `dia_semana` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`codiHora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HORARIO`
--

LOCK TABLES `HORARIO` WRITE;
/*!40000 ALTER TABLE `HORARIO` DISABLE KEYS */;
INSERT INTO `HORARIO` VALUES (1,3,'lunes'),(2,6,'martes'),(3,5,'lunes'),(4,1,'miercoles'),(5,4,'viernes'),(6,6,'viernes'),(7,2,'jueves'),(8,1,'viernes'),(9,4,'lunes'),(10,2,'martes');
/*!40000 ALTER TABLE `HORARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFESOR`
--

DROP TABLE IF EXISTS `PROFESOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROFESOR` (
  `codiInternoProf` int NOT NULL,
  `numAula` int DEFAULT NULL,
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `direccion` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `segSocial` int DEFAULT NULL,
  `antiguedad` float DEFAULT NULL,
  `codiInternoProfTutor` int DEFAULT NULL,
  `codiEuropeo` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`codiInternoProf`),
  UNIQUE KEY `numAula` (`numAula`),
  UNIQUE KEY `dni` (`dni`),
  KEY `codiEuropeo` (`codiEuropeo`),
  KEY `codiInternoProfTutor` (`codiInternoProfTutor`),
  CONSTRAINT `PROFESOR_ibfk_1` FOREIGN KEY (`codiEuropeo`) REFERENCES `ASIGNATURA` (`codiEuropeo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PROFESOR_ibfk_2` FOREIGN KEY (`codiInternoProfTutor`) REFERENCES `PROFESOR` (`codiInternoProf`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFESOR`
--

LOCK TABLES `PROFESOR` WRITE;
/*!40000 ALTER TABLE `PROFESOR` DISABLE KEYS */;
INSERT INTO `PROFESOR` VALUES (1,16,'luis','avenida siempre viva',89745562,'luis@gmail.com',784556,21478,8,NULL,8,'2020-12-12'),(2,6,'luis','avenida siempre viva',89745562,'luis@gmail.com',788956,21478,8,2,8,'2020-12-12'),(3,112,'luis','avenida siempre viva',89745562,'luis@gmail.com',78456,21478,8,NULL,9,'2002-02-20'),(4,116,'ALBERT','avenida siempre viva',89745561,'albert@gmail.com',781056,21478,8,NULL,1,'2020-12-12'),(5,111,'pepito','avenida siempre viva',11472,'pepito@gmail.com',712566,21478,8,NULL,5,'1998-02-20'),(6,5,'FULANITO','avenida siempre viva',8963214,'luis@gmail.com',32145,21478,8,NULL,9,'1990-02-20'),(7,45,'sutanito','avenida siempre viva',841252,'luis@gmail.com',62347,21478,8,NULL,9,'2007-02-20'),(8,1,'FULANITO','avenida siempre viva',1254785,'luis@gmail.com',765662,1245478,8,NULL,9,'2014-02-20'),(9,108,'FULANITO','avenida siempre viva',6554785,'luis@gmail.com',96642,745478,8,NULL,9,'2010-02-20'),(10,12,'gloria','avenida siempre viva',32147,'glori@gmail.com',96356,314478,38,NULL,1878,'2019-01-27');
/*!40000 ALTER TABLE `PROFESOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-31 13:32:37
