CREATE DATABASE  IF NOT EXISTS `dental_control` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dental_control`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: us-cdbr-east-05.cleardb.net    Database: heroku_dd2ab98310a4a23
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `antecedentes`
--

DROP TABLE IF EXISTS `antecedentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedentes` (
  `AntecedentesId` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteId` int(11) NOT NULL,
  `Alergias` varchar(100) DEFAULT NULL,
  `CirujiasPrevias` tinyint(1) NOT NULL,
  `Enfermedades` varchar(100) DEFAULT NULL,
  `Habitos` varchar(100) DEFAULT NULL,
  `Motivo` varchar(100) DEFAULT NULL,
  `ProblemasHemorragicos` tinyint(1) NOT NULL,
  PRIMARY KEY (`AntecedentesId`),
  UNIQUE KEY `AntecedentesId_UNIQUE` (`AntecedentesId`),
  KEY `AntecedentesPacienteId_idx` (`PacienteId`),
  CONSTRAINT `AntecedentesPacienteId` FOREIGN KEY (`PacienteId`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentes`
--

LOCK TABLES `antecedentes` WRITE;
/*!40000 ALTER TABLE `antecedentes` DISABLE KEYS */;
INSERT INTO `antecedentes` VALUES (12,7,'Ninguna',1,'Ninguna','comer a las 10 pm','dolor fuerte en las encias',0),(14,13,'Ninguna',0,'ninguna','Lavarse los dientes 2 veces al dia ','dolor intenso en las encias',0),(24,14,'Polen',1,'Ninguna','Come a altas horas de la noche, se muerde las uñas','dolor en la encias',0);
/*!40000 ALTER TABLE `antecedentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `id_calendario` int(11) NOT NULL AUTO_INCREMENT,
  `id_cita` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_calendario`),
  UNIQUE KEY `CalendarioID_UNIQUE` (`id_calendario`),
  KEY `FK_CitaCalendario_idx` (`id_cita`),
  CONSTRAINT `FK_CitaCalendario` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendariodoctor`
--

DROP TABLE IF EXISTS `calendariodoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendariodoctor` (
  `id_calendario` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  PRIMARY KEY (`id_calendario`,`id_doctor`),
  KEY `FK_DoctorID_idx` (`id_doctor`),
  CONSTRAINT `FK_id_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id_calendario`),
  CONSTRAINT `FK_id_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendariodoctor`
--

LOCK TABLES `calendariodoctor` WRITE;
/*!40000 ALTER TABLE `calendariodoctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendariodoctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cirujia`
--

DROP TABLE IF EXISTS `cirujia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirujia` (
  `CirujiaId` int(11) NOT NULL AUTO_INCREMENT,
  `AntecedenteId` int(11) DEFAULT NULL,
  `NombreCirujia` varchar(100) NOT NULL,
  `FechaCirujia` date NOT NULL,
  `PacienteId` int(11) NOT NULL,
  `DoctorACargo` varchar(100) NOT NULL,
  PRIMARY KEY (`CirujiaId`),
  KEY `CirujiaAntecedenteID_idx` (`AntecedenteId`),
  KEY `CirujiaPacienteID_idx` (`PacienteId`),
  CONSTRAINT `CirujiaAntecedenteID` FOREIGN KEY (`AntecedenteId`) REFERENCES `antecedentes` (`AntecedentesId`),
  CONSTRAINT `CirujiaPacienteID` FOREIGN KEY (`PacienteId`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirujia`
--

LOCK TABLES `cirujia` WRITE;
/*!40000 ALTER TABLE `cirujia` DISABLE KEYS */;
INSERT INTO `cirujia` VALUES (5,12,'Endodoncia','2012-03-01',7,'Dr.Mauricio Gomez'),(7,14,'','0000-00-00',13,''),(14,24,'Endodoncia','0000-00-00',14,'Perez');
/*!40000 ALTER TABLE `cirujia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `FK_Paciente_idx` (`id_paciente`),
  KEY `FK_CitaDoctorID_idx` (`id_doctor`),
  CONSTRAINT `FK_CitaDoctorID` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`),
  CONSTRAINT `FK_PacienteID` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (74,7,104,'2022-06-13','15:00:00','16:00:00','Cancelada'),(84,13,104,'2022-06-16','13:00:00','14:00:00','Cancelada'),(94,7,104,'2022-06-20','15:00:00','16:00:00','Cancelada'),(104,14,114,'2022-06-20','15:00:00','16:00:00','Cancelada'),(105,14,104,'2022-06-17','16:00:00','17:00:00','Cancelada'),(114,13,114,'2022-07-07','11:00:00','12:00:00','Cancelada'),(124,14,104,'2022-07-06','15:00:00','16:00:00','Cancelada');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id_doctor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Especialidad` varchar(45) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `FechaNac` date NOT NULL,
  `Cedula` varchar(10) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Edad` int(11) NOT NULL,
  `NumCelular` varchar(10) NOT NULL,
  `NumFijo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_doctor`),
  UNIQUE KEY `DoctorID_UNIQUE` (`id_doctor`),
  UNIQUE KEY `CorreoElectronico_UNIQUE` (`CorreoElectronico`),
  UNIQUE KEY `NumCelular_UNIQUE` (`NumCelular`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (104,'Jorge','Sanchez','Ortodensista','jorsao@hotmail.com','1962-08-22','1726550153','Masculino',59,'0993102334','3937378'),(114,'Erik','Rivadeneira','Ortodensista','erik.rivadeneira@gmail.com','1992-09-30','1726550152','Masculino',29,'0987224515','3937476'),(124,'Felipe','Perez','Periodoncista','andresaoperez@hotmail.com','1988-06-10','176550651','Masculino',34,'0992699971','023937374'),(134,'Felipe','Aguilar','Ortodoncista','andresaoperez@yahoo.es','1982-12-06','1726550245','Masculino',40,'0987114574','3937548'),(144,'Felipe','Agulera','Periodoncista','andresaoperezpruebas@gmail.com','1998-12-03','1726550241','Masculino',24,'0992855471','3935414');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_cita` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Evento_id_doctor_idx` (`id_doctor`),
  KEY `FK_cita_evento_idx` (`id_cita`),
  CONSTRAINT `FK_cita_evento` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (54,'Cita de Sofia Sanchez','Doctor a cargo Jorge Sanchez','2022-06-13 13:00:00','2022-06-13 14:00:00',104,74),(64,'Cita de Sandra Perez','Doctor a cargo Jorge Sanchez','2022-06-16 13:00:00','2022-06-16 14:00:00',104,84),(74,'Cita de Sofia Sanchez','Doctor a cargo Jorge Sanchez','2022-06-20 15:00:00','2022-06-20 16:00:00',104,94),(84,'Cita de Erik  Salvador','Doctor a cargo Erik Rivadeneira','2022-06-20 15:00:00','2022-06-20 16:00:00',114,104),(94,'Cita de Sandra Perez','Doctor a cargo Erik Rivadeneira','2022-07-07 11:00:00','2022-07-07 12:00:00',114,114),(104,'Cita de Erik  Salvador','Doctor a cargo Jorge Sanchez','2022-07-06 15:00:00','2022-07-06 16:00:00',104,124);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `FK_HistorialPacienteID_idx` (`id_paciente`),
  CONSTRAINT `FK_HistorialPacienteID` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (7,7),(13,13),(14,14);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `CantidadActual` float NOT NULL,
  `CantidadMinima` float NOT NULL,
  `Prioridad` int(11) NOT NULL,
  `CantidadMaxima` float NOT NULL,
  `Medida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_inventario`),
  UNIQUE KEY `InventarioID_UNIQUE` (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (84,'Colgate',1.5,'Pasta dental',50,30,3,60,'paquete'),(94,'OralB',1.25,'Hilo dental',60,30,3,60,'paquete'),(104,'Frest',1.75,'Crema dental',70,35,3,70,'paquete');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Cedula` varchar(10) NOT NULL,
  `NumCelular` varchar(10) NOT NULL,
  `NumFijo` varchar(7) NOT NULL,
  `DirDomicilio` varchar(100) NOT NULL,
  `Genero` varchar(11) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `FechaNac` datetime NOT NULL,
  `Edad` int(3) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `Cedula_UNIQUE` (`Cedula`),
  UNIQUE KEY `NumCelular_UNIQUE` (`NumCelular`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (7,'Sofia','Sanchez','1726550609','098215236','3937378','Tanda','Masculino','sofiasanchez@hotmail.com','2003-01-05 00:00:00',19),(13,'Sandra','Perez','1726550575','0987004834','3937378','Tadnda','Femenino','example@hotmail.com','1972-10-24 00:00:00',49),(14,'Erik ','Salvador','1726550452','0984521237','3937541','Av Republica del salvador Y portugal','Masculino','erik.salvador@gmail.com','1982-03-05 00:00:00',40);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Presupuesto` float NOT NULL,
  `id_historial` int(11) NOT NULL,
  `Abono` float DEFAULT NULL,
  `FormaPago` varchar(45) NOT NULL,
  `Saldo` double NOT NULL,
  `FechaPago` date NOT NULL,
  PRIMARY KEY (`id_tratamiento`),
  UNIQUE KEY `TratamientoID_UNIQUE` (`id_tratamiento`),
  KEY `FK_HistorialID_idx` (`id_historial`),
  CONSTRAINT `FK_HistorialID` FOREIGN KEY (`id_historial`) REFERENCES `historial` (`id_historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `correoElectronico` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `id_doctor` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `correoElectronico_UNIQUE` (`correoElectronico`),
  KEY `FK_User_id_doctor_idx` (`id_doctor`),
  CONSTRAINT `FK_User_id_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'andresao11','Andres','Sanchez','andresaoperez@gmail.com','Admin123456','Administrador',NULL),(44,'j.sanchez','Jorge','Sanchez','jorsao@hotmail.com','1726550153','Doctor',104),(54,'e.rivadeneira','Erik','Rivadeneira','erik.rivadeneira@gmail.com','1726550152','Doctor',114),(64,'f.perez','Felipe','Perez','andresaoperez@hotmail.com','176550651','Doctor',124),(74,'f.aguilar','Felipe','Aguilar','andresaoperez@yahoo.es','1726550245','Doctor',134),(84,'f.agulera','Felipe','Agulera','andresaoperezpruebas@gmail.com','1726550241','Doctor',144);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 22:06:24
