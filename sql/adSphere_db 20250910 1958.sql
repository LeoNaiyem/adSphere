-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ad_sphere
--

CREATE DATABASE IF NOT EXISTS ad_sphere;
USE ad_sphere;

--
-- Definition of table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`,`name`,`description`,`logo`,`created_at`,`updated_at`) VALUES 
 (1,'Macejkovic PLC updated ....','Debitis natus tenetur nam recusandae. Updated','brands/aNvzC83taqBsPuNvBJEhlQKHihpNXwnWUgeZm9z3.png','2025-09-02 15:01:03','2025-09-10 15:54:10'),
 (2,'Gulgowski-Welch update new','Adipisci vero voluptatem non ut ut............',NULL,'2025-09-02 15:01:03','2025-09-10 16:10:39'),
 (3,'Dare-Goldner','Et minus aut omnis debitis.',NULL,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (4,'Franecki, Shanahan and Harris','Rem iure ea officiis.',NULL,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (5,'Shields PLC','Odit enim eaque et eos.',NULL,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (10,'Dolorum magni quibus update','Accusantium at fugia','brands/MyY0W3Mp2giNzqpWyKIhsBuEwKuwNeiB61XkXV9i.png','2025-09-09 20:06:06','2025-09-10 15:53:23'),
 (11,'Et expedita eligendi update','Non debitis iste dol',NULL,'2025-09-10 12:30:13','2025-09-10 16:11:04'),
 (12,'Ut perspiciatis vol update','Duis voluptatem laud ..','brands/qoGDTigbGq2CImuOdllr6yD5S5OJ8jrDIqGD9NMq.png','2025-09-10 15:49:06','2025-09-10 16:18:58'),
 (13,'Ut aut accusamus ver... update','Dolor dolor labore p update....update','brands/sdSGq3e4yI1bcOjxjuWfGe2wocADsBvoJ8RaRxNe.png','2025-09-10 16:05:46','2025-09-10 16:20:10');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;


--
-- Definition of table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;


--
-- Definition of table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache_locks`
--

