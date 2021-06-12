SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `version` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_ix1` (`username`),
  UNIQUE KEY `user_ix2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9764792275404770 DEFAULT CHARSET=utf8;

INSERT INTO `user` VALUES (1,'admin','{bcrypt}$2a$10$9n2jxj4cP0Byc5ldbmHb9ex6iNuY8K1S22YYs0RqTOXKgtockLBcS','admin@example.com',_binary '',_binary '\0',_binary '\0',_binary '\0','1970-01-01 00:00:00','1970-01-01 00:00:00',0),(12121212,'sudha','{bcrypt}$2a$10$QV.PbalLOaCscogpkZIZfu.RAun7yA1GT5CJWpBSFZhVchWdUlOqa','sudha@gmail.com',_binary '',_binary '\0',_binary '\0',_binary '\0','2020-07-05 00:10:01','2020-07-05 00:10:01',1),(121212127,'sai','{bcrypt});

//id in user table becomes user_id in the below table
SET character_set_client = utf8mb4 ;
CREATE TABLE `role_user` (
  `role_id` bigint NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `version` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_reln` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sid` bigint NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `role_id` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `authorized_by` bigint NOT NULL,
  `contact_address` varchar(2000) DEFAULT NULL,
  `contact_numbers` varchar(1000) DEFAULT NULL,
  `date_registered` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;' ||
 '


SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'role_admin','2020-01-01 00:00:00','1970-01-01 00:00:00',0);

 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `role_user` VALUES (1,1,'1970-01-01 00:00:00','1970-01-01 00:00:00',0);

//ID from User table is used as SID in the below table.
 SET character_set_client = utf8mb4 ;
CREATE TABLE `online_store_profile` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `business_title` varchar(500) NOT NULL COMMENT 'Name of your shop',
  `sid` varchar(45) NOT NULL,
  `top_label_logo1` varchar(500) DEFAULT NULL,
  `top_label_logo2` varchar(500) DEFAULT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `site_owner_email` varchar(100) DEFAULT NULL,
  `left_top_nav_label` varchar(45) DEFAULT NULL,
  `footer_display_msg` varchar(500) DEFAULT NULL,
  `copyrights_msg` varchar(500) DEFAULT NULL,
  `banner1_lbl_top` varchar(100) DEFAULT NULL,
  `banner1_lbl_middle` varchar(100) DEFAULT NULL,
  `banner1_lbl_bottom` varchar(100) DEFAULT NULL,
  `index_html_page` mediumtext,
  `checkout_html_page` mediumtext,
  `login_html_page` mediumtext,
  `item_html_page` mediumtext,
  `login_div_page` mediumtext,
  `domain` mediumtext,
  `updated_On` datetime DEFAULT NULL,
  `domain_deploy_path` varchar(1000) DEFAULT NULL,
  `business` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `sid_UNIQUE` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

