 CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `create_time` text,
  `is_resovled_issue` tinyint(4) DEFAULT '0',
  `is_problem` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

CREATE TABLE `t_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_idx` (`comment_id`),
  KEY `fk_image_idx` (`image_id`),
  CONSTRAINT `fk_comment` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image` FOREIGN KEY (`image_id`) REFERENCES `t_image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dept_user_idx` (`leader_id`),
  CONSTRAINT `fk_dept_user` FOREIGN KEY (`leader_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `t_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `submit_time` text NOT NULL,
  `submit_time_stamp` timestamp NULL DEFAULT NULL,
  `last_update_time` text,
  `is_deleted` tinyint(1) DEFAULT '1',
  `resolved_time` text,
  `week_of_year` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_issue_user_idx` (`user_id`),
  KEY `fk_issue_status_idx` (`status_id`),
  CONSTRAINT `fk_issue_status` FOREIGN KEY (`status_id`) REFERENCES `t_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issue_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_id_idx` (`issue_id`),
  KEY `fk_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `t_issue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `week_of_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_statistics_statistics_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statistics_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_statistics_id` FOREIGN KEY (`id`) REFERENCES `t_issue_statistics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_statistics_item` FOREIGN KEY (`id`) REFERENCES `t_statistics_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_statistics_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_item_idx` (`status_id`),
  CONSTRAINT `fk_status_item` FOREIGN KEY (`status_id`) REFERENCES `t_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `real_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `fk_user_dept_idx` (`dept_id`),
  CONSTRAINT `fk_user_dept` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