/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`,`parent_id`,`name`,`slug`,`status`,`created_at`,`updated_at`) VALUES 
 (2,NULL,'Et','et-1870',1,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (3,NULL,'Nisi','nisi-8201',1,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (4,NULL,'Enim','enim-846',1,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (5,NULL,'Cum','cum-3297',1,'2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (8,NULL,'Nihil qui omnis ipsu','Occaecat inventore f',1,'2025-09-09 17:45:49','2025-09-09 20:47:31'),
 (11,NULL,'Eum autem illo tempo','Nisi consectetur be',0,'2025-09-09 18:27:35','2025-09-09 18:27:35'),
 (12,NULL,'Minima ut aute sunt','Commodo inventore au',0,'2025-09-09 20:45:30','2025-09-09 20:45:30');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `category_fields`
--

DROP TABLE IF EXISTS `category_fields`;
CREATE TABLE `category_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_fields_category_id_foreign` (`category_id`),
  CONSTRAINT `category_fields_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_fields`
--

/*!40000 ALTER TABLE `category_fields` DISABLE KEYS */;
INSERT INTO `category_fields` (`id`,`category_id`,`name`,`type`,`created_at`,`updated_at`) VALUES 
 (2,2,'Model','select','2025-09-09 14:57:50','2025-09-09 14:57:50'),
 (3,2,'Color','number','2025-09-09 14:57:50','2025-09-09 14:57:50'),
 (4,3,'Bedrooms','number','2025-09-09 14:57:50','2025-09-09 14:57:50'),
 (5,2,'Color','number','2025-09-09 14:57:50','2025-09-09 14:57:50'),
 (10,2,'Year','text','2025-09-09 14:57:50','2025-09-09 14:57:50'),
 (12,3,'Square Footage','select','2025-09-09 14:57:51','2025-09-09 14:57:51'),
 (14,2,'Bedrooms','select','2025-09-09 14:57:51','2025-09-09 14:57:51'),
 (15,2,'Warranty','number','2025-09-09 14:57:51','2025-09-09 14:57:51');
/*!40000 ALTER TABLE `category_fields` ENABLE KEYS */;


--
-- Definition of table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


--
-- Definition of table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;


--
-- Definition of table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


--
-- Definition of table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES 
 (1,'0001_01_01_000000_create_users_table',1),
 (2,'0001_01_01_000001_create_cache_table',1),
 (3,'0001_01_01_000002_create_jobs_table',1),
 (4,'2025_09_02_133726_create_brands_table',1),
 (5,'2025_09_02_140344_create_categories_table',1),
 (6,'2025_09_02_140432_create_products_table',1),
 (7,'2025_09_02_140511_create_product_details_table',1),
 (8,'2025_09_02_140623_create_recently_viewed_products_table',1),
 (9,'2025_09_02_145927_create_wishlist_table',1),
 (10,'2025_09_03_082338_create_product_images_table',2),
 (11,'2025_09_09_140443_create_category_fields_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Definition of table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;


--
-- Definition of table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_details_product_id_foreign` (`product_id`),
  CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` (`id`,`product_id`,`attribute_name`,`attribute_value`,`created_at`,`updated_at`) VALUES 
 (1,1,'Model','et','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (2,1,'Model','iste','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (3,2,'Color','magnam','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (4,2,'Model','eligendi','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (5,2,'Color','repellat','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (6,3,'Warranty','quod','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (7,3,'Model','hic','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (8,3,'Color','impedit','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (9,4,'Color','nam','2025-09-02 15:01:04','2025-09-02 15:01:04'),
 (10,4,'Warranty','non','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (11,4,'Model','voluptas','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (12,5,'Color','porro','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (13,5,'Color','voluptate','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (14,5,'Warranty','et','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (15,5,'Model','eum','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (16,6,'Color','rerum','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (17,6,'Warranty','distinctio','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (21,8,'Warranty','enim','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (22,8,'Warranty','eius','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (23,9,'Model','saepe','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (24,9,'Warranty','illo','2025-09-02 15:01:05','2025-09-02 15:01:05'),
 (32,12,'Warranty','est','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (33,12,'Model','a','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (36,14,'Size','in','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (37,14,'Size','perspiciatis','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (38,14,'Warranty','quasi','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (39,15,'Warranty','at','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (40,15,'Color','officiis','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (41,15,'Model','cupiditate','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (42,15,'Model','qui','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (43,16,'Color','et','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (44,16,'Model','beatae','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (45,17,'Color','aliquam','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (46,17,'Color','vitae','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (47,17,'Warranty','aperiam','2025-09-02 15:01:06','2025-09-02 15:01:06'),
 (48,17,'Model','ut','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (49,18,'Size','dolor','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (50,18,'Warranty','nihil','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (51,18,'Warranty','dolores','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (52,18,'Size','maxime','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (53,19,'Model','ut','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (54,19,'Model','ratione','2025-09-02 15:01:07','2025-09-02 15:01:07'),
 (55,19,'Size','non','2025-09-02 15:01:07','2025-09-02 15:01:07');
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;


--
-- Definition of table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` (`id`,`product_id`,`path`,`created_at`,`updated_at`) VALUES 
 (1,22,'products/fPlAH06We9fNCZz4Kf5tmgo0f47th9GMTzzdJmyZ.jpg','2025-09-03 11:32:07','2025-09-03 11:32:07'),
 (2,22,'products/ozh9Bc0Z9EhY6ZT7eaJi5vT0ji47EsC8YR2t9x79.jpg','2025-09-03 11:32:07','2025-09-03 11:32:07'),
 (3,22,'products/vDah5X544rKNXpEHevdWKrSfjttH7FVQ2uyPMyEf.jpg','2025-09-03 11:32:07','2025-09-03 11:32:07'),
 (6,24,'products/KSjkNwJD8kB7yn7Eq3tTQmi0YX4vRKClXPCp9Trv.png','2025-09-05 15:46:31','2025-09-05 15:46:31'),
 (7,24,'products/hriuctiSA6l32KAz2k1UMmes005dr05Xx2KsM4SD.png','2025-09-05 15:46:31','2025-09-05 15:46:31'),
 (8,24,'products/YGeJkG6jWb9PD1cOSl0in5SBIFZHgoMDGDAswncO.png','2025-09-05 15:46:31','2025-09-05 15:46:31'),
 (9,24,'products/Oqc3aCFcTUE6R1WzEsNPLvPUsh9RfMgPrnaVa2J3.png','2025-09-05 15:46:31','2025-09-05 15:46:31'),
 (10,25,'products/OLDov2EkkQAzk2sjoLVJNe5Z0g6tGahBiEQIr5yA.png','2025-09-08 00:50:13','2025-09-08 00:50:13'),
 (11,25,'products/ZSoRt8vBXOjruaCYbU199BTrRcUcD1T2n2Al1lg5.png','2025-09-08 00:50:13','2025-09-08 00:50:13'),
 (12,25,'products/LURW1wLhRyvoRWEePZCSSk92U3DUNcdM460jobUR.png','2025-09-08 00:50:13','2025-09-08 00:50:13'),
 (14,33,'products/QBEp9DRQDy0Gw5lvnphmIi4Rpsuxjd8McNileYPj.png','2025-09-10 15:29:52','2025-09-10 15:29:52'),
 (15,33,'products/lRizJkyz6AtZRbt0wHHSSAjK6zD2N7c5hu81gAB5.png','2025-09-10 15:29:52','2025-09-10 15:29:52'),
 (16,33,'products/7KXWTu7hrRAJtPqTKJDsEH2aCJICa19XvISSMXAH.png','2025-09-10 15:29:52','2025-09-10 15:29:52'),
 (17,10,'products/whnoYnjxgTaUCRY2lPZ9vku61IN4jfSgjDA5tW4Z.png','2025-09-10 15:37:04','2025-09-10 15:37:04'),
 (18,10,'products/GALW4n2EtTxUmAnPkp79Q2lqcSPNFVbHJRqQ2rxa.png','2025-09-10 15:37:05','2025-09-10 15:37:05'),
 (19,10,'products/8aCUxaLPcCLsmveTaKy8PRMYATLKsHmQf1u5bpHc.png','2025-09-10 15:37:05','2025-09-10 15:37:05'),
 (23,35,'products/onmWEP46SDzm4J5OmiFuKbLEdTQMIbp5hU8ojruj.jpg','2025-09-10 17:45:41','2025-09-10 17:45:41'),
 (24,35,'products/bl495m0qYXvebMgjQzfphmrUIoIdVn0zV8gPelSB.png','2025-09-10 17:45:41','2025-09-10 17:45:41');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;


