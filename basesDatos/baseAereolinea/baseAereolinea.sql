CREATE DATABASE  IF NOT EXISTS `aereolinea` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aereolinea`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: aereolinea
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avion` (
  `id` int(11) NOT NULL,
  `TipoAvion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`TipoAvion_id`),
  KEY `fk_Avion_TipoAvion1_idx` (`TipoAvion_id`),
  CONSTRAINT `fk_Avion_TipoAvion1` FOREIGN KEY (`TipoAvion_id`) REFERENCES `tipoavion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `Pais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Pais_id`),
  KEY `fk_Ciudad_Pais1_idx` (`Pais_id`),
  CONSTRAINT `fk_Ciudad_Pais1` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Berlín',1),(2,'Buenos Aires',2),(3,'Viena',3),(4,'Brasilia',4),(5,'Pekín',5),(6,'Bogotá',6),(7,'San José',7),(8,'La Habana',8),(9,'Quito',9),(10,'Abu Dabi',10);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Alemania'),(2,'Argentina'),(3,'Austria'),(4,'Brasil'),(5,'China'),(6,'Colombia'),(7,'Costa Rica'),(8,'Cuba'),(9,'Ecuador'),(10,'Emiratos Árabes Unidos');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `Horario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Usuario_id`,`Horario_id`),
  KEY `fk_Reserva_Usuario1_idx` (`Usuario_id`),
  KEY `fk_Reserva_Horario1_idx` (`Horario_id`),
  CONSTRAINT `fk_Reserva_Horario1` FOREIGN KEY (`Horario_id`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(70) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `salida_id` int(11) NOT NULL,
  `destino_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`salida_id`,`destino_id`),
  KEY `fk_Vuelo_Ciudad1_idx` (`salida_id`),
  KEY `fk_Vuelo_Ciudad2_idx` (`destino_id`),
  CONSTRAINT `fk_Vuelo_Ciudad1` FOREIGN KEY (`salida_id`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_Ciudad2` FOREIGN KEY (`destino_id`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,'Quito-Abu Dabi','conozca el lugar mas lujoso','03:10:00',9,10),(2,'Abu Dabi-Quito','simplemente genial','03:10:00',10,9),(3,'Buenos Aires-Viena','una gran ciudad para estar','05:30:00',2,3),(4,'Viena-Buenos Aires','El mejor lugar para vacacionar','04:30:00',3,2),(5,'San José-Bogotá','una ciudad llena de cultura','02:40:00',7,6),(6,'Bogotá-San José','mucha naturaleza','02:40:00',6,7),(7,'Pekín-Quito','el perfecto lugar para vacacionar','01:50:00',5,9),(8,'Quito-Pekín','conozca una nueva cultura','01:50:00',9,5),(9,'Brasilia-San José','gente muy amable','03:20:00',4,7),(10,'San José-Brasilia','viva la experiencia de brazil','03:20:00',7,4);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutaavion`
--

DROP TABLE IF EXISTS `rutaavion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaavion` (
  `Avion_id` int(11) NOT NULL,
  `Ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`Avion_id`,`Ruta_id`),
  KEY `fk_RutaAvion_Avion1_idx` (`Avion_id`),
  KEY `fk_RutaAvion_Ruta1_idx` (`Ruta_id`),
  CONSTRAINT `fk_RutaAvion_Avion1` FOREIGN KEY (`Avion_id`) REFERENCES `avion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RutaAvion_Ruta1` FOREIGN KEY (`Ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaavion`
--

LOCK TABLES `rutaavion` WRITE;
/*!40000 ALTER TABLE `rutaavion` DISABLE KEYS */;
INSERT INTO `rutaavion` VALUES (1,1),(1,4),(2,2),(2,5),(3,3),(3,6),(4,7),(5,8),(6,9),(7,10);
/*!40000 ALTER TABLE `rutaavion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoavion`
--

DROP TABLE IF EXISTS `tipoavion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoavion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `año` int(11) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `pasajeros` varchar(45) DEFAULT NULL,
  `filas` varchar(45) DEFAULT NULL,
  `ascientosfila` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoavion`
--

LOCK TABLES `tipoavion` WRITE;
/*!40000 ALTER TABLE `tipoavion` DISABLE KEYS */;
INSERT INTO `tipoavion` VALUES (1,1995,'TAKA','JACKSON','200','5',40),(2,2000,'SUKY','MALTA','350','4',90),(3,1980,'OLD','NAVY','100','2',50);
/*!40000 ALTER TABLE `tipoavion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiquete`
--

DROP TABLE IF EXISTS `tiquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiquete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` varchar(45) DEFAULT NULL,
  `asiento` varchar(45) DEFAULT NULL,
  `Reserva_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Reserva_id`),
  KEY `fk_Tiquete_Reserva1_idx` (`Reserva_id`),
  CONSTRAINT `fk_Tiquete_Reserva1` FOREIGN KEY (`Reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiquete`
--

LOCK TABLES `tiquete` WRITE;
/*!40000 ALTER TABLE `tiquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(1111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116300616,'David','1234','Morales','davmohi@gmail.com','1996-01-22','me casa','895557664','',1),(333333333,'555','444',NULL,'555@gmail.com',NULL,NULL,'444',NULL,1),(555555555,'555','555',NULL,'555@gmail.com',NULL,NULL,'555',NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` date NOT NULL COMMENT '0=Domingo\n1=Lunes\n2=martes\n3=miercoles\n4=jueves\n5=viernes\n6=sabado',
  `salida` time DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `Ruta_id` int(11) NOT NULL,
  `oferta` tinyint(1) DEFAULT NULL,
  `disponibles` int(11) DEFAULT '5',
  PRIMARY KEY (`id`,`Ruta_id`),
  KEY `fk_Horario_Vuelo1_idx` (`Ruta_id`),
  CONSTRAINT `fk_Horario_Vuelo1` FOREIGN KEY (`Ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (11,'2018-06-10','10:40:00',200,1,0,100),(12,'2018-06-11','09:30:00',200,2,0,100),(13,'2018-06-12','14:00:00',350,3,1,100),(14,'2018-06-13','11:00:00',350,4,1,100),(15,'2018-06-14','08:00:00',400,5,0,100),(16,'2018-06-15','10:00:00',400,6,0,100),(17,'2018-06-16','15:00:00',320,7,1,100),(18,'2018-06-17','09:00:00',320,8,1,100),(19,'2018-06-18','18:00:00',200,9,0,100),(20,'2018-06-19','07:00:00',200,10,0,100);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'aereolinea'
--
/*!50003 DROP PROCEDURE IF EXISTS `buscarVueloIda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarVueloIda`(in dia date,in salida varchar(45),in destino varchar(45),in cant int)
BEGIN
select v.id,r.titulo,r.descripcion,v.dia,v.salida,t.llegada,v.precio,v.oferta,v.disponibles
  from vuelo as v,ruta as r, ciudad as c1,ciudad as c2,
  (
	select v.id, SEC_TO_TIME(sum(time_to_sec(v.salida)+time_to_sec(r.duracion)))as llegada from vuelo v,ruta r where v.Ruta_id=r.id
    group by v.id
  )t
  where c1.id=r.salida_id and c2.id=r.destino_id and r.id=v.Ruta_id and t.id=v.id
  and v.dia=dia and c1.nombre like concat('%',LOWER(salida),'%') 
  and c2.nombre like concat('%',LOWER(destino),'%') and v.disponibles>=cant;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarVueloIdaVuelta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarVueloIdaVuelta`(in ida date,in vuelta date,in salida varchar(45),in destino varchar(45),in cant int)
BEGIN
select v1.id as idIda,v2.id as idVuelta,r.titulo,r.descripcion,
	   v1.dia as fechaIda,v1.salida as salidaIda,t1.llegada as llegadaIda, v1.disponibles as disponiblesIda,
	   v2.dia as fechaVuelta,v2.salida as salidaVuelta,t2.llegada as llegadaVuelta, v2.disponibles as disponiblesVuelta,
       (v1.precio+v2.precio) as costo,v1.oferta
  from vuelo as v1,vuelo v2,ruta as r, ciudad as c1,ciudad as c2,
  (
	select v.id, SEC_TO_TIME(sum(time_to_sec(v.salida)+time_to_sec(r.duracion)))as llegada from vuelo v,ruta r where v.Ruta_id=r.id
    group by v.id
  )t1,
  (
	select v.id, SEC_TO_TIME(sum(time_to_sec(v.salida)+time_to_sec(r.duracion)))as llegada from vuelo v,ruta r where v.Ruta_id=r.id
    group by v.id
  )t2
  where c1.id=r.salida_id and c2.id=r.destino_id and r.id=v1.Ruta_id and t1.id=v1.id and t2.id=v2.id
  and v1.dia=ida and v2.dia=vuelta and c1.nombre like concat('%',LOWER(salida),'%') 
  and c2.nombre like concat('%',LOWER(destino),'%') and v1.disponibles>=cant and v2.disponibles>=cant
  ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarSesion`(in mail varchar(45),in contra varchar(45))
BEGIN
	select * from usuario where correo=mail and contraseña=contra limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarUsuario`(in id int,in nombre varchar(45),in contra varchar(45),
									 in ape varchar(45),in corr varchar(45),in naci date,
                                     in dir varchar(45),in tel varchar(45),in cel varchar(45),
                                     in rol int)
BEGIN
	insert into usuario values(id,nombre,contra,ape,corr,naci,dir,tel,cel,rol);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-25 15:05:45
