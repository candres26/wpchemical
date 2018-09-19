-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: wp_dbtest1
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `qm_document`
--

DROP TABLE IF EXISTS `qm_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_document` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_document`
--

LOCK TABLES `qm_document` WRITE;
/*!40000 ALTER TABLE `qm_document` DISABLE KEYS */;
INSERT INTO `qm_document` VALUES (1,'Registro Civil','Descripción registro'),(2,'Cedula','Documento utilizado para distinguir'),(3,'Pasaporte','Descripción del pasaporte');
/*!40000 ALTER TABLE `qm_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_membership`
--

DROP TABLE IF EXISTS `qm_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_membership` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(10,0) unsigned NOT NULL,
  `term` int(4) NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_membership`
--

LOCK TABLES `qm_membership` WRITE;
/*!40000 ALTER TABLE `qm_membership` DISABLE KEYS */;
INSERT INTO `qm_membership` VALUES (1,'Plan 3','Descripción completa de plan 3',140000,60,'1'),(2,'Plan 4','Descripción completísima de Plan 4 :)',95000,30,'1');
/*!40000 ALTER TABLE `qm_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_membership_document`
--

DROP TABLE IF EXISTS `qm_membership_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_membership_document` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `membership_id` int(4) unsigned NOT NULL,
  `document_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `membership_id` (`membership_id`),
  KEY `documents_id` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_membership_document`
--

LOCK TABLES `qm_membership_document` WRITE;
/*!40000 ALTER TABLE `qm_membership_document` DISABLE KEYS */;
INSERT INTO `qm_membership_document` VALUES (1,0,1),(2,0,3),(3,0,3),(4,0,1),(5,0,2),(6,1,2),(7,1,3),(8,2,3),(9,2,1),(10,2,2);
/*!40000 ALTER TABLE `qm_membership_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_membership_tag`
--

DROP TABLE IF EXISTS `qm_membership_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_membership_tag` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `membership_id` int(4) unsigned NOT NULL,
  `tag_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `membership_id` (`membership_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_membership_tag`
--

LOCK TABLES `qm_membership_tag` WRITE;
/*!40000 ALTER TABLE `qm_membership_tag` DISABLE KEYS */;
INSERT INTO `qm_membership_tag` VALUES (1,0,10),(2,0,2),(3,0,1),(4,0,11),(5,0,4),(6,0,3),(7,0,13),(8,1,11),(9,1,1),(10,1,13),(11,2,13),(12,2,1),(13,2,2),(14,2,10),(15,2,11);
/*!40000 ALTER TABLE `qm_membership_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_request`
--

DROP TABLE IF EXISTS `qm_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(8) unsigned NOT NULL,
  `membership_id` int(4) unsigned NOT NULL,
  `payment_option` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `create_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`),
  KEY `membership_id` (`membership_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_request`
--

LOCK TABLES `qm_request` WRITE;
/*!40000 ALTER TABLE `qm_request` DISABLE KEYS */;
INSERT INTO `qm_request` VALUES (1,4,1,'1','0000-00-00','0000-00-00','1','1536427600-2466'),(2,5,2,'1','2018-09-08','2018-10-08','1','1539020858-2712'),(3,6,1,'#','2018-09-08','2018-10-08','1','1539021964-4097');
/*!40000 ALTER TABLE `qm_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_request_document`
--

DROP TABLE IF EXISTS `qm_request_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_request_document` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `document_id` int(4) unsigned NOT NULL,
  `url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_request_document`
--

LOCK TABLES `qm_request_document` WRITE;
/*!40000 ALTER TABLE `qm_request_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm_request_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_tag`
--

DROP TABLE IF EXISTS `qm_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_tag` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_tag`
--

LOCK TABLES `qm_tag` WRITE;
/*!40000 ALTER TABLE `qm_tag` DISABLE KEYS */;
INSERT INTO `qm_tag` VALUES (1,'foo','bar'),(2,'plan1 ','descripcion plan 1'),(3,'Año 1','Año nuevo descripción'),(4,'Año 2','Descripción Año 2'),(7,'adsas','adasdasd'),(8,'efsdfs','sdfsdfsdf'),(9,'asdsad','asdasdsadpoiklpp'),(10,'sdvsdvsdv','sadcsdsdcsdcccc'),(11,'sfsfsdf','ililkujmyh'),(12,'sdfdfs','sdfdssdfs'),(13,'adasczxc','czczxczxc'),(14,'gfbbfbnnbb','bfgvgbvbvcbtnmyuyt ht hth rtthytyjntfvs sv sdv rgtbrh poipo hyjmhjm ');
/*!40000 ALTER TABLE `qm_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm_user`
--

DROP TABLE IF EXISTS `qm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qm_user` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `state` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm_user`
--

LOCK TABLES `qm_user` WRITE;
/*!40000 ALTER TABLE `qm_user` DISABLE KEYS */;
INSERT INTO `qm_user` VALUES (1,'Andres','contre','contean@hotmail.com','1'),(2,'camilo','reyes','camrey@gmail.com','1'),(3,'','','','1'),(4,'Andres','Rengifo','rengifoan@gmail.com','1'),(5,'Ernesto','Arias','erarias@hotmail.com','1'),(6,'','','','1');
/*!40000 ALTER TABLE `qm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_commentmeta`
--

DROP TABLE IF EXISTS `shr_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_commentmeta`
--

LOCK TABLES `shr_commentmeta` WRITE;
/*!40000 ALTER TABLE `shr_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_comments`
--

DROP TABLE IF EXISTS `shr_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_comments`
--

LOCK TABLES `shr_comments` WRITE;
/*!40000 ALTER TABLE `shr_comments` DISABLE KEYS */;
INSERT INTO `shr_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2018-06-14 14:24:23','2018-06-14 14:24:23','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0),(2,27,'@todopoderoso','karlosareyes@gmail.com','','::1','2018-06-18 13:21:28','2018-06-18 13:21:28','Excelente contenido. Bravo',0,'1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36','',0,1);
/*!40000 ALTER TABLE `shr_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_eventos`
--

DROP TABLE IF EXISTS `shr_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_eventos` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_evento` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hora_evento` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lugar_evento` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fecha_evento` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_eventos`
--