--
-- Definition of table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `condition` enum('new','used') NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`,`title`,`category_id`,`brand_id`,`price`,`condition`,`description`,`status`,`created_at`,`updated_at`,`user_id`) VALUES 
 (1,'dolor placeat est',2,4,'4873.84','new','Necessitatibus totam voluptatem et necessitatibus accusantium quisquam blanditiis omnis. Est consequuntur totam similique et aut. Cum qui et illo nihil. Sed quos in occaecati modi.',1,'2025-09-02 15:01:03','2025-09-02 15:01:03',0),
 (2,'vel id ut',3,3,'819.07','new','Fugit dolor accusamus maxime odio aliquam dolorum commodi. Voluptates occaecati sit voluptatem consequatur. Eum eveniet est rerum reiciendis non repellat ipsam architecto.',1,'2025-09-02 15:01:03','2025-09-02 15:01:03',0),
 (3,'consequuntur perspiciatis voluptatum',2,2,'334.82','used','Ea repellat illum aliquam numquam odio. Et aut accusamus non. Eveniet consequatur exercitationem nostrum numquam eaque velit.',1,'2025-09-02 15:01:03','2025-09-02 15:01:03',0),
 (4,'id voluptas neque',4,4,'493.63','used','Molestias sunt soluta sunt. Maiores dolor doloribus et sit velit. Reiciendis quis omnis accusantium explicabo eos. Maiores ut suscipit officiis aut et ab qui.',1,'2025-09-02 15:01:03','2025-09-02 15:01:03',0),
 (5,'dolor perspiciatis dicta',3,3,'3524.63','used','Beatae nesciunt hic aspernatur similique. Reprehenderit consequuntur qui autem qui enim autem. Rem consequatur et voluptatum quod sequi eum.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (6,'harum nam rerum',5,1,'2735.12','used','Ea id blanditiis atque eos porro et. Nulla ea eaque quo voluptatibus voluptas non. Quaerat voluptate aspernatur et magnam quis cum. Nihil earum necessitatibus in ullam.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (8,'dicta dolores optio',3,2,'446.29','new','Nesciunt sed iste et inventore tempore. A id maiores tempora assumenda possimus nemo. Eveniet qui quis laborum sunt.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (9,'magni et minima',2,5,'3309.86','new','Enim dignissimos quis minus autem cum qui. Nihil quidem nobis exercitationem exercitationem error in enim et.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (10,'ipsam ducimus et Updated',2,2,'2183.95','used','Delectus quis non est dolor pariatur. Sint quasi rerum eos vel ducimus aut autem. Molestiae exercitationem doloribus perferendis sapiente aut id minima. Non nihil id placeat quis odio laboriosam molestiae est.',0,'2025-09-02 15:01:04','2025-09-10 15:37:03',0),
 (12,'fugiat incidunt labore',2,3,'1466.19','used','Porro ut officiis ut placeat. Dolor nulla id similique aut eaque ipsum consectetur. Atque nostrum ea sint fugiat. Voluptatem hic nam et eligendi.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (14,'eos aut aut',4,3,'2299.98','used','Voluptate sed blanditiis omnis est voluptatem maxime voluptas. Ullam ea consequatur quas vitae reiciendis.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (15,'est eos distinctio',4,1,'2130.24','new','Omnis qui repellat unde vel velit ea. Eius quo quasi facere est sint non. Et vero molestiae unde sunt aut. Odit rerum ipsam tempore nisi numquam velit nobis.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (16,'ipsam suscipit minima',3,4,'498.18','used','Rerum laboriosam pariatur quae doloribus. Minus animi eos debitis deleniti laudantium. Et magnam ea sint est atque. Rerum ab voluptatem possimus ea est. Excepturi sit aut dolore aut ut voluptas non.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (17,'tenetur eos earum',2,2,'4915.98','used','Quibusdam sit rem veritatis nisi a totam rerum. Id porro quia molestiae quia aspernatur porro eum. Qui dignissimos eligendi qui enim voluptatem consequatur cumque. Repellat asperiores molestias molestiae ea delectus consequatur dolore.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (18,'iure voluptate doloribus',3,2,'624.62','new','Delectus dignissimos dolores deleniti quia autem aut quia. Omnis molestiae magnam dolorem eos molestiae enim sit. Autem consectetur eaque omnis et non. Quia dolore quod sit.',1,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (19,'blanditiis numquam aut',5,4,'3769.37','used','Dolores consequatur saepe fugit. Et quo unde iure officia. Quod illo eligendi occaecati harum veniam voluptate. Culpa neque excepturi rerum nesciunt accusantium.',0,'2025-09-02 15:01:04','2025-09-02 15:01:04',0),
 (22,'Cillum quia dolor do',4,1,'27.00','new','Sit adipisci volupta',1,'2025-09-03 11:32:06','2025-09-03 11:32:06',1),
 (24,'Product With Image',4,3,'67.00','used','Dolor veniam itaque',1,'2025-09-05 15:46:29','2025-09-05 15:46:29',1),
 (25,'Aut do error ea omni',2,3,'97.00','new','Explicabo Excepteur',1,'2025-09-08 00:50:12','2025-09-08 00:50:12',14),
 (33,'Est eum est autem te',12,1,'99.00','used','Delectus adipisci d lorem AdSphere is your trusted marketplace to buy and sell everything from electronics to cars.',1,'2025-09-10 15:29:51','2025-09-10 15:29:51',1),
 (35,'Veniam rerum non ex',5,11,'98.00','used','Est adipisicing nos',1,'2025-09-10 17:45:41','2025-09-10 17:45:41',12);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


--
-- Definition of table `recently_viewed_products`
--

DROP TABLE IF EXISTS `recently_viewed_products`;
CREATE TABLE `recently_viewed_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recently_viewed_products_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `recently_viewed_products_product_id_foreign` (`product_id`),
  CONSTRAINT `recently_viewed_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recently_viewed_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recently_viewed_products`
