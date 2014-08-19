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
  CONSTRAINT `FK_Bill_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Employee` FOREIGN KEY (`emp_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  CONSTRAINT `FK_Bill_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Bill_Item` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
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
  CONSTRAINT `FK_Payment_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_Customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Payment_Employee` FOREIGN KEY (`emp_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  CONSTRAINT `FK_Product_Site` FOREIGN KEY (`site_id`) REFERENCES `site` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
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
INSERT INTO `users` VALUES (1,NULL,'admin','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','N',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2014-08-19 21:44:18
