-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: huella_carbono
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `num_recomendacion` int(11) NOT NULL,
  `cod_usuario` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`num_recomendacion`,`cod_usuario`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`num_recomendacion`) REFERENCES `recomendacion` (`num`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1,'1000','activada','2017-11-15'),(2,'1000','activada','2017-11-15'),(3,'1000','activada','2017-11-15'),(5,'1000','activada','2017-11-15'),(6,'1000','activada','2017-11-15'),(8,'1000','activada','2017-11-15');
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `emisionPromedio` double NOT NULL,
  `pais` varchar(20) NOT NULL,
  `poblacion` int(11) NOT NULL,
  `area` double NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('1','cali',0.08,'colombia',2401000,619),('10','neiva',0.05,'colombia',345806,1553),('11','armenia',0.05,'colombia',299712,650),('12','mexico df',0.69,'mexico',8918653,1495),('13','buenos aires',0.44,'argentina',2890151,203),('14','rio de janeiro',0.38,'brasil',6476631,1182),('15','ibague',0.06,'colombia',564077,1439),('2','bogota',0.25,'colombia',8081000,1775),('3','medellin',0.11,'colombia',2464000,382),('4','barranquilla',0.09,'colombia',1218000,154),('5','cartagena',0.08,'colombia',971592,609.1),('6','bucaramanga\n',0.07,'colombia',528575,162),('7','cucuta',0.08,'\ncolombia',650011,1176),('8','santa marta',0.06,'\ncolombia',499257,2392.35),('9','pasto',0.06,'colombia',450815,1181);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumo` (
  `cod_consumo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` varchar(30) NOT NULL,
  `cod_electro` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `horasdeUso` int(11) NOT NULL,
  `kg_co2` double DEFAULT NULL,
  PRIMARY KEY (`cod_consumo`,`cod_usuario`),
  KEY `cod_electro_idx` (`cod_electro`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `cod_electro` FOREIGN KEY (`cod_electro`) REFERENCES `electrodomestico` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18035 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
INSERT INTO `consumo` VALUES (18006,'1004','e0003','2017-02-01',6,2.49),(18007,'1003','e0004','2017-04-11',7,2.94),(18008,'1003','e0005','2017-04-30',1,5.73),(18009,'1011','e0006','2017-06-11',5,33.25),(18033,'1000','e0001','2017-11-15',12,8.921),(18034,'1000','e0006','2017-11-15',5,33.25);
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electrodomestico`
--