--

/*!40000 ALTER TABLE `recently_viewed_products` DISABLE KEYS */;
INSERT INTO `recently_viewed_products` (`id`,`user_id`,`product_id`,`viewed_at`,`created_at`,`updated_at`) VALUES 
 (1,12,24,'2025-09-08 20:49:31','2025-09-07 18:00:05','2025-09-08 20:49:31'),
 (2,12,8,'2025-09-07 18:00:12','2025-09-07 18:00:12','2025-09-07 18:00:12'),
 (5,14,25,'2025-09-08 00:53:31','2025-09-08 00:53:31','2025-09-08 00:53:31'),
 (6,15,4,'2025-09-08 01:14:16','2025-09-08 01:14:16','2025-09-08 01:14:16'),
 (7,12,25,'2025-09-10 17:34:40','2025-09-08 18:50:52','2025-09-10 17:34:40'),
 (8,17,25,'2025-09-08 19:33:56','2025-09-08 19:33:56','2025-09-08 19:33:56'),
 (9,17,24,'2025-09-08 19:34:37','2025-09-08 19:34:37','2025-09-08 19:34:37'),
 (10,1,25,'2025-09-10 14:47:33','2025-09-08 19:51:52','2025-09-10 14:47:33'),
 (11,12,2,'2025-09-09 00:01:17','2025-09-08 20:44:44','2025-09-09 00:01:17'),
 (12,12,22,'2025-09-08 22:32:24','2025-09-08 22:32:24','2025-09-08 22:32:24'),
 (15,1,14,'2025-09-09 17:22:32','2025-09-09 17:22:32','2025-09-09 17:22:32'),
 (16,1,24,'2025-09-10 12:29:42','2025-09-10 12:29:42','2025-09-10 12:29:42'),
 (17,1,22,'2025-09-10 14:59:49','2025-09-10 14:59:49','2025-09-10 14:59:49'),
 (18,1,6,'2025-09-10 15:15:57','2025-09-10 15:02:16','2025-09-10 15:15:57'),
 (19,1,5,'2025-09-10 15:08:59','2025-09-10 15:08:59','2025-09-10 15:08:59'),
 (20,1,10,'2025-09-10 15:38:02','2025-09-10 15:38:02','2025-09-10 15:38:02'),
 (21,19,24,'2025-09-10 17:52:20','2025-09-10 17:52:20','2025-09-10 17:52:20'),
 (22,19,25,'2025-09-10 18:44:45','2025-09-10 17:53:18','2025-09-10 18:44:45');
