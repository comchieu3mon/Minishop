-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: minishop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `date_create` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `type_of_delivery` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `bill_id` int NOT NULL,
  `product_detail_id` int NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `bill_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`bill_id`,`product_detail_id`),
  KEY `FKa7fmjgm9ltv5u1qsxfob0ldn3` (`bill_detail_id`),
  CONSTRAINT `FKa7fmjgm9ltv5u1qsxfob0ldn3` FOREIGN KEY (`bill_detail_id`) REFERENCES `bill` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Man'),(2,'Woman'),(3,'Shoes'),(4,'Jacket'),(5,'Socks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Violet'),(2,'Turquoise'),(3,'Pink'),(4,'Goldenrod'),(5,'Green'),(6,'Goldenrod'),(7,'Aquamarine'),(8,'Maroon');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_description` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Stay ahead of the elements with the Nike Sportswear Tech Pack Jacket. Its durable, crinkle woven fabric shakes off wind and rain without slowing you down. Reflective and woven taping work together','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/b0cccd97-5dc7-4dba-b720-ab7863109ebf/exploration-series-basketball-t-shirt-8dkWTQ.jpg','Men\'s Basketball T-Shirt','100',1),(2,'The Nike Sportswear M65 Jacket combines the classic lines of a military jacket with Tech Pack-inspired detailing. The Nike Repel coating sheds moisture while synthetic Thermore™ insulation helps regulate your temperature so cold, wet weather','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/a2bea778-e663-4e7f-9738-ba2bb0203788/jordan-air-fleece-trousers-VxtGw0.jpg','Men\'s Fleece Trouser','100',1),(3,'The Nike Sportswear M65 Jacket combines the classic lines of a military jacket with Tech Pack-inspired detailing. The Nike Repel coating sheds moisture while synthetic Thermore™ insulation helps regulate your temperature so cold, wet weather','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/6e2be50d-68e8-4e2d-a6fd-771d7271bb84/jordan-air-short-sleeve-crew-k10t9C.jpg','Men\'s Short-Sleeve Crew','120',1),(4,'The Nike Sportswear M65 Jacket combines the classic lines of a military jacket with Tech Pack-inspired detailing. The Nike Repel coating sheds moisture while synthetic Thermore™ insulation helps regulate your temperature so cold, wet weather','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/144e79cd-590c-49e5-9c09-567913d120b6/jordan-flight-warm-up-jacket-tCg9QH.jpg','Men\'s warn-up jackets','150',1),(5,'The Nike Sportswear M65 Jacket combines the classic lines of a military jacket with Tech Pack-inspired detailing. The Nike Repel coating sheds moisture while synthetic Thermore™ insulation helps regulate your temperature so cold, wet weather','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/cb78126d-6abf-4169-826e-7453f971923e/dri-fit-miler-running-top-gJH4Zt.jpg','Men\'s Running Top','125',1),(6,'The Nike Pro Luxe Tights feature fast-drying fabric that helps hide sweat (even on lighter colors) no matter how much you bring the heat. Part of the Nike Luxe line, these luxury-defining leggings have a compressive.','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/70c6121f-e4ec-4057-bf0a-e3788b53f197/swoosh-icon-clash-support-printed-sports-bra-M4tSLd.jpg','Women\'s Medium Support','123',2),(7,'Nike Icon Clash Tiempo','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/69677db9-f9eb-4a1f-808e-e57b1aa97255/icon-clash-tempo-running-shorts-s5qnLs.jpg','Women\'s Running Short','250',2),(8,'The Nike Pro Luxe Tights feature fast-drying fabric that helps hide sweat (even on lighter colors) no matter how much you bring the heat. Part of the Nike Luxe line, these luxury-defining leggings have a compressive.','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/25094ff4-dfea-4410-af94-c9e199bb7af5/icon-clash-fast-running-leggings-sHKJxQ.jpg','Women\'s Running Leggings','200',2),(9,'Nike One Icon Clash','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/e9b3a9c6-4b55-4fa1-97e3-b41d0cfa6b91/one-icon-clash-leggings-5pW1Nv.jpg','Women\'s Leggings','300',2),(10,'The Nike Pro Luxe Tights feature fast-drying fabric that helps hide sweat (even on lighter colors) no matter how much you bring the heat. Part of the Nike Luxe line, these luxury-defining leggings have a compressive.','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/45203076-7b49-42be-b11a-aa6391c2930a/icon-clash-10k-running-top-xn50PV.jpg','Women\'s Running Top','75',2),(11,'Men\'s Running Shoes','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/nbtubci4esz9nofyrdlv/epic-phantom-react-flyknit-running-shoe-J4msqR.jpg','Nike Epic Phantom React Flyknit','120',3),(12,'Men\'s Running Shoes','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/oxxrf1ohfc22hblkf1o8/legend-react-running-shoe-30157X.jpg','Nike Legend React','250',3),(13,'Men\'s Running Shoes','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/e7dad55b-56d7-46ad-8558-aea05042bd0f/react-infinity-run-flyknit-running-shoe-xC1vr3.jpg','Nike React Infinity','1000',3),(14,'Men\'s Running Shoes','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/1738cc7b-1e1f-4f10-bdc0-c52675b38cd0/react-infinity-run-flyknit-running-shoe-ZjGHFz.jpg','Nike Air Force 1','500',3),(15,'Men\'s Running Shoes','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/9c7849e1-d4a3-488c-8479-39583a23a832/air-zoom-pegasus-37-running-shoe-vlzXhM.jpg','Nike React Phantom Legend II','300',3),(16,'Men\'s Training Crew','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/db47e3d0-dff2-4b26-a9a5-578b3b77562c/therma-training-crew-HXLZ7p.jpg','Nike Therma','500',4),(17,'Men\'s Full-Zip Training Hoodie','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/ff4bc4f0-e598-46d9-8d95-4362bf7b3e5a/therma-training-hoodie-nPRfnT.jpg','Nike Sportwear Tech Fleece','550',4),(18,'Men\'s Full-Zip Hoodie','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/ff4bc4f0-e598-46d9-8d95-4362bf7b3e5a/therma-training-hoodie-nPRfnT.jpg','Nike Therma','760',4),(19,'Men\'s Printed Skate Hoodie','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/6172d719-2f0d-4207-a3f4-8e617e9e5b9e/sb-printed-skate-hoodie-m1Z31T.jpg','Nike SB','100',4),(20,'Men\'s Pullover Hoodie','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/25f1db3c-a74b-491b-bcb5-65c36ad04056/team-31-courtside-nba-1-2-zip-sweatshirt-cJrvJ2.jpg','Nike Sportwear','345',4),(21,'Designed for a barefoot feel, the Nike Elite Cushioned Ankle Socks feature sweat-wicking technology and cushioning only where you need it most.','https://c.static-nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/iazjwushgugqwzlo0jzx/everyday-cushioned-training-no-show-socks-R1C77V.jpg','Lebrons Elite','250',5),(22,'Designed for a barefoot feel, the Nike Elite Cushioned Ankle Socks feature sweat-wicking technology and cushioning only where you need it most.','https://c.static-nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/iazjwushgugqwzlo0jzx/everyday-cushioned-training-no-show-socks-R1C77V.jpg','Nike Sportwear Essensial','356',5),(23,'Designed for a barefoot feel, the Nike Elite Cushioned Ankle Socks feature sweat-wicking technology and cushioning only where you need it most.','https://c.static-nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/iazjwushgugqwzlo0jzx/everyday-cushioned-training-no-show-socks-R1C77V.jpg','Nike Racing','50',5),(24,'Designed for a barefoot feel, the Nike Elite Cushioned Ankle Socks feature sweat-wicking technology and cushioning only where you need it most.','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/qck7shu2rmvfdajhcfvt/spark-lightweight-no-show-running-socks-XPJpmR.jpg','Nike Spark Lightweight','8',5),(25,'Designed for a barefoot feel, the Nike Elite Cushioned Ankle Socks feature sweat-wicking technology and cushioning only where you need it most.','https://static.nike.com/a/images/c_limit,w_318,f_auto/t_product_v1/i1-3c4545dd-4e66-47f5-ad81-477e375261b3/snkr-sox-crew-socks-QkqQ2D.jpg','Nike Elite','97',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `product_detail_id` int NOT NULL AUTO_INCREMENT,
  `date_import` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `color_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`product_detail_id`),
  KEY `FK99vj2np1gk1robp8n6htiweii` (`color_id`),
  KEY `FKilxoi77ctyin6jn9robktb16c` (`product_id`),
  KEY `FKcum8u2vfvebmmc4xo8de3k35s` (`size_id`),
  CONSTRAINT `FK99vj2np1gk1robp8n6htiweii` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  CONSTRAINT `FKcum8u2vfvebmmc4xo8de3k35s` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  CONSTRAINT `FKilxoi77ctyin6jn9robktb16c` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (1,'7/15/2020',15,3,3,1),(2,'5/27/2020',5,1,15,1),(3,'8/22/2020',40,7,25,1),(4,'7/18/2020',68,4,5,5),(5,'9/24/2019',98,1,6,3),(6,'2/4/2020',92,2,21,5),(7,'9/21/2020',87,8,5,5),(8,'12/16/2019',55,5,23,3),(9,'2/11/2020',89,5,8,6),(10,'2/14/2020',29,7,13,6),(11,'12/6/2019',21,7,14,1),(12,'11/12/2019',67,5,14,2),(13,'10/21/2019',57,2,11,2),(14,'7/3/2020',12,1,13,1),(15,'5/14/2020',47,3,4,4),(16,'8/7/2020',93,4,3,5),(17,'8/3/2020',49,6,10,1),(18,'1/14/2020',73,2,1,5),(19,'2/19/2020',31,5,17,1),(20,'11/23/2019',100,1,11,2),(21,'12/1/2019',38,1,19,3),(22,'7/22/2020',79,2,12,4),(23,'9/4/2020',74,5,22,2),(24,'11/20/2019',37,1,18,3),(25,'3/27/2020',53,8,11,5),(26,'11/6/2019',60,8,16,6),(27,'2/19/2020',74,2,16,3),(28,'4/11/2020',13,8,7,3),(29,'2/13/2020',65,1,8,2),(30,'12/14/2019',58,5,18,2),(31,'7/2/2020',75,2,8,4),(32,'7/10/2020',17,8,2,3),(33,'3/31/2020',73,5,5,6),(34,'2/11/2020',14,6,21,1),(35,'3/19/2020',99,3,13,1);
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `discountPrice` int NOT NULL,
  `promotion_description` varchar(255) DEFAULT NULL,
  `promotion_end` varchar(255) DEFAULT NULL,
  `promotion_image` varchar(255) DEFAULT NULL,
  `promotion_name` varchar(255) DEFAULT NULL,
  `promotion_start` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,14,'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.','8/17/2020','http://dummyimage.com/x.jpg/5fa2dd/ffffff','ARMOUR Residential REIT, Inc.','8/13/2020'),(2,39,'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.','9/24/2019','http://dummyimage.com/x.png/dddddd/000000','Community Health Systems, Inc.','1/30/2020'),(4,12,'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.','1/4/2020','http://dummyimage.com/x.bmp/cc0000/ffffff','Colonial High Income Municipal Trust','5/12/2020'),(5,43,'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','9/30/2019','http://dummyimage.com/x.bmp/5fa2dd/ffffff','Philip Morris International Inc','1/29/2020'),(6,11,'utate luctus.','4/21/2020','http://dummyimage.com/x.jpg/dddddd/000000','Panhandle Royalty Company','3/19/2020');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_detail`
--

DROP TABLE IF EXISTS `promotion_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_detail` (
  `promotion_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`promotion_id`),
  KEY `FKskn4hq1smglwge63h73j761ox` (`promotion_id`),
  CONSTRAINT `FKb6d4qiw3g81ygrgyj4vw4o9si` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKskn4hq1smglwge63h73j761ox` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_detail`
--

LOCK TABLES `promotion_detail` WRITE;
/*!40000 ALTER TABLE `promotion_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'trockingham0'),(2,'lpepperill1');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'S'),(2,'XL'),(3,'XXL'),(4,'XS'),(5,'L'),(6,'M');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_address` varchar(255) DEFAULT NULL,
  `staff_email` varchar(255) DEFAULT NULL,
  `staff_full_name` varchar(255) DEFAULT NULL,
  `staff_gender` bit(1) DEFAULT NULL,
  `staff_identity_number` varchar(255) DEFAULT NULL,
  `staff_password` varchar(255) DEFAULT NULL,
  `staff_username` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `FK5bbdfuitxii0b63v2v3f0r22x` (`role_id`),
  CONSTRAINT `FK5bbdfuitxii0b63v2v3f0r22x` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'114 ADV','minhduc.itus@gmail.com','Cao Minh Duc',_binary '','123','123','sieng95',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24 19:40:58