DROP TABLE IF EXISTS `electrodomestico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electrodomestico` (
  `codigo` varchar(30) NOT NULL,
  `nombreGenerico` varchar(20) NOT NULL,
  `nombreReal` varchar(20) NOT NULL,
  `watts` double NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `factor_kgc02` double NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electrodomestico`
--

LOCK TABLES `electrodomestico` WRITE;
/*!40000 ALTER TABLE `electrodomestico` DISABLE KEYS */;
INSERT INTO `electrodomestico` VALUES ('e0001','nevera','\nRS7528THCSL',210,'Samsung','nevera de 10 pies',0.00354),('e0002','nevera','GSX96',250,'LG','nevera de 12 pies',0.00384),('e0003','televisor','L9',130,'Toshiba','smart tv',0.0032),('e0004','portatil','\nthinkpad',150,'Lienovo','computadora portatil',0.0028),('e0005','lavadora','\nRim-234',1350,'Electrolux','lavadora',0.00425),('e0006','aire acondicionado','\nTx-2000',1330,'Samsung','aire acondicionado',0.005),('e0007','plancha','\nTx-2000',1000,'oster','plancha para ropa',0.0039),('e0008','wii','nintendo wii',120,'nintendo','consola de videojuegos',0.0032);
/*!40000 ALTER TABLE `electrodomestico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta`
--

DROP TABLE IF EXISTS `propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propuesta` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` varchar(30) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `co2` varchar(20) NOT NULL,
  `nombreEs` varchar(20) NOT NULL,
  `nombrelg` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fuente` varchar(20) NOT NULL,
  PRIMARY KEY (`num`,`cod_usuario`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `propuesta_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta`
--

LOCK TABLES `propuesta` WRITE;
/*!40000 ALTER TABLE `propuesta` DISABLE KEYS */;
INSERT INTO `propuesta` VALUES (1,'1007','tipo','co2','nombreEs','nombrelg','descripcion','fuente');
/*!40000 ALTER TABLE `propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendacion`
--

DROP TABLE IF EXISTS `recomendacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recomendacion` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `consumo_kg_co2` double NOT NULL,
  `tipo` enum('consumo','viaje') DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendacion`
--

LOCK TABLES `recomendacion` WRITE;
/*!40000 ALTER TABLE `recomendacion` DISABLE KEYS */;
INSERT INTO `recomendacion` VALUES (1,'Ahorra energia',3,'consumo'),(2,'Camina o pedalea',20,'viaje'),(3,'Evita dejar aparatos electronicos enchufados',8,'consumo'),(4,'Manten tu automovil en buen estado',60,'viaje'),(5,'Ahorra agua',13,'consumo'),(6,'Ahorra energia',21,'consumo'),(7,'Usa transporte publico',100,'viaje'),(8,'Recicla y reutiliza',34,'consumo'),(10,'Compra energia renovable',55,'consumo'),(11,'usa vehiculos con motor mas optimo',40,'viaje'),(12,'comparte el vehiculo con otras personas',80,'viaje');
/*!40000 ALTER TABLE `recomendacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporte` (
  `codigo` varchar(30) NOT NULL,
  `nombreGenerico` varchar(20) NOT NULL,
  `nombreReal` varchar(20) DEFAULT NULL,
  `factor_kgco2` double NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `combustible` varchar(20) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cilindraje` double NOT NULL,
  `modelo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` VALUES ('a0001','carro','toyota prado',0.50935,'toyota','gasolina','carro 4x4',2,2012),('a0002','moto','pulsar 125',0.24544,'pulsar','gasolina','moto 4 tiempos',0.125,2017),('a0003','bus','Transporte publico',0.40935,'Bus','gasolina','transporte publico',6,2015),('a0004','carro','Mazda 3',0.35555,'mazda','gasolina','automovil',1.8,2016),('a0005','bici','todoterreno',0.013333,'huffy','no usa','bicicleta todoterreno',0,2013),('a0006','taxi','servicio publico',0.30935,'taxi','gasolina','servicio publico',1.2,2015),('a0007','moto','yamaha 115',0.22333,'yamaha','gasolina','moto 4 tiempos',0.115,2001);
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `profesion` varchar(20) DEFAULT NULL,
  `contrasena` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `cod_ciudad` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cod_ciudad_idx` (`cod_ciudad`),
  CONSTRAINT `cod_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('1000','juan','cardenas','1990-10-10','Dentista','1234','juan.cardenas@aol.com','1'),('1001','pedro','perez','1970-03-30','Mecanico','1234','pedro.perez@aol.com','5'),('1002','sara','mora','1980-09-15','Contadora','1234','sara.mora@aol.com','11'),('1003','maria','parra','1991-12-12','Dentista','\r1234','maria.parra@aol.com','8'),('1004','juan','bravo','1982-06-03','Ingeniero','\r1234','juan.quinonez@aol.com','5'),('1005','laura','cardenas','1990-10-10','secretaria','1234','laura.cardenas@aol.com','9'),('1006','nazairo','asis','1977-04-23','futbolista','1234','fenomeno@aol.com','14'),('1007','isabella','gomez','1993-12-10','Estudiante','1234','isa.castano@aol.com','1'),('1008','isabel','silva','1997-01-09','Estudiante','1234','isa.silva@aol.com','13'),('1009','carlos','beltran','1989-09-21','periodista','1234','carlos.beltran@aol.com','12'),('1010','marcos','guerrero','1993-12-10','Abogado','1234','marcos.castano@aol.com','3'),('1011','paola','vera','1987-08-08','Ama de casa','1234','paola.vera@aol.com','12'),('1012','aura','rodriguez','1997-04-10','estudiante','1234','aura.munoz@aol.com','2'),('1013','edgar','rios','1965-12-24','Maestro','1234','edgar.rios@aol.com','10'),('1014','Diego','Maradona','1960-11-10','musico','1234','diego.maradona@aol.com','5');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaje` (
  `cod_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` varchar(30) NOT NULL,
  `cod_transporte` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `kilometros` double NOT NULL,
  `kg_co2` double NOT NULL,
  PRIMARY KEY (`cod_viaje`,`cod_usuario`),
  KEY `cod_usuario` (`cod_usuario`),
  KEY `cod_transporte` (`cod_transporte`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`codigo`),
  CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`cod_transporte`) REFERENCES `transporte` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (6,'1003','a0002','2017-01-21',40,9.81),(7,'1003','a0006','2017-03-21',44,13.6),(8,'1003','a0005','2017-05-30',21,0.27),(28,'1000','a0001','2017-11-15',50,25.467);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16  7:02:15
