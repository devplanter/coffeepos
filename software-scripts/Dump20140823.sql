CREATE DATABASE  IF NOT EXISTS `coffeepos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coffeepos`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: coffeepos
-- ------------------------------------------------------
-- Server version	5.5.34

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `bill_no` varchar(30) DEFAULT NULL,
  `payment_no` varchar(30) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_discount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `bill_no_UNIQUE` (`bill_no`),
  KEY `FK_Bill_Site_idx` (`site_id`),
  KEY `FK_Bill_Customer_idx` (`cust_id`),
  KEY `FK_Bill_Employee_idx` (`emp_id`),
  KEY `FK_Bill_Status_idx` (`status_id`),
  CONSTRAINT `FK_Bill_Customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Employee` FOREIGN KEY (`emp_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `option_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_Bill_Item_idx` (`bill_id`),
  KEY `FK_Bill_Product_idx` (`product_id`),
  CONSTRAINT `FK_Bill_Item` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_item`
--

LOCK TABLES `bill_item` WRITE;
/*!40000 ALTER TABLE `bill_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  `create_by` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_Category_Site_idx` (`site_id`),
  CONSTRAINT `FK_Category_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  `create_by` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `FK_Group_Site_idx` (`site_id`),
  CONSTRAINT `FK_Group_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,1,'admin',NULL,'Y','N',NULL,NULL,NULL,NULL),(2,1,'user',NULL,'Y','N',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organize`
--

DROP TABLE IF EXISTS `organize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organize` (
  `org_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `slogan` varchar(100) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `logo_url` varchar(150) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `is_delete` char(1) DEFAULT 'N',
  `create_by` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `FK_Organize_Site_idx` (`site_id`),
  CONSTRAINT `FK_Organize_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organize`
--

LOCK TABLES `organize` WRITE;
/*!40000 ALTER TABLE `organize` DISABLE KEYS */;
/*!40000 ALTER TABLE `organize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `payment_no` varchar(30) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `bill_no` int(11) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `card_no` varchar(30) DEFAULT NULL,
  `card_bank` varchar(10) DEFAULT NULL,
  `card_type` varchar(10) DEFAULT NULL,
  `price_amount` float DEFAULT NULL,
  `receive_amount` float DEFAULT NULL,
  `return_amount` float DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_Payment_Site_idx` (`site_id`),
  KEY `FK_Payment_Customer_idx` (`cust_id`),
  KEY `FK_Payment_Employee_idx` (`emp_id`),
  KEY `FK_Payment_Status_idx` (`status_id`),
  CONSTRAINT `FK_Payment_Customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_Employee` FOREIGN KEY (`emp_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_Status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `stock_unit` int(11) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `tag` varchar(200) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_hotsale` char(1) DEFAULT 'N',
  `is_feature` char(1) DEFAULT 'N',
  `is_delete` char(1) DEFAULT 'N',
  `create_by` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_Product_Site_idx` (`site_id`),
  KEY `FK_Product_Category_idx` (`category_id`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'coffeepos',NULL,NULL,'Y','N',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `alive_date` datetime DEFAULT NULL,
  `logout_date` datetime DEFAULT NULL,
  `session_data` text,
  `is_active` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
INSERT INTO `user_session` VALUES (1,1,'37a9eb22b0e2d5bc01b1b3861314f94c','','2014-08-23 12:12:07',NULL,NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020333761396562323262306532643562633031623162333836313331346639346374000561646D696E','Y'),(2,1,'5700f3de88e0acd4091c7278cfa82e50','','2014-08-23 12:32:44',NULL,NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020353730306633646538386530616364343039316337323738636661383265353074000561646D696E','Y'),(3,1,'bff686e68d8e0cdbb6589ec732406c7f','','2014-08-23 12:33:49','2014-08-23 12:33:49',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020626666363836653638643865306364626236353839656337333234303663376674000561646D696E','Y'),(4,1,'113ceac6ba87895326df0cb227f67114','','2014-08-23 12:34:26','2014-08-23 12:34:26',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020313133636561633662613837383935333236646630636232323766363731313474000561646D696E','Y'),(5,1,'ab086ace2a16641a6b7db5c57fb10caa','','2014-08-23 12:34:34','2014-08-23 12:34:34',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020616230383661636532613136363431613662376462356335376662313063616174000561646D696E','Y'),(6,1,'6bef80d0519b2d3d162848f1592b2dcb','','2014-08-23 12:42:41','2014-08-23 12:42:41',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020366265663830643035313962326433643136323834386631353932623264636274000561646D696E','Y'),(7,1,'a5a24f992889c46eafda06ea3f398b70','','2014-08-23 12:44:40','2014-08-23 12:44:40',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020613561323466393932383839633436656166646130366561336633393862373074000561646D696E','Y'),(8,1,'c8932a10e0d3c4ab400358a4b6e2de12','','2014-08-23 12:44:57','2014-08-23 12:44:57',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020633839333261313065306433633461623430303335386134623665326465313274000561646D696E','Y'),(9,1,'04fdab72b70ac68682fabd00c5ee4a2e','','2014-08-23 12:47:30','2014-08-23 12:47:30',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020303466646162373262373061633638363832666162643030633565653461326574000561646D696E','Y'),(10,1,'8bf62a7ae2e040a9803faca1706dbbc4','','2014-08-23 12:47:45','2014-08-23 12:47:45',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020386266363261376165326530343061393830336661636131373036646262633474000561646D696E','Y'),(11,1,'3a0cfee2c18a9f28f95f7b2f3b47cbf8','','2014-08-23 12:49:11','2014-08-23 12:49:11','2014-08-23 12:49:13','ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020336130636665653263313861396632386639356637623266336234376362663874000561646D696E','N'),(12,1,'51fed2a46981c0f62f8f3a6cd3e2db85','','2014-08-23 13:11:44','2014-08-23 13:11:44','2014-08-23 13:11:49','ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020353166656432613436393831633066363266386633613663643365326462383574000561646D696E','N'),(13,1,'8204e04917cc6e374027e61a5fce52f3','','2014-08-23 13:30:42','2014-08-23 13:30:42',NULL,'ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020383230346530343931376363366533373430323765363161356663653532663374000561646D696E','Y'),(14,1,'003d5e58ffdae877c4022f03ddfc8f84','','2014-08-23 13:31:43','2014-08-23 13:31:43','2014-08-23 13:31:48','ACED000573720020636F6D2E64702E636F666665652E656E746974792E53657373696F6E4265616E419DFE7CE7D9872302000849000767726F757049644900067573657249644C000966697273744E616D657400124C6A6176612F6C616E672F537472696E673B4C000967726F75704E616D6571007E00014C00086C6173744E616D6571007E00014C000870617373776F726471007E00014C000973657373696F6E496471007E00014C0008757365724E616D6571007E0001787000000001000000017074000561646D696E7074000431323334740020303033643565353866666461653837376334303232663033646466633866383474000561646D696E','N');
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_delete` char(1) DEFAULT 'N',
  `create_by` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK_Users_Group_idx` (`group_id`),
  KEY `FK_Users_Site_idx` (`site_id`),
  CONSTRAINT `FK_Users_Group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Users_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','1234',NULL,NULL,NULL,1,NULL,NULL,NULL,'Y','N',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2014-08-23 13:47:52
