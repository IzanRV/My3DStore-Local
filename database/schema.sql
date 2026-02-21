-- Base de datos para tienda de impresión 3D (generado desde Crear_BD.sql)
-- Ejecutado en Docker init (docker-entrypoint-initdb.d) o manualmente.
CREATE DATABASE IF NOT EXISTS tienda_3d;
USE tienda_3d;

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (13,2,55,2,'2026-02-21 14:20:24'),(14,2,59,1,'2026-02-21 14:22:49'),(15,2,67,1,'2026-02-21 14:22:51');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,5,55,1,22.50),(2,5,66,1,15.00),(3,5,67,1,15.00),(4,6,63,1,15.00),(5,6,64,1,15.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,52.50,'pending','asdasdasdas','2026-02-21 14:13:32'),(2,2,52.50,'pending','asdasdasdas','2026-02-21 14:14:07'),(3,2,52.50,'pending','asdasdasdas','2026-02-21 14:14:22'),(4,2,52.50,'pending','asdasdasdas','2026-02-21 14:14:25'),(5,2,52.50,'pending','asdasdasdas','2026-02-21 14:16:22'),(6,2,30.00,'pending','asdasdasdas','2026-02-21 14:19:23');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `stl_url` varchar(500) DEFAULT NULL,
  `material` varchar(100) DEFAULT NULL,
  `dim_x` decimal(10,2) DEFAULT NULL COMMENT 'Dimension X en mm',
  `dim_y` decimal(10,2) DEFAULT NULL COMMENT 'Dimension Y en mm',
  `dim_z` decimal(10,2) DEFAULT NULL COMMENT 'Dimension Z en mm',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(255) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL COMMENT 'Color en hexadecimal',
  `logo_url` varchar(500) DEFAULT NULL COMMENT 'Ruta del logo del producto',
  `logo_side` varchar(20) DEFAULT NULL COMMENT 'Lado del logo: front, back, left, right, top, bottom',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (43,'Base para Pico Pi','Carcasa base para Raspberry Pi Pico. Modelo 3D desde Printables.',14.99,'/My3DStore/public/images/printables_1000476_1771330107.png','stl/printables_1000476_Pico_Pi_CaseBase.stl','PLA',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(44,'Snorlax 3D','Figura decorativa de Snorlax. Impresión 3D lista para pintar.',19.99,'/My3DStore/public/images/printables_1000732_1771330041.webp','stl/printables_1000732_snorlax.stl','PLA',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(45,'Corona decorativa','Corona 3D para disfraces o decoración. Modelo OBJ convertido a STL.',9.99,'/My3DStore/public/images/printables_1023542_1771330056.jpg','stl/printables_1023542_crown.obj.stl','PLA',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(46,'Mano derecha articulada','Pieza Hand R para figura articulada. Escala personalizable.',7.50,'/My3DStore/public/images/printables_1303218_1771330052.png','stl/printables_1303218_HandR.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(47,'Pierna derecha articulada','Pieza Leg R para figura articulada. Compatible con sets de partes.',7.50,'/My3DStore/public/images/printables_1303223_1771330093.png','stl/printables_1303223_LegR.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(48,'Mano derecha (modelo 2)','Segunda variante Hand R para articulados. Alta definición.',7.99,'/My3DStore/public/images/printables_1303225_1771330048.png','stl/printables_1303225_HandR.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(49,'Bolsillo Pocket 6','Pieza Pocket6 para complementos o figuras. Diseño modular.',6.99,'/My3DStore/public/images/printables_1303238_1771330099.png','stl/printables_1303238_Pocket6.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(50,'Bota derecha','Pieza Boot R para figura o maqueta. Detalle realista.',8.50,'/My3DStore/public/images/printables_1303244_1771329995.png','stl/printables_1303244_BootR.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(51,'Beatrice Umineko Nendoroid','Figura estilo Nendoroid de Beatrice (Umineko). Pintable.',24.99,'/My3DStore/public/images/printables_1340618_1771330072.jpg','stl/printables_1340618_beatrice umineko nendoroid.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(52,'Calabaza decorativa','Calabaza 3D para Halloween o decoración. Varios tamaños.',11.99,'/My3DStore/public/images/printables_1439311_1771330011.jpg','stl/printables_1439311_pumpkin.stl','Madera',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(53,'Linka','Pieza Link Right Arm para cosplay o figura. Resistente.',12.99,'images/printables_1471971_1771330083.png','stl/printables_1471971_Linkright_arm.stl','Metal',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(54,'Casco Riddell SpeedFlex','Réplica de casco de fútbol americano Riddell SpeedFlex. Decorativo.',29.99,'/My3DStore/public/images/printables_1524413_1771330087.png','stl/printables_1524413_Riddell SpeedFlex Football Helmet.stl','Metal',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(55,'Macetero dragón fantástico','Contenedor con forma de dragón para plantas. Modelo 3D completo.',22.50,'/My3DStore/public/images/printables_1578590_1771330103.webp','stl/printables_1578590_Fantasy Dragon Planter container 3D Print Model STL.stl','Metal',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(56,'Torre del castillo de Gediminas','Maqueta del castillo de Gediminas. Formato 3MF/STL.',18.99,'/My3DStore/public/images/printables_169685_1771330003.png','stl/printables_169685_Gediminas Castle Tower.3MF.stl','Metal',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(57,'Herramienta 3D','Herramienta funcional impresa en 3D. Diseño Printables.',15.99,'/My3DStore/public/images/printables_398506_1771330038.jpg','stl/printables_398506_Tool.stl','Metal',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(58,'Cuerpo de reloj de pared','Cuerpo para reloj de pared. Incluye hueco para mecanismo.',13.99,'/My3DStore/public/images/printables_67421_1771330007.jpeg','stl/printables_67421_Wall_clock_body.stl','Cerámica',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(59,'Soporte de antena izquierdo','Antenna Holder Left. Soporte para antenas o cables.',8.99,'/My3DStore/public/images/printables_769007_1771330069.png','stl/printables_769007_Antenna Holder_Left.stl','Cerámica',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(60,'Base cerebro Iron Man','Base con motivo cerebro para figura Iron Man. Display o colección.',21.99,'/My3DStore/public/images/printables_985355_1771329999.jpg','stl/printables_985355_Ironman_brain_base.stl','Cerámica',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(61,'Cuerno derecho Dovahkiin','Pieza Dovahkiin horn right para cosplay o disfraz.',14.50,'/My3DStore/public/images/printables_985361_1771330078.jpg','stl/printables_985361_dovahkiin_horn_right.stl','Cerámica',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(62,'Base Vegeta','Base para figura de Vegeta. Estilo anime/manga.',16.99,'/My3DStore/public/images/printables_985383_1771330061.jpg','stl/printables_985383_Vegeta_Base.stl','Cerámica',NULL,NULL,NULL,'2026-02-17 12:26:16',NULL,NULL,NULL,NULL),(63,'Pato','Un pato rosa',15.00,'','stl/ai_80a90c5b-6ba1-4236-84b6-490e0fc57d5a_1771674651.stl','PLA',NULL,NULL,NULL,'2026-02-21 11:50:51','izan',NULL,NULL,NULL),(64,'Casa','Mi casa :D',15.00,'','stl/ai_60b1d210-d86f-4aee-9d1c-b50612ebd560_1771675291.stl','PLA',NULL,NULL,NULL,'2026-02-21 12:01:31','izan',NULL,NULL,NULL),(65,'asdads','asdasd',15.00,'','stl/ai_854b7a98-5b3d-4b90-a544-e45499069837_1771676437.stl','PLA',13.00,23.00,45.00,'2026-02-21 12:20:37','izan','#ec4899','','front'),(66,'Logo','Logo arriba',15.00,'','stl/ai_6eba3a3b-a07b-4849-8716-9b74d86adae5_1771676490.stl','PLA',60.00,10.00,45.00,'2026-02-21 12:21:30','izan','#003d7a','images/logos/logo_1771676490_41dbd8ed.png','top'),(67,'Pato 2','Pato verde',15.00,'','stl/ai_80a90c5b-6ba1-4236-84b6-490e0fc57d5a_1771674651.stl','PLA',10.00,85.00,45.00,'2026-02-21 13:52:56','izan','#10b981','','front');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_review` (`product_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text,
  `phone` varchar(50) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@tienda3d.com','$2y$10$hLAOQzjCk2oMNl3EZxFGvuin.ykJUzDZwwkgsLAu9Z.dnyoTG4.mW','Administrador',NULL,NULL,'admin','2026-02-04 09:27:18'),(2,'izan@gmail.com','$2y$10$k9MplQpTuWEQn22U/eXaMe2NP.hT0k2KyvcdGExHzH7psA45YHJ5q','izan','asdasdasdas','688687687','user','2026-02-04 09:33:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
