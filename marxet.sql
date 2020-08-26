CREATE TABLE `marxet_trading` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marxet_id` varchar(10) NOT NULL,
  `requestor_uid` varchar(64) NOT NULL,
  `show_name` tinyint(1) NOT NULL DEFAULT '0',
  `listed_classname` varchar(128) NOT NULL,
  `listed_properties` text NOT NULL,
  `requested` text NOT NULL,
  `buyer_uid` varchar(64) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bought_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marxet_id_UNIQUE` (`marxet_id`),
  KEY `account_idk_idx` (`requestor_uid`),
  CONSTRAINT `account_idk` FOREIGN KEY (`requestor_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `marxet_auction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marxet_id` varchar(10) NOT NULL,
  `seller_uid` varchar(64) NOT NULL,
  `listed_classname` varchar(128) NOT NULL,
  `listed_properties` text NOT NULL,
  `starting_price` int(10) unsigned NOT NULL DEFAULT '0',
  `current_price` int(10) unsigned NOT NULL DEFAULT '0',
  `bid_count` int(10) unsigned NOT NULL DEFAULT '0',
  `bidder_uid` varchar(64) NOT NULL,
  `bid_history` text NOT NULL,
  `closing_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_id_UNIQUE` (`marxet_id`),
  KEY `account_idx` (`seller_uid`),
  CONSTRAINT `account` FOREIGN KEY (`seller_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
