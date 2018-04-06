/*DROP DATABASE IF EXISTS `mydb`;
CREATE DATABASE `mydb` /*!40100 DEFAULT CHARACTER SET utf8;
*/
use `mydb`;

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `idFavorites` int(11) NOT NULL,
  `Users_idUsers` int(11) NOT NULL,
  `Tweets_Tweet_PrimaryKey` int(11) NOT NULL,
  PRIMARY KEY (`idFavorites`),
  KEY `fk_Favorites_Users1_idx` (`Users_idUsers`),
  KEY `fk_Favorites_Tweets1_idx` (`Tweets_Tweet_PrimaryKey`),
  CONSTRAINT `fk_Favorites_Tweets1` FOREIGN KEY (`Tweets_Tweet_PrimaryKey`) REFERENCES `tweets` (`Tweet_PrimaryKey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favorites_Users1` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `following`;
CREATE TABLE `following` (
  `Users_idUsers_followed` int(11) NOT NULL,
  `Users_idUsers_follower` int(11) NOT NULL,
  KEY `fk_Following_Users1_idx` (`Users_idUsers_followed`),
  KEY `fk_Following_Users2_idx` (`Users_idUsers_follower`),
  CONSTRAINT `fk_Following_Users1` FOREIGN KEY (`Users_idUsers_followed`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Following_Users2` FOREIGN KEY (`Users_idUsers_follower`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `retweet`;
CREATE TABLE `retweet` (
  `Users_idUsers` int(11) NOT NULL,
  `Tweets_Tweet_PrimaryKey` int(11) NOT NULL,
  `Date` datetime(6) DEFAULT NULL,
  KEY `fk_Retweet_Messages_idx` (`Tweets_Tweet_PrimaryKey`),
  KEY `fk_Retweet_Users1_idx` (`Users_idUsers`),
  CONSTRAINT `fk_Retweet_Messages` FOREIGN KEY (`Tweets_Tweet_PrimaryKey`) REFERENCES `tweets` (`Tweet_PrimaryKey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Retweet_Users1` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tweets`;
CREATE TABLE `tweets` (
  `Tweet_PrimaryKey` int(11) NOT NULL,
  `Content` varchar(45) DEFAULT NULL,
  `Date` datetime(6) DEFAULT NULL,
  `Users_idUsers` int(11) NOT NULL,
  PRIMARY KEY (`Tweet_PrimaryKey`),
  KEY `fk_Messages_Users1_idx` (`Users_idUsers`),
  CONSTRAINT `fk_Messages_Users1` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

