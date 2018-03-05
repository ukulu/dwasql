-- --------------------------------------------------------
-- Host:                         jupiter
-- Server Version:               5.6.35-log - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für test_upday
DROP DATABASE IF EXISTS `test_upday`;
CREATE DATABASE IF NOT EXISTS `test_upday` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_upday`;

-- Exportiere Struktur von Tabelle test_upday.screen_flows
DROP TABLE IF EXISTS `screen_flows`;
CREATE TABLE IF NOT EXISTS `screen_flows` (
  `session_id` varchar(255) NOT NULL,
  `at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name_1` enum('E1','E2','E3','E4') NOT NULL,
  `duration_1` int(10) unsigned NOT NULL DEFAULT '0',
  `event_count_1` int(10) unsigned NOT NULL DEFAULT '0',
  `name_2` enum('E1','E2','E3','E4') NOT NULL,
  `duration_2` int(10) unsigned NOT NULL DEFAULT '0',
  `event_count_2` int(10) unsigned NOT NULL DEFAULT '0',
  `name_3` enum('E1','E2','E3','E4') NOT NULL,
  `duration_3` int(10) unsigned NOT NULL DEFAULT '0',
  `event_count_3` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle test_upday.screen_flows: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `screen_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_flows` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle test_upday.session_events
DROP TABLE IF EXISTS `session_events`;
CREATE TABLE IF NOT EXISTS `session_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `session_id` varchar(256) NOT NULL DEFAULT '0',
  `event_name` enum('E1','E2','E3','E4') NOT NULL DEFAULT 'E1',
  `event_duration` int(11) NOT NULL DEFAULT '0',
  `at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle test_upday.session_events: ~11 rows (ungefähr)
/*!40000 ALTER TABLE `session_events` DISABLE KEYS */;
INSERT INTO `session_events` (`id`, `user_id`, `session_id`, `event_name`, `event_duration`, `at`) VALUES
	(1, '1000', 'sess-1', 'E1', 5, '2018-03-04 19:13:50'),
	(2, '1000', 'sess-1', 'E2', 6, '2018-03-04 19:13:56'),
	(3, '1000', 'sess-1', 'E3', 6, '2018-03-04 19:14:02'),
	(4, '1001', 'sess-2', 'E2', 10, '2018-03-04 19:11:00'),
	(5, '1001', 'sess-2', 'E2', 5, '2018-03-04 19:11:10'),
	(6, '1001', 'sess-2', 'E3', 6, '2018-03-04 19:11:15'),
	(7, '1001', 'sess-2', 'E4', 6, '2018-03-04 19:11:33'),
	(8, '1001', 'sess-2', 'E3', 6, '2018-03-04 19:11:21'),
	(9, '1001', 'sess-2', 'E3', 6, '2018-03-04 19:11:27'),
	(10, '1001', 'sess-2', 'E3', 6, '2018-03-04 19:11:39'),
	(11, '1001', 'sess-2', 'E3', 6, '2018-03-04 19:11:45');
/*!40000 ALTER TABLE `session_events` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