LOCK TABLES `shr_eventos` WRITE;
/*!40000 ALTER TABLE `shr_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_links`
--

DROP TABLE IF EXISTS `shr_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_links`
--

LOCK TABLES `shr_links` WRITE;
/*!40000 ALTER TABLE `shr_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_options`
--

DROP TABLE IF EXISTS `shr_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1479 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_options`
--

LOCK TABLES `shr_options` WRITE;
/*!40000 ALTER TABLE `shr_options` DISABLE KEYS */;
INSERT INTO `shr_options` VALUES (1,'siteurl','http://localhost/serverdev/testing-wp/siteone','yes'),(2,'home','http://localhost/serverdev/testing-wp/siteone','yes'),(3,'blogname','Site One','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','1','yes'),(6,'admin_email','karlosareyes@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/index.php/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:89:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:57:\"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:45:\"index.php/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:54:\"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:49:\"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:30:\"index.php/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:42:\"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:24:\"index.php/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:55:\"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:50:\"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:31:\"index.php/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:43:\"index.php/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:25:\"index.php/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:1:{i:2;s:49:\"wp-membership-chemical/wp-membership-chemical.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','-5','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','a:4:{i:0;s:87:\"/var/www/html/serverdev/testing-wp/siteone/wp-content/themes/twentyseventeen/footer.php\";i:1;s:87:\"/var/www/html/serverdev/testing-wp/siteone/wp-content/themes/twentyseventeen/header.php\";i:2;s:86:\"/var/www/html/serverdev/testing-wp/siteone/wp-content/themes/twentyseventeen/style.css\";i:3;s:0:\"\";}','no'),(40,'template','asquimco-theme','yes'),(41,'stylesheet','asquimco-theme','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:5:{i:2;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:4;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:5;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'wp_page_for_privacy_policy','3','yes'),(92,'initial_db_version','38590','yes'),(93,'shr_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(94,'fresh_site','0','yes'),(95,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(100,'sidebars_widgets','a:7:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:6:\"text-4\";i:3;s:6:\"text-5\";}s:6:\"evento\";a:0:{}s:9:\"actividad\";a:0:{}s:5:\"barra\";a:0:{}s:13:\"transparencia\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(101,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'cron','a:6:{i:1536431065;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1536459865;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1536503131;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1536503132;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1536505840;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(111,'theme_mods_twentyseventeen','a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536273859;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:6:\"text-4\";i:3;s:6:\"text-5\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}s:18:\"nav_menu_locations\";a:0:{}}','yes'),(125,'can_compress_scripts','0','no'),(151,'WPLANG','es_CO','yes'),(152,'new_admin_email','karlosareyes@gmail.com','yes'),(207,'category_children','a:0:{}','yes'),(215,'_transient_twentyseventeen_categories','2','yes'),(219,'current_theme','ASQUIMCO-theme','yes'),(220,'theme_mods_twentyfifteen','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536272605;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:6:\"text-4\";i:3;s:6:\"text-5\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(221,'theme_switched','','yes'),(230,'recently_activated','a:0:{}','yes'),(501,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"karlosareyes@gmail.com\";s:7:\"version\";s:5:\"4.9.8\";s:9:\"timestamp\";i:1533267993;}','no'),(810,'pms_settings','a:4:{s:7:\"general\";a:1:{s:11:\"use_pms_css\";i:1;}s:8:\"payments\";a:3:{s:8:\"currency\";s:3:\"USD\";s:16:\"active_pay_gates\";a:1:{i:0;s:15:\"paypal_standard\";}s:23:\"default_payment_gateway\";s:15:\"paypal_standard\";}s:8:\"messages\";a:2:{s:10:\"logged_out\";s:43:\"You must be logged in to view this content.\";s:11:\"non_members\";s:53:\"This content is restricted for your membership level.\";}s:6:\"emails\";a:10:{s:15:\"email-from-name\";s:8:\"Site One\";s:16:\"email-from-email\";s:22:\"karlosareyes@gmail.com\";s:20:\"register_sub_subject\";s:22:\"You have a new account\";s:20:\"activate_sub_subject\";s:31:\"Your Subscription is now active\";s:18:\"cancel_sub_subject\";s:35:\"Your Subscription has been canceled\";s:19:\"expired_sub_subject\";s:29:\"Your Subscription has expired\";s:12:\"register_sub\";s:75:\"Congratulations {{display_name}}! You have successfully created an account!\";s:12:\"activate_sub\";s:99:\"Congratulations {{display_name}}! The \"{{subscription_name}}\" plan has been successfully activated.\";s:10:\"cancel_sub\";s:75:\"Hello {{display_name}}, The \"{{subscription_name}}\" plan has been canceled.\";s:11:\"expired_sub\";s:68:\"Hello {{display_name}},The \"{{subscription_name}}\" plan has expired.\";}}','yes'),(811,'pms_version','1.7.4','yes'),(861,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"es_CO\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1536416755;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}','no'),(1068,'theme_mods_asquimco-theme','a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536272561;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:6:\"text-4\";i:3;s:6:\"text-5\";}s:6:\"evento\";a:0:{}s:9:\"actividad\";a:0:{}s:5:\"barra\";a:0:{}s:13:\"transparencia\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}','yes'),(1070,'theme_switched_via_customizer','','yes'),(1071,'customize_stashed_theme_mods','a:0:{}','no'),(1072,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1536414646;s:7:\"checked\";a:4:{s:14:\"asquimco-theme\";s:3:\"1.0\";s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),(1080,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1536414646;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:37:\"eventos-asquimco/eventos-asquimco.php\";s:3:\"1.0\";s:45:\"social-feed-asquimco/social-feed-asquimco.php\";s:3:\"1.0\";s:9:\"hello.php\";s:3:\"1.7\";s:49:\"wp-membership-chemical/wp-membership-chemical.php\";s:5:\"1.0.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),(1300,'_site_transient_timeout_browser_6a356487460bec0330715c878bc279a2','1536471303','no'),(1301,'_site_transient_browser_6a356487460bec0330715c878bc279a2','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"68.0.3440.106\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(1402,'_site_transient_timeout_browser_c725707436ffb8256b2bbf7bc3ade4e9','1536846632','no'),(1403,'_site_transient_browser_c725707436ffb8256b2bbf7bc3ade4e9','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"69.0.3497.81\";s:8:\"platform\";s:5:\"Linux\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(1420,'_transient_is_multi_author','0','yes'),(1427,'theme_mods_twentysixteen','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536247186;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:6:\"text-4\";i:3;s:6:\"text-5\";}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(1473,'_site_transient_timeout_theme_roots','1536418555','no'),(1474,'_site_transient_theme_roots','a:4:{s:14:\"asquimco-theme\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no');
/*!40000 ALTER TABLE `shr_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_pms_member_subscriptionmeta`
--

DROP TABLE IF EXISTS `shr_pms_member_subscriptionmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_pms_member_subscriptionmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_subscription_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `member_subscription_id` (`member_subscription_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_pms_member_subscriptionmeta`
--

LOCK TABLES `shr_pms_member_subscriptionmeta` WRITE;
/*!40000 ALTER TABLE `shr_pms_member_subscriptionmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_pms_member_subscriptionmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_pms_member_subscriptions`
--

DROP TABLE IF EXISTS `shr_pms_member_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_pms_member_subscriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `subscription_plan_id` bigint(20) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `payment_profile_id` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `payment_gateway` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_amount` float NOT NULL,
  `billing_duration` int(10) NOT NULL,
  `billing_duration_unit` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_cycles` int(10) NOT NULL,
  `billing_next_payment` datetime DEFAULT NULL,
  `billing_last_payment` datetime DEFAULT NULL,
  `trial_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subscription_plan_id` (`subscription_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_pms_member_subscriptions`
--

LOCK TABLES `shr_pms_member_subscriptions` WRITE;
/*!40000 ALTER TABLE `shr_pms_member_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_pms_member_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_pms_paymentmeta`
--

DROP TABLE IF EXISTS `shr_pms_paymentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_pms_paymentmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_id` (`payment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_pms_paymentmeta`
--

LOCK TABLES `shr_pms_paymentmeta` WRITE;
/*!40000 ALTER TABLE `shr_pms_paymentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_pms_paymentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_pms_payments`
--

DROP TABLE IF EXISTS `shr_pms_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_pms_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `subscription_plan_id` bigint(20) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `amount` float NOT NULL,
  `payment_gateway` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `currency` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `profile_id` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `logs` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip_address` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discount_code` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_pms_payments`
--

LOCK TABLES `shr_pms_payments` WRITE;
/*!40000 ALTER TABLE `shr_pms_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_pms_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_postmeta`
--

DROP TABLE IF EXISTS `shr_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_postmeta`
--

LOCK TABLES `shr_postmeta` WRITE;
/*!40000 ALTER TABLE `shr_postmeta` DISABLE KEYS */;
INSERT INTO `shr_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(34,17,'_edit_last','1'),(35,17,'_edit_lock','1529295993:1'),(38,19,'_edit_last','1'),(39,19,'_edit_lock','1529296673:1'),(42,21,'_edit_last','1'),(43,21,'_edit_lock','1529296902:1'),(46,23,'_edit_last','1'),(47,23,'_edit_lock','1529297295:1'),(50,25,'_edit_last','1'),(51,25,'_edit_lock','1529324261:1'),(54,27,'_edit_last','1'),(55,27,'_edit_lock','1529326723:1'),(56,44,'_edit_last','1'),(57,44,'_edit_lock','1533934858:1'),(60,49,'_wp_trash_meta_status','publish'),(61,49,'_wp_trash_meta_time','1534253936'),(62,54,'_edit_last','1'),(63,54,'_edit_lock','1535985347:1');
/*!40000 ALTER TABLE `shr_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_posts`
--

DROP TABLE IF EXISTS `shr_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_posts`
--

LOCK TABLES `shr_posts` WRITE;
/*!40000 ALTER TABLE `shr_posts` DISABLE KEYS */;
INSERT INTO `shr_posts` VALUES (1,1,'2018-06-14 14:24:23','2018-06-14 14:24:23','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2018-06-14 14:24:23','2018-06-14 14:24:23','',0,'http://localhost/serverdev/testing-wp/siteone/?p=1',0,'post','',1),(2,1,'2018-06-14 14:24:23','2018-06-14 14:24:23','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/serverdev/testing-wp/siteone/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2018-06-14 14:24:23','2018-06-14 14:24:23','',0,'http://localhost/serverdev/testing-wp/siteone/?page_id=2',0,'page','',0),(3,1,'2018-06-14 14:24:23','2018-06-14 14:24:23','<h2>Who we are</h2><p>Our website address is: http://localhost/serverdev/testing-wp/siteone.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracing your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>','Privacy Policy','','draft','closed','open','','privacy-policy','','','2018-06-14 14:24:23','2018-06-14 14:24:23','',0,'http://localhost/serverdev/testing-wp/siteone/?page_id=3',0,'page','',0),(17,1,'2018-06-18 04:05:01','2018-06-18 04:05:01','<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n<h3>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n<h3>1914 translation by H. Rackham</h3>\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n<h3>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n<h3>1914 translation by H. Rackham</h3>\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"','CSS GridLayout','','publish','open','open','','css-gridlayout','','','2018-06-18 04:05:01','2018-06-18 04:05:01','',0,'http://localhost/serverdev/testing-wp/siteone/?p=17',0,'post','',0),(18,1,'2018-06-18 04:05:01','2018-06-18 04:05:01','<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n<h3>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n<h3>1914 translation by H. Rackham</h3>\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n<h3>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n<h3>1914 translation by H. Rackham</h3>\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"','CSS GridLayout','','inherit','closed','closed','','17-revision-v1','','','2018-06-18 04:05:01','2018-06-18 04:05:01','',17,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/17-revision-v1/',0,'revision','',0),(19,1,'2018-06-18 04:30:40','2018-06-18 04:30:40','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin orci libero, dapibus feugiat imperdiet at, hendrerit at lectus. In hac habitasse platea dictumst. Pellentesque sagittis arcu et sagittis dapibus. Pellentesque pharetra enim ullamcorper vehicula sodales. Cras accumsan quam tristique est cursus pulvinar. Praesent semper erat condimentum urna semper laoreet. Proin accumsan eros porta elit dapibus, vel commodo dui molestie. Praesent sed quam nec libero porttitor ullamcorper. Donec mauris ipsum, hendrerit eu est sit amet, venenatis varius tortor. Ut pulvinar eleifend congue.\r\n\r\nPraesent a arcu nisi. Nam sed velit est. Praesent orci velit, pretium auctor tristique quis, volutpat lacinia orci. Mauris sagittis, tortor a sollicitudin cursus, risus eros mattis metus, eget sollicitudin tellus ex ac mauris. Proin ut vulputate felis. Proin odio massa, suscipit a lobortis sit amet, gravida quis ex. Nullam at massa ornare odio iaculis aliquam eu eu lacus. Nulla suscipit velit commodo lorem dignissim, ac lobortis ligula convallis. Nulla metus eros, dapibus id elit sed, accumsan vulputate lorem. Pellentesque placerat tortor laoreet lobortis lacinia. Praesent nec dolor condimentum, fermentum dolor in, sagittis nisi. Nulla dapibus magna semper scelerisque blandit.\r\n\r\nDuis ligula diam, mollis quis nisl sed, fringilla imperdiet augue. Phasellus euismod pretium mi, ac mollis orci venenatis vel. Nulla gravida risus at aliquet hendrerit. Maecenas feugiat nisi at nibh pulvinar porttitor. Vestibulum sollicitudin mollis vulputate. In hac habitasse platea dictumst. Nam ut nulla tortor. Nullam in ornare est. Nullam posuere fringilla mauris id aliquet. Nunc nunc mi, molestie ac cursus et, feugiat vel sapien. Nulla auctor sapien ac iaculis pellentesque. Fusce consectetur felis vitae enim sagittis, nec finibus dui eleifend. Nam pharetra mi a ullamcorper rhoncus.\r\n\r\nVestibulum congue non mauris ac imperdiet. Morbi ut orci at nisl placerat blandit feugiat sit amet tortor. Praesent imperdiet ultrices ante a aliquet. Nunc et libero ante. Nulla felis tortor, fermentum nec dui sed, lacinia congue dui. Donec lorem arcu, rutrum a ultrices id, imperdiet et arcu. In commodo et mi sed imperdiet. Ut quis elit fermentum, scelerisque dolor vitae, venenatis leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas venenatis et massa quis semper. Proin et malesuada magna. Pellentesque ac sagittis libero.\r\n\r\nInteger venenatis dui cursus, porttitor augue ut, rutrum purus. Integer sed neque condimentum, lacinia tortor vel, pretium est. Donec pulvinar augue tortor. Maecenas a risus vitae elit facilisis rhoncus. Proin ut nulla congue neque iaculis dictum et in sapien. Phasellus sagittis malesuada vestibulum. Nam sit amet magna sollicitudin, dapibus enim in, blandit odio. Suspendisse commodo lorem diam, sit amet ultricies felis facilisis eu. Duis viverra purus neque, eget mollis tellus semper eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nInteger mollis sapien lobortis, gravida sapien sed, congue velit. Nunc id dictum felis. Quisque at varius urna. Vivamus convallis urna vitae urna fringilla, ac scelerisque nulla tristique. Ut at euismod ante. Curabitur pharetra venenatis diam vel dapibus. Quisque elementum rutrum diam. Integer nec fermentum quam. Nunc augue ex, maximus sit amet nibh nec, sollicitudin malesuada tellus. Pellentesque sed elit orci.\r\n\r\nEtiam laoreet enim in nulla facilisis, vitae maximus justo ullamcorper. Nulla sed lorem id est mattis pulvinar non a sapien. Morbi sodales velit non lorem consequat porttitor. Cras non est mollis, tempus lacus nec, rutrum augue. Pellentesque rutrum vitae neque ac elementum. Phasellus leo dui, consequat sit amet ornare id, fringilla id nulla. Aliquam finibus in enim at ultricies. Quisque id nibh eros. Duis congue erat nec ipsum rutrum, a sagittis nisl venenatis. Donec pulvinar molestie dolor quis euismod. Nam quis elit vitae nulla tristique imperdiet lobortis vitae elit. Maecenas placerat fermentum ligula et imperdiet. Nam et urna vehicula, scelerisque neque vitae, auctor ex.','Programación Orientada a Objetos en PHP','','publish','open','open','','programacion-orientada-a-objetos-en-php','','','2018-06-18 04:30:40','2018-06-18 04:30:40','',0,'http://localhost/serverdev/testing-wp/siteone/?p=19',0,'post','',0),(20,1,'2018-06-18 04:30:40','2018-06-18 04:30:40','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin orci libero, dapibus feugiat imperdiet at, hendrerit at lectus. In hac habitasse platea dictumst. Pellentesque sagittis arcu et sagittis dapibus. Pellentesque pharetra enim ullamcorper vehicula sodales. Cras accumsan quam tristique est cursus pulvinar. Praesent semper erat condimentum urna semper laoreet. Proin accumsan eros porta elit dapibus, vel commodo dui molestie. Praesent sed quam nec libero porttitor ullamcorper. Donec mauris ipsum, hendrerit eu est sit amet, venenatis varius tortor. Ut pulvinar eleifend congue.\r\n\r\nPraesent a arcu nisi. Nam sed velit est. Praesent orci velit, pretium auctor tristique quis, volutpat lacinia orci. Mauris sagittis, tortor a sollicitudin cursus, risus eros mattis metus, eget sollicitudin tellus ex ac mauris. Proin ut vulputate felis. Proin odio massa, suscipit a lobortis sit amet, gravida quis ex. Nullam at massa ornare odio iaculis aliquam eu eu lacus. Nulla suscipit velit commodo lorem dignissim, ac lobortis ligula convallis. Nulla metus eros, dapibus id elit sed, accumsan vulputate lorem. Pellentesque placerat tortor laoreet lobortis lacinia. Praesent nec dolor condimentum, fermentum dolor in, sagittis nisi. Nulla dapibus magna semper scelerisque blandit.\r\n\r\nDuis ligula diam, mollis quis nisl sed, fringilla imperdiet augue. Phasellus euismod pretium mi, ac mollis orci venenatis vel. Nulla gravida risus at aliquet hendrerit. Maecenas feugiat nisi at nibh pulvinar porttitor. Vestibulum sollicitudin mollis vulputate. In hac habitasse platea dictumst. Nam ut nulla tortor. Nullam in ornare est. Nullam posuere fringilla mauris id aliquet. Nunc nunc mi, molestie ac cursus et, feugiat vel sapien. Nulla auctor sapien ac iaculis pellentesque. Fusce consectetur felis vitae enim sagittis, nec finibus dui eleifend. Nam pharetra mi a ullamcorper rhoncus.\r\n\r\nVestibulum congue non mauris ac imperdiet. Morbi ut orci at nisl placerat blandit feugiat sit amet tortor. Praesent imperdiet ultrices ante a aliquet. Nunc et libero ante. Nulla felis tortor, fermentum nec dui sed, lacinia congue dui. Donec lorem arcu, rutrum a ultrices id, imperdiet et arcu. In commodo et mi sed imperdiet. Ut quis elit fermentum, scelerisque dolor vitae, venenatis leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas venenatis et massa quis semper. Proin et malesuada magna. Pellentesque ac sagittis libero.\r\n\r\nInteger venenatis dui cursus, porttitor augue ut, rutrum purus. Integer sed neque condimentum, lacinia tortor vel, pretium est. Donec pulvinar augue tortor. Maecenas a risus vitae elit facilisis rhoncus. Proin ut nulla congue neque iaculis dictum et in sapien. Phasellus sagittis malesuada vestibulum. Nam sit amet magna sollicitudin, dapibus enim in, blandit odio. Suspendisse commodo lorem diam, sit amet ultricies felis facilisis eu. Duis viverra purus neque, eget mollis tellus semper eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nInteger mollis sapien lobortis, gravida sapien sed, congue velit. Nunc id dictum felis. Quisque at varius urna. Vivamus convallis urna vitae urna fringilla, ac scelerisque nulla tristique. Ut at euismod ante. Curabitur pharetra venenatis diam vel dapibus. Quisque elementum rutrum diam. Integer nec fermentum quam. Nunc augue ex, maximus sit amet nibh nec, sollicitudin malesuada tellus. Pellentesque sed elit orci.\r\n\r\nEtiam laoreet enim in nulla facilisis, vitae maximus justo ullamcorper. Nulla sed lorem id est mattis pulvinar non a sapien. Morbi sodales velit non lorem consequat porttitor. Cras non est mollis, tempus lacus nec, rutrum augue. Pellentesque rutrum vitae neque ac elementum. Phasellus leo dui, consequat sit amet ornare id, fringilla id nulla. Aliquam finibus in enim at ultricies. Quisque id nibh eros. Duis congue erat nec ipsum rutrum, a sagittis nisl venenatis. Donec pulvinar molestie dolor quis euismod. Nam quis elit vitae nulla tristique imperdiet lobortis vitae elit. Maecenas placerat fermentum ligula et imperdiet. Nam et urna vehicula, scelerisque neque vitae, auctor ex.','Programación Orientada a Objetos en PHP','','inherit','closed','closed','','19-revision-v1','','','2018-06-18 04:30:40','2018-06-18 04:30:40','',19,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/19-revision-v1/',0,'revision','',0),(21,1,'2018-06-18 04:44:01','2018-06-18 04:44:01','latea dictumst. Pellentesque sagittis arcu et sagittis dapibus. Pellentesque pharetra enim ullamcorper vehicula sodales. Cras accumsan quam tristique est cursus pulvinar. Praesent semper erat condimentum urna semper laoreet. Proin accumsan eros porta elit dapibus, vel commodo dui molestie. Praesent sed quam nec libero porttitor ullamcorper. Donec mauris ipsum, hendrerit eu est sit amet, venenatis varius tortor. Ut pulvinar eleifend congue.\r\n\r\nPraesent a arcu nisi. Nam sed velit est. Praesent orci velit, pretium auctor tristique quis, volutpat lacinia orci. Mauris sagittis, tortor a sollicitudin cursus, risus eros mattis metus, eget sollicitudin tellus ex ac mauris. Proin ut vulputate felis. Proin odio massa, suscipit a lobortis sit amet, gravida quis ex. Nullam at massa ornare odio iaculis aliquam eu eu lacus. Nulla suscipit velit commodo lorem dignissim, ac lobortis ligula convallis. Nulla metus eros, dapibus id elit sed, accumsan vulputate lorem. Pellentesque placerat tortor laoreet lobortis lacinia. Praesent nec dolor condimentum, fermentum dolor in, sagittis nisi. Nulla dapibus magna semper scelerisque blandit.\r\n\r\nDuis ligula diam, mollis quis nisl sed, fringilla imperdiet augue. Phasellus euismod pretium mi, ac mollis orci venenatis vel. Nulla gravida risus at aliquet hendrerit. Maecenas feugiat nisi at nibh pulvinar porttitor. Vestibulum sollicitudin mollis vulputate. In hac habitasse platea dictumst. Nam ut nulla tortor. Nullam in ornare est. Nullam posuere fringilla mauris id aliquet. Nunc nunc mi, molestie ac cursus et, feugiat vel sapien. Nulla auctor sapien ac iaculis pellentesque. Fusce consectetur felis vitae enim sagittis, nec finibus dui eleifend. Nam pharetra mi a ullamcorper rhoncus.','Perfiles en redes sociales','','publish','open','open','','perfiles-en-redes-sociales','','','2018-06-18 04:44:01','2018-06-18 04:44:01','',0,'http://localhost/serverdev/testing-wp/siteone/?p=21',0,'post','',0),(22,1,'2018-06-18 04:44:01','2018-06-18 04:44:01','latea dictumst. Pellentesque sagittis arcu et sagittis dapibus. Pellentesque pharetra enim ullamcorper vehicula sodales. Cras accumsan quam tristique est cursus pulvinar. Praesent semper erat condimentum urna semper laoreet. Proin accumsan eros porta elit dapibus, vel commodo dui molestie. Praesent sed quam nec libero porttitor ullamcorper. Donec mauris ipsum, hendrerit eu est sit amet, venenatis varius tortor. Ut pulvinar eleifend congue.\r\n\r\nPraesent a arcu nisi. Nam sed velit est. Praesent orci velit, pretium auctor tristique quis, volutpat lacinia orci. Mauris sagittis, tortor a sollicitudin cursus, risus eros mattis metus, eget sollicitudin tellus ex ac mauris. Proin ut vulputate felis. Proin odio massa, suscipit a lobortis sit amet, gravida quis ex. Nullam at massa ornare odio iaculis aliquam eu eu lacus. Nulla suscipit velit commodo lorem dignissim, ac lobortis ligula convallis. Nulla metus eros, dapibus id elit sed, accumsan vulputate lorem. Pellentesque placerat tortor laoreet lobortis lacinia. Praesent nec dolor condimentum, fermentum dolor in, sagittis nisi. Nulla dapibus magna semper scelerisque blandit.\r\n\r\nDuis ligula diam, mollis quis nisl sed, fringilla imperdiet augue. Phasellus euismod pretium mi, ac mollis orci venenatis vel. Nulla gravida risus at aliquet hendrerit. Maecenas feugiat nisi at nibh pulvinar porttitor. Vestibulum sollicitudin mollis vulputate. In hac habitasse platea dictumst. Nam ut nulla tortor. Nullam in ornare est. Nullam posuere fringilla mauris id aliquet. Nunc nunc mi, molestie ac cursus et, feugiat vel sapien. Nulla auctor sapien ac iaculis pellentesque. Fusce consectetur felis vitae enim sagittis, nec finibus dui eleifend. Nam pharetra mi a ullamcorper rhoncus.','Perfiles en redes sociales','','inherit','closed','closed','','21-revision-v1','','','2018-06-18 04:44:01','2018-06-18 04:44:01','',21,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/21-revision-v1/',0,'revision','',0),(23,1,'2018-06-18 04:49:16','2018-06-18 04:49:16','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec lobortis velit, eu bibendum arcu. Duis consectetur lorem lorem, vel mattis dui accumsan vel. Pellentesque purus ligula, rhoncus at neque nec, ultricies rhoncus urna. In mattis ac turpis vel vulputate. Fusce vel ipsum massa. Duis laoreet blandit libero, vel fermentum leo rhoncus sit amet. Donec porttitor pharetra nibh ac pellentesque. Maecenas porta cursus molestie. Sed dictum velit sed velit dignissim tristique. Cras sed tellus imperdiet, feugiat odio at, tincidunt magna. Proin pretium urna ac est ultricies finibus. Nam maximus, nunc at posuere auctor, velit mauris blandit odio, vel facilisis est leo id felis. Fusce velit massa, ornare a vestibulum dictum, elementum id dolor. Sed eu libero gravida, tempor massa non, gravida nisl. Nullam dapibus consectetur odio eget feugiat.\r\n\r\nSed at tempus augue, non fringilla quam. Quisque placerat fringilla turpis ac tempor. Sed cursus purus erat, in suscipit metus ullamcorper sit amet. Phasellus euismod vitae ante vel euismod. Ut a porta sapien, non vestibulum massa. Nam nec turpis erat. Fusce aliquet, libero nec tincidunt fringilla, purus erat blandit nunc, non venenatis purus augue at nisl. Maecenas quis neque vel arcu varius porta convallis sit amet tellus. Sed vestibulum scelerisque accumsan. Integer ut dui non felis bibendum gravida. Aliquam cursus accumsan massa quis imperdiet. Curabitur vitae nibh at turpis congue commodo facilisis eget arcu. Proin non metus volutpat, congue dolor at, ullamcorper orci. Vivamus ac enim elit. Morbi tempor mi in massa cursus, eu mattis arcu interdum.\r\n\r\nVestibulum sed suscipit ex. Praesent rhoncus lobortis tortor, molestie faucibus nisi rhoncus feugiat. Curabitur tincidunt lorem metus, et condimentum est semper vel. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin quis blandit enim. Praesent sem odio, tempor quis congue vel, blandit in ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque cursus tellus nec volutpat tempus. Nulla id felis sed elit sodales lobortis sit amet dapibus justo. Nam lobortis lectus enim, nec interdum enim pellentesque et. Ut egestas ut elit a consequat. Quisque ultrices nulla ac diam varius, a lobortis ante auctor. Donec leo turpis, aliquam nec auctor a, pretium id odio. Suspendisse ultricies nec orci eu sodales. Nam euismod, enim sit amet sollicitudin aliquam, metus nulla ullamcorper neque, quis euismod risus nulla quis risus. Phasellus commodo sed ipsum vel vehicula.\r\n\r\nPhasellus sit amet ex mattis, efficitur quam eu, vulputate ex. Sed in nulla cursus dui sodales dignissim. Quisque pulvinar facilisis massa eu venenatis. Quisque dictum enim eu neque fermentum, sed congue leo semper. Curabitur at orci commodo, egestas augue tincidunt, bibendum urna. In mollis libero interdum elementum convallis. In id consequat magna. Phasellus faucibus laoreet vulputate. Praesent condimentum auctor consequat.\r\n\r\nPellentesque eget mauris venenatis turpis fermentum varius non a est. Fusce eu quam nulla. Nulla et tortor et massa mollis semper vitae vitae purus. Sed malesuada lectus a metus volutpat venenatis. Vestibulum pellentesque imperdiet arcu. Etiam hendrerit varius pellentesque. Nullam semper dui at lorem interdum, at iaculis neque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vulputate, enim ac interdum sollicitudin, nisl mauris porta libero, at ullamcorper nulla nibh sed ipsum. Sed consectetur orci eget condimentum scelerisque. In faucibus elit nec orci bibendum, nec eleifend massa fringilla. Phasellus aliquet pretium est quis ultricies.\r\n\r\nPhasellus tristique lacus ac aliquet tincidunt. Nam semper mauris nec molestie laoreet. Vestibulum vitae nibh eget odio tristique scelerisque eget in tortor. Quisque consequat consectetur vehicula. Proin pulvinar elit non molestie gravida. Quisque odio nulla, sollicitudin vel sapien vitae, tempus interdum tortor. Quisque bibendum vestibulum pretium. Ut cursus imperdiet quam, in ultrices eros feugiat nec. In lorem sapien, fermentum nec turpis varius, pretium pellentesque urna. Maecenas lacinia rutrum tincidunt. Mauris et tortor leo.\r\n\r\nFusce dictum dui sed diam molestie, quis posuere nunc volutpat. Morbi molestie, dolor in finibus condimentum, justo ligula ultrices augue, eget tempor odio sem sed metus. Phasellus vitae tincidunt dui. Curabitur quis risus orci. Sed faucibus condimentum tellus id facilisis. Nullam dignissim ornare ullamcorper. Phasellus ut libero tellus. Vivamus iaculis nisi ac tincidunt pretium. Quisque at diam non nisi laoreet ultrices dapibus nec leo. Mauris orci leo, aliquet nec est in, fermentum fermentum leo. Proin vel aliquet neque, vitae varius urna. Donec sodales luctus nisl, eu cursus lacus hendrerit convallis. Etiam in lorem a est aliquet malesuada quis vel massa. Nunc tempor ac lorem nec laoreet.\r\n\r\nNulla cursus diam ut condimentum gravida. Suspendisse nisi erat, ullamcorper in sagittis vitae, consequat et libero. Curabitur vel mauris varius, accumsan enim id, porta leo. Praesent quis urna porta, viverra mi eget, scelerisque diam. Donec a nunc nisl. Nunc nec eros maximus, pellentesque ex id, luctus ligula. Suspendisse varius a nulla in commodo. Vestibulum a elit nec lorem dapibus efficitur sit amet et lacus.\r\n\r\nDonec vel semper lorem. Maecenas ultricies purus nunc, eget pharetra lacus convallis consequat. Quisque eget felis mi. Cras tellus sem, vestibulum at magna nec, euismod scelerisque quam. Praesent nec nunc pellentesque, bibendum arcu quis, volutpat tortor. Integer ultrices blandit erat eu molestie. Suspendisse quis condimentum urna, non facilisis massa. Etiam sagittis elit sed eleifend posuere. Nam malesuada libero volutpat cursus lobortis. Vestibulum leo augue, cursus vitae bibendum eget, aliquet eget enim. Quisque dapibus nisl ut nulla maximus consequat. Praesent lobortis leo in lobortis ultricies. Suspendisse quis mauris sodales, ullamcorper velit feugiat, imperdiet ligula.\r\n\r\nEtiam dui mauris, tristique sit amet bibendum quis, varius ac ipsum. Vivamus at semper felis, vel rhoncus arcu. Suspendisse vel diam porta, egestas enim sed, vulputate enim. Maecenas feugiat, tellus in hendrerit scelerisque, quam odio imperdiet velit, eu molestie lectus quam et tortor. Mauris eu magna et est maximus consequat ut vel risus. Aenean auctor bibendum quam, feugiat sodales magna venenatis id. Vivamus vel tincidunt erat. Nullam blandit, augue vel laoreet ullamcorper, magna erat dapibus ligula, malesuada tincidunt erat sem cursus leo. Curabitur sagittis porttitor ante, venenatis auctor eros mollis vehicula.','Qué hacer y qué no hacer en una Campaña','','publish','open','open','','que-hacer-y-que-no-hacer-en-una-campana','','','2018-06-18 04:49:16','2018-06-18 04:49:16','',0,'http://localhost/serverdev/testing-wp/siteone/?p=23',0,'post','',0),(24,1,'2018-06-18 04:49:16','2018-06-18 04:49:16','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec lobortis velit, eu bibendum arcu. Duis consectetur lorem lorem, vel mattis dui accumsan vel. Pellentesque purus ligula, rhoncus at neque nec, ultricies rhoncus urna. In mattis ac turpis vel vulputate. Fusce vel ipsum massa. Duis laoreet blandit libero, vel fermentum leo rhoncus sit amet. Donec porttitor pharetra nibh ac pellentesque. Maecenas porta cursus molestie. Sed dictum velit sed velit dignissim tristique. Cras sed tellus imperdiet, feugiat odio at, tincidunt magna. Proin pretium urna ac est ultricies finibus. Nam maximus, nunc at posuere auctor, velit mauris blandit odio, vel facilisis est leo id felis. Fusce velit massa, ornare a vestibulum dictum, elementum id dolor. Sed eu libero gravida, tempor massa non, gravida nisl. Nullam dapibus consectetur odio eget feugiat.\r\n\r\nSed at tempus augue, non fringilla quam. Quisque placerat fringilla turpis ac tempor. Sed cursus purus erat, in suscipit metus ullamcorper sit amet. Phasellus euismod vitae ante vel euismod. Ut a porta sapien, non vestibulum massa. Nam nec turpis erat. Fusce aliquet, libero nec tincidunt fringilla, purus erat blandit nunc, non venenatis purus augue at nisl. Maecenas quis neque vel arcu varius porta convallis sit amet tellus. Sed vestibulum scelerisque accumsan. Integer ut dui non felis bibendum gravida. Aliquam cursus accumsan massa quis imperdiet. Curabitur vitae nibh at turpis congue commodo facilisis eget arcu. Proin non metus volutpat, congue dolor at, ullamcorper orci. Vivamus ac enim elit. Morbi tempor mi in massa cursus, eu mattis arcu interdum.\r\n\r\nVestibulum sed suscipit ex. Praesent rhoncus lobortis tortor, molestie faucibus nisi rhoncus feugiat. Curabitur tincidunt lorem metus, et condimentum est semper vel. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin quis blandit enim. Praesent sem odio, tempor quis congue vel, blandit in ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque cursus tellus nec volutpat tempus. Nulla id felis sed elit sodales lobortis sit amet dapibus justo. Nam lobortis lectus enim, nec interdum enim pellentesque et. Ut egestas ut elit a consequat. Quisque ultrices nulla ac diam varius, a lobortis ante auctor. Donec leo turpis, aliquam nec auctor a, pretium id odio. Suspendisse ultricies nec orci eu sodales. Nam euismod, enim sit amet sollicitudin aliquam, metus nulla ullamcorper neque, quis euismod risus nulla quis risus. Phasellus commodo sed ipsum vel vehicula.\r\n\r\nPhasellus sit amet ex mattis, efficitur quam eu, vulputate ex. Sed in nulla cursus dui sodales dignissim. Quisque pulvinar facilisis massa eu venenatis. Quisque dictum enim eu neque fermentum, sed congue leo semper. Curabitur at orci commodo, egestas augue tincidunt, bibendum urna. In mollis libero interdum elementum convallis. In id consequat magna. Phasellus faucibus laoreet vulputate. Praesent condimentum auctor consequat.\r\n\r\nPellentesque eget mauris venenatis turpis fermentum varius non a est. Fusce eu quam nulla. Nulla et tortor et massa mollis semper vitae vitae purus. Sed malesuada lectus a metus volutpat venenatis. Vestibulum pellentesque imperdiet arcu. Etiam hendrerit varius pellentesque. Nullam semper dui at lorem interdum, at iaculis neque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vulputate, enim ac interdum sollicitudin, nisl mauris porta libero, at ullamcorper nulla nibh sed ipsum. Sed consectetur orci eget condimentum scelerisque. In faucibus elit nec orci bibendum, nec eleifend massa fringilla. Phasellus aliquet pretium est quis ultricies.\r\n\r\nPhasellus tristique lacus ac aliquet tincidunt. Nam semper mauris nec molestie laoreet. Vestibulum vitae nibh eget odio tristique scelerisque eget in tortor. Quisque consequat consectetur vehicula. Proin pulvinar elit non molestie gravida. Quisque odio nulla, sollicitudin vel sapien vitae, tempus interdum tortor. Quisque bibendum vestibulum pretium. Ut cursus imperdiet quam, in ultrices eros feugiat nec. In lorem sapien, fermentum nec turpis varius, pretium pellentesque urna. Maecenas lacinia rutrum tincidunt. Mauris et tortor leo.\r\n\r\nFusce dictum dui sed diam molestie, quis posuere nunc volutpat. Morbi molestie, dolor in finibus condimentum, justo ligula ultrices augue, eget tempor odio sem sed metus. Phasellus vitae tincidunt dui. Curabitur quis risus orci. Sed faucibus condimentum tellus id facilisis. Nullam dignissim ornare ullamcorper. Phasellus ut libero tellus. Vivamus iaculis nisi ac tincidunt pretium. Quisque at diam non nisi laoreet ultrices dapibus nec leo. Mauris orci leo, aliquet nec est in, fermentum fermentum leo. Proin vel aliquet neque, vitae varius urna. Donec sodales luctus nisl, eu cursus lacus hendrerit convallis. Etiam in lorem a est aliquet malesuada quis vel massa. Nunc tempor ac lorem nec laoreet.\r\n\r\nNulla cursus diam ut condimentum gravida. Suspendisse nisi erat, ullamcorper in sagittis vitae, consequat et libero. Curabitur vel mauris varius, accumsan enim id, porta leo. Praesent quis urna porta, viverra mi eget, scelerisque diam. Donec a nunc nisl. Nunc nec eros maximus, pellentesque ex id, luctus ligula. Suspendisse varius a nulla in commodo. Vestibulum a elit nec lorem dapibus efficitur sit amet et lacus.\r\n\r\nDonec vel semper lorem. Maecenas ultricies purus nunc, eget pharetra lacus convallis consequat. Quisque eget felis mi. Cras tellus sem, vestibulum at magna nec, euismod scelerisque quam. Praesent nec nunc pellentesque, bibendum arcu quis, volutpat tortor. Integer ultrices blandit erat eu molestie. Suspendisse quis condimentum urna, non facilisis massa. Etiam sagittis elit sed eleifend posuere. Nam malesuada libero volutpat cursus lobortis. Vestibulum leo augue, cursus vitae bibendum eget, aliquet eget enim. Quisque dapibus nisl ut nulla maximus consequat. Praesent lobortis leo in lobortis ultricies. Suspendisse quis mauris sodales, ullamcorper velit feugiat, imperdiet ligula.\r\n\r\nEtiam dui mauris, tristique sit amet bibendum quis, varius ac ipsum. Vivamus at semper felis, vel rhoncus arcu. Suspendisse vel diam porta, egestas enim sed, vulputate enim. Maecenas feugiat, tellus in hendrerit scelerisque, quam odio imperdiet velit, eu molestie lectus quam et tortor. Mauris eu magna et est maximus consequat ut vel risus. Aenean auctor bibendum quam, feugiat sodales magna venenatis id. Vivamus vel tincidunt erat. Nullam blandit, augue vel laoreet ullamcorper, magna erat dapibus ligula, malesuada tincidunt erat sem cursus leo. Curabitur sagittis porttitor ante, venenatis auctor eros mollis vehicula.','Qué hacer y qué no hacer en una Campaña','','inherit','closed','closed','','23-revision-v1','','','2018-06-18 04:49:16','2018-06-18 04:49:16','',23,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/23-revision-v1/',0,'revision','',0),(25,1,'2018-06-18 04:51:33','2018-06-18 04:51:33','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec lobortis velit, eu bibendum arcu. Duis consectetur lorem lorem, vel mattis dui accumsan vel. Pellentesque purus ligula, rhoncus at neque nec, ultricies rhoncus urna. In mattis ac turpis vel vulputate. Fusce vel ipsum massa. Duis laoreet blandit libero, vel fermentum leo rhoncus sit amet. Donec porttitor pharetra nibh ac pellentesque. Maecenas porta cursus molestie. Sed dictum velit sed velit dignissim tristique. Cras sed tellus imperdiet, feugiat odio at, tincidunt magna. Proin pretium urna ac est ultricies finibus. Nam maximus, nunc at posuere auctor, velit mauris blandit odio, vel facilisis est leo id felis. Fusce velit massa, ornare a vestibulum dictum, elementum id dolor. Sed eu libero gravida, tempor massa non, gravida nisl. Nullam dapibus consectetur odio eget feugiat.\r\n\r\nSed at tempus augue, non fringilla quam. Quisque placerat fringilla turpis ac tempor. Sed cursus purus erat, in suscipit metus ullamcorper sit amet. Phasellus euismod vitae ante vel euismod. Ut a porta sapien, non vestibulum massa. Nam nec turpis erat. Fusce aliquet, libero nec tincidunt fringilla, purus erat blandit nunc, non venenatis purus augue at nisl. Maecenas quis neque vel arcu varius porta convallis sit amet tellus. Sed vestibulum scelerisque accumsan. Integer ut dui non felis bibendum gravida. Aliquam cursus accumsan massa quis imperdiet. Curabitur vitae nibh at turpis congue commodo facilisis eget arcu. Proin non metus volutpat, congue dolor at, ullamcorper orci. Vivamus ac enim elit. Morbi tempor mi in massa cursus, eu mattis arcu interdum.\r\n\r\nVestibulum sed suscipit ex. Praesent rhoncus lobortis tortor, molestie faucibus nisi rhoncus feugiat. Curabitur tincidunt lorem metus, et condimentum est semper vel. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin quis blandit enim. Praesent sem odio, tempor quis congue vel, blandit in ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque cursus tellus nec volutpat tempus. Nulla id felis sed elit sodales lobortis sit amet dapibus justo. Nam lobortis lectus enim, nec interdum enim pellentesque et. Ut egestas ut elit a consequat. Quisque ultrices nulla ac diam varius, a lobortis ante auctor. Donec leo turpis, aliquam nec auctor a, pretium id odio. Suspendisse ultricies nec orci eu sodales. Nam euismod, enim sit amet sollicitudin aliquam, metus nulla ullamcorper neque, quis euismod risus nulla quis risus. Phasellus commodo sed ipsum vel vehicula.\r\n\r\nPhasellus sit amet ex mattis, efficitur quam eu, vulputate ex. Sed in nulla cursus dui sodales dignissim. Quisque pulvinar facilisis massa eu venenatis. Quisque dictum enim eu neque fermentum, sed congue leo semper. Curabitur at orci commodo, egestas augue tincidunt, bibendum urna. In mollis libero interdum elementum convallis. In id consequat magna. Phasellus faucibus laoreet vulputate. Praesent condimentum auctor consequat.\r\n\r\nPellentesque eget mauris venenatis turpis fermentum varius non a est. Fusce eu quam nulla. Nulla et tortor et massa mollis semper vitae vitae purus. Sed malesuada lectus a metus volutpat venenatis. Vestibulum pellentesque imperdiet arcu. Etiam hendrerit varius pellentesque. Nullam semper dui at lorem interdum, at iaculis neque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vulputate, enim ac interdum sollicitudin, nisl mauris porta libero, at ullamcorper nulla nibh sed ipsum. Sed consectetur orci eget condimentum scelerisque. In faucibus elit nec orci bibendum, nec eleifend massa fringilla. Phasellus aliquet pretium est quis ultricies.\r\n\r\nPhasellus tristique lacus ac aliquet tincidunt. Nam semper mauris nec molestie laoreet. Vestibulum vitae nibh eget odio tristique scelerisque eget in tortor. Quisque consequat consectetur vehicula. Proin pulvinar elit non molestie gravida. Quisque odio nulla, sollicitudin vel sapien vitae, tempus interdum tortor. Quisque bibendum vestibulum pretium. Ut cursus imperdiet quam, in ultrices eros feugiat nec. In lorem sapien, fermentum nec turpis varius, pretium pellentesque urna. Maecenas lacinia rutrum tincidunt. Mauris et tortor leo.\r\n\r\nFusce dictum dui sed diam molestie, quis posuere nunc volutpat. Morbi molestie, dolor in finibus condimentum, justo ligula ultrices augue, eget tempor odio sem sed metus. Phasellus vitae tincidunt dui. Curabitur quis risus orci. Sed faucibus condimentum tellus id facilisis. Nullam dignissim ornare ullamcorper. Phasellus ut libero tellus. Vivamus iaculis nisi ac tincidunt pretium. Quisque at diam non nisi laoreet ultrices dapibus nec leo. Mauris orci leo, aliquet nec est in, fermentum fermentum leo. Proin vel aliquet neque, vitae varius urna. Donec sodales luctus nisl, eu cursus lacus hendrerit convallis. Etiam in lorem a est aliquet malesuada quis vel massa. Nunc tempor ac lorem nec laoreet.','Fundamentos en Google Platform','','publish','open','open','','fundamentos-en-google-platform','','','2018-06-18 04:51:33','2018-06-18 04:51:33','',0,'http://localhost/serverdev/testing-wp/siteone/?p=25',0,'post','',0),(26,1,'2018-06-18 04:51:33','2018-06-18 04:51:33','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec lobortis velit, eu bibendum arcu. Duis consectetur lorem lorem, vel mattis dui accumsan vel. Pellentesque purus ligula, rhoncus at neque nec, ultricies rhoncus urna. In mattis ac turpis vel vulputate. Fusce vel ipsum massa. Duis laoreet blandit libero, vel fermentum leo rhoncus sit amet. Donec porttitor pharetra nibh ac pellentesque. Maecenas porta cursus molestie. Sed dictum velit sed velit dignissim tristique. Cras sed tellus imperdiet, feugiat odio at, tincidunt magna. Proin pretium urna ac est ultricies finibus. Nam maximus, nunc at posuere auctor, velit mauris blandit odio, vel facilisis est leo id felis. Fusce velit massa, ornare a vestibulum dictum, elementum id dolor. Sed eu libero gravida, tempor massa non, gravida nisl. Nullam dapibus consectetur odio eget feugiat.\r\n\r\nSed at tempus augue, non fringilla quam. Quisque placerat fringilla turpis ac tempor. Sed cursus purus erat, in suscipit metus ullamcorper sit amet. Phasellus euismod vitae ante vel euismod. Ut a porta sapien, non vestibulum massa. Nam nec turpis erat. Fusce aliquet, libero nec tincidunt fringilla, purus erat blandit nunc, non venenatis purus augue at nisl. Maecenas quis neque vel arcu varius porta convallis sit amet tellus. Sed vestibulum scelerisque accumsan. Integer ut dui non felis bibendum gravida. Aliquam cursus accumsan massa quis imperdiet. Curabitur vitae nibh at turpis congue commodo facilisis eget arcu. Proin non metus volutpat, congue dolor at, ullamcorper orci. Vivamus ac enim elit. Morbi tempor mi in massa cursus, eu mattis arcu interdum.\r\n\r\nVestibulum sed suscipit ex. Praesent rhoncus lobortis tortor, molestie faucibus nisi rhoncus feugiat. Curabitur tincidunt lorem metus, et condimentum est semper vel. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin quis blandit enim. Praesent sem odio, tempor quis congue vel, blandit in ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque cursus tellus nec volutpat tempus. Nulla id felis sed elit sodales lobortis sit amet dapibus justo. Nam lobortis lectus enim, nec interdum enim pellentesque et. Ut egestas ut elit a consequat. Quisque ultrices nulla ac diam varius, a lobortis ante auctor. Donec leo turpis, aliquam nec auctor a, pretium id odio. Suspendisse ultricies nec orci eu sodales. Nam euismod, enim sit amet sollicitudin aliquam, metus nulla ullamcorper neque, quis euismod risus nulla quis risus. Phasellus commodo sed ipsum vel vehicula.\r\n\r\nPhasellus sit amet ex mattis, efficitur quam eu, vulputate ex. Sed in nulla cursus dui sodales dignissim. Quisque pulvinar facilisis massa eu venenatis. Quisque dictum enim eu neque fermentum, sed congue leo semper. Curabitur at orci commodo, egestas augue tincidunt, bibendum urna. In mollis libero interdum elementum convallis. In id consequat magna. Phasellus faucibus laoreet vulputate. Praesent condimentum auctor consequat.\r\n\r\nPellentesque eget mauris venenatis turpis fermentum varius non a est. Fusce eu quam nulla. Nulla et tortor et massa mollis semper vitae vitae purus. Sed malesuada lectus a metus volutpat venenatis. Vestibulum pellentesque imperdiet arcu. Etiam hendrerit varius pellentesque. Nullam semper dui at lorem interdum, at iaculis neque scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris vulputate, enim ac interdum sollicitudin, nisl mauris porta libero, at ullamcorper nulla nibh sed ipsum. Sed consectetur orci eget condimentum scelerisque. In faucibus elit nec orci bibendum, nec eleifend massa fringilla. Phasellus aliquet pretium est quis ultricies.\r\n\r\nPhasellus tristique lacus ac aliquet tincidunt. Nam semper mauris nec molestie laoreet. Vestibulum vitae nibh eget odio tristique scelerisque eget in tortor. Quisque consequat consectetur vehicula. Proin pulvinar elit non molestie gravida. Quisque odio nulla, sollicitudin vel sapien vitae, tempus interdum tortor. Quisque bibendum vestibulum pretium. Ut cursus imperdiet quam, in ultrices eros feugiat nec. In lorem sapien, fermentum nec turpis varius, pretium pellentesque urna. Maecenas lacinia rutrum tincidunt. Mauris et tortor leo.\r\n\r\nFusce dictum dui sed diam molestie, quis posuere nunc volutpat. Morbi molestie, dolor in finibus condimentum, justo ligula ultrices augue, eget tempor odio sem sed metus. Phasellus vitae tincidunt dui. Curabitur quis risus orci. Sed faucibus condimentum tellus id facilisis. Nullam dignissim ornare ullamcorper. Phasellus ut libero tellus. Vivamus iaculis nisi ac tincidunt pretium. Quisque at diam non nisi laoreet ultrices dapibus nec leo. Mauris orci leo, aliquet nec est in, fermentum fermentum leo. Proin vel aliquet neque, vitae varius urna. Donec sodales luctus nisl, eu cursus lacus hendrerit convallis. Etiam in lorem a est aliquet malesuada quis vel massa. Nunc tempor ac lorem nec laoreet.','Fundamentos en Google Platform','','inherit','closed','closed','','25-revision-v1','','','2018-06-18 04:51:33','2018-06-18 04:51:33','',25,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/25-revision-v1/',0,'revision','',0),(27,1,'2018-06-18 13:01:02','2018-06-18 13:01:02','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet in massa vel faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse nec tempor metus. Phasellus faucibus ornare neque, et tempus felis mollis ac. Nam ultricies vehicula fermentum. In viverra ligula urna, vel pellentesque lorem mattis vitae. Praesent fringilla tellus metus, id eleifend ipsum convallis et. Duis accumsan nunc quam, in pretium quam efficitur eget. Maecenas bibendum tempus orci, non hendrerit orci facilisis quis. Morbi iaculis ex ut risus euismod, a pharetra ligula mollis. Praesent pretium efficitur purus et gravida.\r\n\r\nEtiam in ultrices augue. Integer sed libero rhoncus, efficitur lorem at, eleifend magna. Fusce accumsan sem vitae dapibus molestie. Nullam erat mauris, hendrerit in lorem sit amet, efficitur blandit ipsum. In hac habitasse platea dictumst. Cras volutpat rhoncus quam, eu semper nulla. Proin scelerisque porttitor diam, a efficitur tortor molestie eget. Nulla nec enim commodo, gravida magna eget, placerat augue. Vestibulum nisl magna, lobortis vel ligula nec, hendrerit faucibus mi. Integer viverra a augue id scelerisque. Sed sed euismod tortor. Sed massa libero, semper id elementum non, placerat a enim. Donec mauris mi, lobortis ut bibendum vitae, auctor et dolor. Nam vitae sem posuere, luctus ligula at, auctor nunc.\r\n\r\nDonec gravida venenatis neque eu cursus. Phasellus in nisl magna. Fusce libero ante, blandit ut suscipit vitae, vehicula non mi. Donec sollicitudin quis nulla quis pretium. Nulla sed elit at metus varius facilisis. Donec mattis laoreet eleifend. Nullam tristique interdum purus, id dignissim ex viverra eu. Aliquam erat volutpat. Praesent interdum consequat ex, feugiat sollicitudin massa consectetur vel. Suspendisse in dolor a mi ornare gravida non dapibus tortor. Mauris vulputate, nisi id imperdiet cursus, augue ante ultricies felis, vel viverra sapien lectus quis erat. Curabitur facilisis, arcu sed consequat tincidunt, mauris turpis accumsan diam, vitae consequat enim felis sed dui. Aenean sit amet justo non sem tempor condimentum vitae in felis.','Novedades en Angular 6','','publish','open','open','','novedades-en-angular-6','','','2018-06-18 13:01:02','2018-06-18 13:01:02','',0,'http://localhost/serverdev/testing-wp/siteone/?p=27',0,'post','',1),(28,1,'2018-06-18 13:01:02','2018-06-18 13:01:02','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet in massa vel faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse nec tempor metus. Phasellus faucibus ornare neque, et tempus felis mollis ac. Nam ultricies vehicula fermentum. In viverra ligula urna, vel pellentesque lorem mattis vitae. Praesent fringilla tellus metus, id eleifend ipsum convallis et. Duis accumsan nunc quam, in pretium quam efficitur eget. Maecenas bibendum tempus orci, non hendrerit orci facilisis quis. Morbi iaculis ex ut risus euismod, a pharetra ligula mollis. Praesent pretium efficitur purus et gravida.\r\n\r\nEtiam in ultrices augue. Integer sed libero rhoncus, efficitur lorem at, eleifend magna. Fusce accumsan sem vitae dapibus molestie. Nullam erat mauris, hendrerit in lorem sit amet, efficitur blandit ipsum. In hac habitasse platea dictumst. Cras volutpat rhoncus quam, eu semper nulla. Proin scelerisque porttitor diam, a efficitur tortor molestie eget. Nulla nec enim commodo, gravida magna eget, placerat augue. Vestibulum nisl magna, lobortis vel ligula nec, hendrerit faucibus mi. Integer viverra a augue id scelerisque. Sed sed euismod tortor. Sed massa libero, semper id elementum non, placerat a enim. Donec mauris mi, lobortis ut bibendum vitae, auctor et dolor. Nam vitae sem posuere, luctus ligula at, auctor nunc.\r\n\r\nDonec gravida venenatis neque eu cursus. Phasellus in nisl magna. Fusce libero ante, blandit ut suscipit vitae, vehicula non mi. Donec sollicitudin quis nulla quis pretium. Nulla sed elit at metus varius facilisis. Donec mattis laoreet eleifend. Nullam tristique interdum purus, id dignissim ex viverra eu. Aliquam erat volutpat. Praesent interdum consequat ex, feugiat sollicitudin massa consectetur vel. Suspendisse in dolor a mi ornare gravida non dapibus tortor. Mauris vulputate, nisi id imperdiet cursus, augue ante ultricies felis, vel viverra sapien lectus quis erat. Curabitur facilisis, arcu sed consequat tincidunt, mauris turpis accumsan diam, vitae consequat enim felis sed dui. Aenean sit amet justo non sem tempor condimentum vitae in felis.','Novedades en Angular 6','','inherit','closed','closed','','27-revision-v1','','','2018-06-18 13:01:02','2018-06-18 13:01:02','',27,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/06/18/27-revision-v1/',0,'revision','',0),(44,1,'2018-08-10 16:00:58','0000-00-00 00:00:00','<div class=\"skiptranslate\">\n<div class=\"TnITTtw-fullpage-bar\">\n<div class=\"TnITTtw-mate-logo\"></div>\n<div class=\"TnITTtw-fullpage-trans-layout\">\n<div class=\"TnITTtw-label\">Traducido a:</div>\n<div class=\"TnITTtw-lang-name\">Español</div>\n<div class=\"TnITTtw-trans-orig-toggle-button show-orig\">Mostrar original</div>\n</div>\n<div class=\"TnITTtw-close-bar\"></div>\n</div>\n<iframe id=\":0.container\" class=\"goog-te-banner-frame skiptranslate\" style=\"visibility: visible; display: none;\" frameborder=\"0\"></iframe></div>\n&nbsp;\n<div id=\"goog-gt-tt\" class=\"skiptranslate\" dir=\"ltr\">\n<div style=\"padding: 8px;\">\n<div>\n<div class=\"logo\"><img src=\"https://www.gstatic.com/images/branding/product/1x/translate_24dp.png\" alt=\"Google Translate\" width=\"20\" height=\"20\" /></div>\n</div>\n</div>\n<div class=\"top\" style=\"padding: 8px; float: left; width: 100%;\">\n<h1 class=\"title gray\">Original text</h1>\n</div>\n<div class=\"middle\" style=\"padding: 8px;\">\n<div class=\"original-text\"></div>\n</div>\n<div class=\"bottom\" style=\"padding: 8px;\">\n<div class=\"activity-links\"><span class=\"activity-link\">Contribute a better translation</span></div>\n<div class=\"started-activity-container\">\n\n<hr style=\"color: #ccc; background-color: #ccc; height: 1px; border: none;\" />\n\n<div class=\"activity-root\"></div>\n</div>\n</div>\n<div class=\"status-message\" style=\"display: none;\"></div>\n</div>\n<script class=\"skiptranslate\" type=\"text/javascript\">function googleTrButton7646419114497869() {\n  var el = new google.translate.TranslateElement({\n    includedLanguages: \"es\", \n    layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL,\n    autoDisplay: false,\n    multilanguagePage: true,\n    floatPosition: 0\n  });\n  el.showBanner(false);\n  var data = {action: \"goog-loaded\", lang: \"es\"};\n  window.postMessage(data, \"*\");\n}</script><script src=\"//translate.google.com/translate_a/element.js?cb=googleTrButton7646419114497869&amp;hl=en-US\" type=\"text/javascript\"></script>\n<div class=\"goog-te-spinner-pos\">\n<div class=\"goog-te-spinner-animation\"></div>\n</div>\n<iframe class=\"goog-te-menu-frame skiptranslate\" style=\"visibility: visible; box-sizing: content-box; width: 81px; height: 33px; display: none;\" title=\"Language Translate Widget\" frameborder=\"0\"></iframe><iframe class=\"goog-te-menu-frame skiptranslate\" style=\"visibility: visible; box-sizing: content-box; width: 196px; height: 69px; display: none;\" title=\"Language Translate Widget\" frameborder=\"0\"></iframe>','','','draft','open','open','','','','','2018-08-10 16:00:58','2018-08-10 21:00:58','',0,'http://localhost/serverdev/testing-wp/siteone/?p=44',0,'post','',0),(49,1,'2018-08-14 08:38:56','2018-08-14 13:38:56','{\n    \"old_sidebars_widgets_data\": {\n        \"value\": {\n            \"wp_inactive_widgets\": [\n                \"text-2\",\n                \"text-3\",\n                \"text-4\",\n                \"text-5\"\n            ],\n            \"sidebar-1\": [\n                \"search-2\",\n                \"recent-posts-2\",\n                \"recent-comments-2\",\n                \"archives-2\",\n                \"categories-2\",\n                \"meta-2\"\n            ]\n        },\n        \"type\": \"global_variable\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2018-08-14 13:38:56\"\n    }\n}','','','trash','closed','closed','','af71beb4-82c0-454f-93d1-356f8b107423','','','2018-08-14 08:38:56','2018-08-14 13:38:56','',0,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/08/14/af71beb4-82c0-454f-93d1-356f8b107423/',0,'customize_changeset','',0),(51,1,'2018-09-02 00:35:04','0000-00-00 00:00:00','','Borrador automático','','auto-draft','open','open','','','','','2018-09-02 00:35:04','0000-00-00 00:00:00','',0,'http://localhost/serverdev/testing-wp/siteone/?p=51',0,'post','',0),(52,1,'2018-09-02 13:46:03','0000-00-00 00:00:00','','Borrador automático','','auto-draft','closed','closed','','','','','2018-09-02 13:46:03','0000-00-00 00:00:00','',0,'http://localhost/serverdev/testing-wp/siteone/?page_id=52',0,'page','',0),(53,1,'2018-09-02 15:13:01','0000-00-00 00:00:00','','Borrador automático','','auto-draft','closed','closed','','','','','2018-09-02 15:13:01','0000-00-00 00:00:00','',0,'http://localhost/serverdev/testing-wp/siteone/?page_id=53',0,'page','',0),(54,1,'2018-09-03 09:38:04','2018-09-03 14:38:04','[cr_custom_registration]','Registro','','publish','closed','closed','','registro','','','2018-09-03 09:38:04','2018-09-03 14:38:04','',0,'http://localhost/serverdev/testing-wp/siteone/?page_id=54',0,'page','',0),(55,1,'2018-09-03 09:38:04','2018-09-03 14:38:04','[cr_custom_registration]','Registro','','inherit','closed','closed','','54-revision-v1','','','2018-09-03 09:38:04','2018-09-03 14:38:04','',54,'http://localhost/serverdev/testing-wp/siteone/index.php/2018/09/03/54-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `shr_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_term_relationships`
--

DROP TABLE IF EXISTS `shr_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_term_relationships`
--

LOCK TABLES `shr_term_relationships` WRITE;
/*!40000 ALTER TABLE `shr_term_relationships` DISABLE KEYS */;
INSERT INTO `shr_term_relationships` VALUES (1,1,0),(17,6,0),(17,11,0),(17,15,0),(19,7,0),(19,12,0),(19,16,0),(19,17,0),(21,9,0),(21,13,0),(21,18,0),(23,8,0),(23,13,0),(25,10,0),(25,14,0),(27,6,0),(27,11,0),(27,19,0),(27,20,0),(44,1,0);
/*!40000 ALTER TABLE `shr_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_term_taxonomy`
--

DROP TABLE IF EXISTS `shr_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_term_taxonomy`
--

LOCK TABLES `shr_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `shr_term_taxonomy` DISABLE KEYS */;
INSERT INTO `shr_term_taxonomy` VALUES (1,1,'category','',0,1),(6,6,'category','Todo el contenido relacionado con HTML5, Javascript, CSS, Maquetación, UX y más.',0,2),(7,7,'category','Contenido relacionado con toda la programación y configuración que sucede en el servidor.',0,1),(8,8,'category','Marketing Inbound y Outbound.',0,1),(9,9,'category','Todo el contenido relacionado con las habilidades para promocionar la Marca Personal.',0,1),(10,10,'category','Todo lo relacionado con la adquisición de habilidades en el manejo de la nube de Google.',0,1),(11,11,'post_tag','',0,2),(12,12,'post_tag','',0,1),(13,13,'post_tag','',0,2),(14,14,'post_tag','',0,1),(15,15,'post_tag','',0,1),(16,16,'post_tag','',0,1),(17,17,'post_tag','',0,1),(18,18,'post_tag','',0,1),(19,19,'post_tag','',0,1),(20,20,'post_tag','',0,1),(21,21,'post_tag','Grillas en css',0,0);
/*!40000 ALTER TABLE `shr_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_termmeta`
--

DROP TABLE IF EXISTS `shr_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_termmeta`
--

LOCK TABLES `shr_termmeta` WRITE;
/*!40000 ALTER TABLE `shr_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `shr_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_terms`
--

DROP TABLE IF EXISTS `shr_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_terms`
--

LOCK TABLES `shr_terms` WRITE;
/*!40000 ALTER TABLE `shr_terms` DISABLE KEYS */;
INSERT INTO `shr_terms` VALUES (1,'Uncategorized','uncategorized',0),(6,'Frontend','frontend',0),(7,'Backend','backend',0),(8,'Marketing Digital','marketing-digital',0),(9,'Marca Personal','marca-personal',0),(10,'Google Cloud','google-cloud',0),(11,'frontend','frontend',0),(12,'backend','backend',0),(13,'Marketing Digital','marketing-digital',0),(14,'Google Cloud','google-cloud',0),(15,'css','css',0),(16,'php','php',0),(17,'orientado a objetos','orientado-a-objetos',0),(18,'Marca Personal','marca-personal',0),(19,'Javascript','javascript',0),(20,'Angular','angular',0),(21,'grid-css','grid-css',0);
/*!40000 ALTER TABLE `shr_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_usermeta`
--

DROP TABLE IF EXISTS `shr_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_usermeta`
--

LOCK TABLES `shr_usermeta` WRITE;
/*!40000 ALTER TABLE `shr_usermeta` DISABLE KEYS */;
INSERT INTO `shr_usermeta` VALUES (1,1,'nickname','@todopoderoso'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'shr_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'shr_user_level','10'),(14,1,'dismissed_wp_pointers','wp496_privacy,theme_editor_notice'),(15,1,'show_welcome_panel','1'),(17,1,'shr_dashboard_quick_press_last_post_id','51'),(19,1,'closedpostboxes_post','a:0:{}'),(20,1,'metaboxhidden_post','a:6:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:16:\"commentstatusdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}'),(22,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),(26,1,'pms_force_website_https_dismiss_notification','true'),(27,1,'pms_new_add_on_fixedp_dismiss_notification','true'),(28,1,'last_login','2018-08-03 14:46:06'),(29,1,'session_tokens','a:1:{s:64:\"d53052cf732f9e9b49f1cdd3e72cc6488a63dd1827bf99cc706af5f7ded9e16d\";a:4:{s:10:\"expiration\";i:1536593142;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36\";s:5:\"login\";i:1536420342;}}');
/*!40000 ALTER TABLE `shr_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shr_users`
--

DROP TABLE IF EXISTS `shr_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shr_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shr_users`
--

LOCK TABLES `shr_users` WRITE;
/*!40000 ALTER TABLE `shr_users` DISABLE KEYS */;
INSERT INTO `shr_users` VALUES (1,'@todopoderoso','$P$BLJgl4Wlwm3w/TvsOeHd.gKq/cyWH/1','todopoderoso','karlosareyes@gmail.com','','2018-06-14 14:24:23','',0,'@todopoderoso');
/*!40000 ALTER TABLE `shr_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-08 13:25:05
