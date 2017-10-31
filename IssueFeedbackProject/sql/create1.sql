SELECT * FROM db_issue.t_dept_permission;

CREATE TABLE `t_comment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` text,
  `is_resovled_issue` tinyint(4) DEFAULT '0',
  `is_problem` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user_id`),
  KEY `fk_user_idx1111` (`user_id`),
  CONSTRAINT `fk_user_com` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

CREATE TABLE `t_comment_image` (
  `id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_img_11_idx` (`image_id`),
  KEY `fk_comm_idx` (`comment_id`),
  CONSTRAINT `fk_comm` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_img_11` FOREIGN KEY (`image_id`) REFERENCES `t_image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `leader_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dept_user_idx` (`leader_id`),
  CONSTRAINT `fk_dept_user` FOREIGN KEY (`leader_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `t_dept_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dept_per_idx` (`dept_id`),
  KEY `fk_per_id_idx` (`permission_id`),
  CONSTRAINT `fk_dept_per` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_per_id` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

CREATE TABLE `t_dept_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dept_id_idx` (`dept_id`),
  KEY `fk_project_id_idx` (`project_id`),
  CONSTRAINT `fk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `year` int(11) DEFAULT '2017',
  `is_top` tinyint(1) DEFAULT '0',
  `project_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_issue_user_idx` (`user_id`),
  KEY `fk_issue_status_idx` (`status_id`),
  KEY `fk_project_idx` (`project_id`),
  CONSTRAINT `fk_issue_status` FOREIGN KEY (`status_id`) REFERENCES `t_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issue_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `comment_id` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_id_idx` (`issue_id`),
  KEY `fk_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `t_issue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fork_iss_id_idx` (`issue_id`),
  KEY `fork_img_id_idx` (`image_id`),
  CONSTRAINT `fork_img_id` FOREIGN KEY (`image_id`) REFERENCES `t_image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fork_iss_id` FOREIGN KEY (`issue_id`) REFERENCES `t_issue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `week_of_year` int(11) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `t_issue_statistics_statistics_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statistics_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_idx` (`statistics_id`),
  KEY `fk_item_idx` (`item_id`),
  CONSTRAINT `fk_issue` FOREIGN KEY (`statistics_id`) REFERENCES `t_issue_statistics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item` FOREIGN KEY (`item_id`) REFERENCES `t_statistics_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_dept_id_idx` (`dept_id`),
  CONSTRAINT `pk_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `t_dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `t_statistics_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_item_idx` (`status_id`),
  CONSTRAINT `fk_status_item` FOREIGN KEY (`status_id`) REFERENCES `t_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
 GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
 FLUSH PRIVILEGES;