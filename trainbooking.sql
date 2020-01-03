/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - test2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test2`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookID` int(10) NOT NULL AUTO_INCREMENT,
  `tripID` varchar(10) DEFAULT NULL,
  `userID` int(10) DEFAULT NULL,
  `seats` int(10) DEFAULT NULL,
  `charge` int(10) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bookID`,`tripID`,`userID`,`seats`,`charge`,`userName`) values (47,'D901',NULL,24,24000,'jiangyouzhi'),(49,'G5',NULL,20,22220,'jiangyouzhi'),(51,'Z201',NULL,24,10944,'jiangyouzhi');

/*Table structure for table `detailed` */

DROP TABLE IF EXISTS `detailed`;

CREATE TABLE `detailed` (
  `tripNum` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `date` int(255) DEFAULT NULL,
  `depTime` varchar(255) DEFAULT NULL,
  `arriveTime` varchar(255) DEFAULT NULL,
  `StationOrder` varchar(255) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `detailed` */

/*Table structure for table `site` */

DROP TABLE IF EXISTS `site`;

CREATE TABLE `site` (
  `trip` varchar(255) NOT NULL,
  `StationOrder` int(255) NOT NULL,
  `arrivTime` varchar(255) DEFAULT NULL,
  `depTime` varchar(255) DEFAULT NULL,
  `ID` int(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `price` int(255) DEFAULT NULL,
  PRIMARY KEY (`trip`,`StationOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `site` */

/*Table structure for table `train` */

DROP TABLE IF EXISTS `train`;

CREATE TABLE `train` (
  `trainNumber` int(10) NOT NULL,
  `seats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trainNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `train` */

/*Table structure for table `trips` */

DROP TABLE IF EXISTS `trips`;

CREATE TABLE `trips` (
  `trainNum` int(10) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `depTime` varchar(255) DEFAULT NULL,
  `arrivTime` varchar(255) DEFAULT NULL,
  `totaltime` varchar(255) DEFAULT NULL,
  `seats` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `tripNum` varchar(255) NOT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`tripNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `trips` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `userID` int(10) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`name`,`email`,`userName`,`password`,`type`,`userID`) values ('吸血鬼后裔','2217991646@qq.com','321312','132','admin',NULL),('将优质','jiangyouzhi@qq.com','jiangyouzhi','123','user',NULL),('叫人站','456487979@qq.com','jiaorenzhan','123','user',NULL),('jjjj','222196868@qq.com','jjjjj','123','user',NULL),('刘德华','2217991646@qq.com','liudehua','123','admin',NULL),('刘宇','2217991646@qq.com','liuyu','123','user',NULL),('李云龙','8465132@163.com','liyunlong','123','user',NULL),('魔兽世界','2217991646@qq.com','moshou','123','user',NULL),('噫噫噫','sssss@qq.com','wangjianglin','123','admin',NULL),('王忠波','6512344651@qq.com','wangzhongbo','123','user',NULL),('杨港','2217991646@qq.com','yanggang','123','admin',NULL),('张宝','2217991646@qq.com','zhangbao','123','user',NULL),('张文亮','123456789@qq.com','zhangwenliang','123','admin',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