/*!40000 ALTER TABLE `recently_viewed_products` ENABLE KEYS */;


--
-- Definition of table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) VALUES 
 ('6zYltBMibJttQOBfpZkoVRMbmbybYmSWPa2STrQB',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzlCekx1WEhlYWtTTlNiQkljM05DNFFOMU9DVnV0OERLcHF1QThNbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fX0=',1757510028),
 ('HmM8msDBmeBTuGUTGzRO24XrJV5kWjKmG8HKMvv3',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXZ0Q243R2trd0tFYWVTUWdiRDFycmh1WUhvSHllak5uOGpMWERxdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1757509290);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`email`,`email_verified_at`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (1,'Naiyem','naiyem@gmail.com','2025-09-02 15:01:02','$2y$12$9oIIfcGEQN5D3jW4AZGozOt26xO6psha3viR/4DMmaaT6Z7dz6rUi','admin','hW3gHYev3y5tg8SE7glrLn4mQNLEzNCaSZfQZ43ZojcC8LHJ3mnc3NQXD85B','2025-08-02 15:01:02','2025-09-02 15:01:02'),
 (2,'Mrs. Clara Goldner','jaskolski.maverick@example.net','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','bfQqlj8p2q','2025-07-02 15:01:02','2025-09-02 15:01:02'),
 (3,'Emelia Nitzsche','mhowe@example.com','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','qmrPaWx2yS','2025-06-02 15:01:02','2025-09-02 15:01:02'),
 (4,'Cecilia Block','wstroman@example.org','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','6bXfuuTZYM','2025-05-02 15:01:02','2025-09-02 15:01:02'),
 (5,'Ralph Blick','carleton98@example.com','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','GAo6IdzR2m','2025-05-02 15:01:02','2025-09-02 15:01:02'),
 (6,'Dr. Mina Langosh','keeling.derick@example.com','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','4M0U3TyVmC','2025-07-02 15:01:02','2025-09-02 15:01:02'),
 (7,'Mr. Sage Hane','agoodwin@example.com','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','4pQGTInjSV','2025-06-02 15:01:03','2025-09-02 15:01:03'),
 (8,'Bernadine Murray Sr.','alfonzo.anderson@example.org','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','eSHHSgf2YV','2025-05-02 15:01:03','2025-09-02 15:01:03'),
 (9,'Deion Welch','randal.murray@example.net','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','Jo7MMRLGVv','2025-06-02 15:01:03','2025-09-02 15:01:03'),
 (10,'Melba Haag','hermann.matteo@example.net','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','PTJYDqAHSd','2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (11,'Maximillian Homenick V','feichmann@example.net','2025-09-02 15:01:02','$2y$12$FehhNZEozaG2VAq9cMqqbO.tJRAbID8Aaw8zS4zHerEaKIz2mPgHq','user','sqhDbA0Ijw','2025-09-02 15:01:03','2025-09-02 15:01:03'),
 (12,'Leo','leo@gmail.com','2025-09-02 15:01:02','$2y$12$bqV/fQ7dGMYT0rPPFbn06O7Sbj6rrOlmAi5S8JxWhwiZYzAOuMHeu','user',NULL,'2025-09-03 03:47:56','2025-09-03 03:47:56'),
 (13,'Indira Blair','ronetitoh@mailinator.com',NULL,'$2y$12$L4Kqfq5/e.C.7nB0tCFwseJhWUz4JhfmjExGdKHeARKGmMEg0Cl42','user',NULL,'2025-09-08 00:29:22','2025-09-08 00:29:22'),
 (14,'Josiah Bryant','o3g9w64fj8@xkxkud.com',NULL,'$2y$12$qC7kJ9x8b9AOEpYeC1T1gO1jevAY5tHL4aFzBjAVpl.IVd2OiYNqu','user',NULL,'2025-09-08 00:47:46','2025-09-08 00:47:46'),
 (15,'Medge Saunders','dz2kijrhxm@wyoxafp.com',NULL,'$2y$12$LZ.z/bZAnCgS4TcB5d/VveDIfyBWL9TbvsZVaaFW3MqpI4R19T36u','user',NULL,'2025-09-08 01:00:02','2025-09-08 01:00:02'),
 (16,'Tanisha Hernandez','leo@bwmyga.com',NULL,'$2y$12$V8GpqNKhJvJj6gDvMI1Fhu3/MNVrhitsubjD5Sh3QprF1p7z./GNe','user',NULL,'2025-09-08 17:49:30','2025-09-08 17:49:30'),
 (17,'Abdul Kuddus','abdul.kuddus@gmail.com',NULL,'$2y$12$dy3gdEwlKN1gWMMV6MBO2eANsyEXaw1MaL6bsBJacjgnYy1XNYrNm','user',NULL,'2025-09-08 18:10:44','2025-09-08 18:10:44'),
 (19,'Veda Roman','kolerytyb@mailinator.com',NULL,'$2y$12$Wj3LHGMISZOoHsmiAlpCLe7atTmmDi8Lz0.PtDyal1z.OdaV./J4O','user',NULL,'2025-09-10 17:51:16','2025-09-10 17:51:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` (`id`,`user_id`,`product_id`,`created_at`,`updated_at`) VALUES 
 (6,12,22,'2025-09-07 17:35:59','2025-09-07 17:35:59'),
 (8,14,25,'2025-09-08 00:53:50','2025-09-08 00:53:50'),
 (9,15,4,'2025-09-08 01:14:18','2025-09-08 01:14:18'),
 (10,17,25,'2025-09-08 19:34:13','2025-09-08 19:34:13'),
 (23,12,25,'2025-09-10 17:34:46','2025-09-10 17:34:46'),
 (25,19,24,'2025-09-10 17:52:26','2025-09-10 17:52:26');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
