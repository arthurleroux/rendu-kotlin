# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# H�te: 0.0.0.0 (MySQL 5.7.25)
# Base de donn�es: homestead
# Temps de g�n�ration: 2019-03-17 16:43:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;

INSERT INTO `articles` (`id`, `title`, `text`)
VALUES
	(13,'« Gilets jaunes » : 80 enseignes endommagées à Paris, le gouvernement sous le feu des critiques','Boutiques pillées sur les Champs-Elysées, jets de pavés sur les forces de l’ordre, immeuble incendié : pour son acte XVIII, la mobilisation des « gilets jaunes » a été de nouveau marquée par des violences à Paris qui ont abouti à 200 gardes à vue, a-t-on appris dimanche 17 mars auprès du parquet de Paris. Ces gardes à vue concernent 185 personnes majeures et 15 mineurs, précise-t-on de même source.\r\n\r\nLa brasserie Le Fouquet’s, des enseignes de prêt-à-porter (Celio, Lacoste, Hugo Boss), le chocolatier Jeff de Bruges, le magasin du fabricant chinois de smartphones Xiaomi… Ce sont en tout quatre-vingts enseignes qui ont été endommagées, dont une vingtaine pillées ou touchées par des départs d’incendie, ont estimé dimanche les commerçants de l’avenue.'),
	(14,'« Grande America » : la Charente-Maritime se prépare à une marée noire','Quand et où arrivera-t-elle ? Ces deux questions taraudent les départements de Gironde et de Charente-Maritime, vers lesquels se dirige une nappe d’environ 5 km2 de fioul lourd échappé du cargo Grande America après son naufrage, le 12 mars, à près de 330 km au large de La Rochelle.\r\n\r\nDifficile de répondre à l’une et l’autre tant les conditions météo, vent fort et mer agitée sans parler des puissants courants du golfe de Gascogne, ne sont guère favorables, y compris pour la flotte chargée des opérations antipollution, qui ont cependant commencé dès vendredi 15 mars dans l’après-midi.'),
	(15,'Mondiaux de biathlon : Antonin Guigonnat en argent sur la mass start','Dans des conditions climatiques très difficiles, Antonin Guigonnat a décroché à Ostersund (Suède) la médaille d’argent de la mass start, dimanche 17 mars. Alors qu’il était mal parti sur les premiers tirs couchés, au contraire de son compatriote Simon Desthieux, longtemps en tête, le Français de 27 ans a réussi à refaire son retard en toute fin de course.\r\n\r\n');

/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `article_id`, `text`)
VALUES
	(50,13,'Il y a eu beaucoup de dégâts !'),
	(51,13,'Ca va coûter cher'),
	(53,14,'Ouille'),
	(54,14,'Pas cool la pollution '),
	(56,15,'Bien joué Antonin !'),
	(57,15,'Belle performance ');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
