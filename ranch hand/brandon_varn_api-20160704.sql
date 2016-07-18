-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2016 at 07:25 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `brandon_varn_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_call_log`
--

CREATE TABLE IF NOT EXISTS `api_call_log` (
  `date` date NOT NULL,
  `api_key_id` varchar(60) NOT NULL,
  `api` varchar(100) NOT NULL,
  `no_of_calls` int(11) NOT NULL,
  `last_call_at` datetime NOT NULL,
  UNIQUE KEY `date` (`date`,`api_key_id`,`api`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_call_log`
--

INSERT INTO `api_call_log` (`date`, `api_key_id`, `api`, `no_of_calls`, `last_call_at`) VALUES
('2016-06-23', '1', 'items', 13, '2016-06-23 21:26:15'),
('2016-06-26', '1', 'items', 6, '2016-06-26 15:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE IF NOT EXISTS `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(60) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `key`, `full_name`, `email_address`, `telephone`, `created_at`, `created_by`, `status`) VALUES
(1, 'ssdcasda', 'V', 'V', 'V', '2016-06-23 21:25:19', 0, 0),
(2, '0KRHqjl2s6BkjVCJ9QB', 'Vinoth', 'deepasri47@ gmail.com', '994773168', '2016-07-04 22:52:35', 1, 0),
(3, 'UBghyEkhU81cFnO85eED', 'Vinoth', 'deepasri47@ gmail.com', '994773168', '2016-07-04 22:53:07', 1, 0),
(4, 'R41RbGTlQsJeZdv5njG0', 'Vinoth', 'deepasri47@ gmail.com', '994773168', '2016-07-04 22:53:54', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `created_by`) VALUES
(1, 'Grille Guards Legend Series	', '2016-06-20 21:28:58', 0),
(2, 'Push Bars	', '2016-06-20 21:30:10', 0),
(3, 'Front Bumper Replacements Legend Series	', '2016-06-20 21:30:27', 0),
(4, 'Front Bumper Replacements Summit Series	', '2016-06-20 21:30:35', 0),
(5, 'Winch Ready Front Bumper Replacements	', '2016-06-20 21:30:54', 0),
(7, 'Bullnose Front Bumper Replacement - Legend Series', '2016-06-20 21:31:38', 0),
(8, 'Summit Series', '2016-06-20 21:31:53', 0),
(9, 'Winch Mount Bullnose Bumper Replacements', '2016-06-20 21:32:13', 0),
(10, 'Jeep Products - Horizon Series  ', '2016-06-20 21:32:47', 0),
(11, 'Jeep Products - Sport Series', '2016-06-20 21:33:35', 0),
(12, 'Horizon Series - Front Bumpers', '2016-06-20 21:34:17', 0),
(13, 'Horizon Series - Back Bumpers', '2016-06-20 21:34:31', 0),
(14, 'Back Bumpers Replacements - Legend Series', '2016-06-20 21:34:49', 0),
(15, 'Sport Series - must have receiver hitch', '2016-06-20 21:35:03', 0),
(16, 'Headache Racks & Haulers (Bed Rails Required)', '2016-06-20 21:35:13', 0),
(17, 'BEDRAILS (For Use With Headpiece)', '2016-06-20 21:35:26', 0),
(18, 'Diamond Plate Toolboxes', '2016-06-20 21:35:36', 0),
(19, 'Steps', '2016-06-20 21:35:47', 0),
(20, 'Running Steps', '2016-06-20 21:35:58', 0),
(21, 'Miscellaneous  Products', '2016-06-20 21:36:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(25) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_login_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `name`, `email`, `telephone`, `created_at`, `created_by`, `last_login_at`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Adminsitrator', 'vino.gcs@gmail.com', '9994773168', '2015-06-04 15:46:06', 0, '2015-11-23 10:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `make` varchar(100) NOT NULL,
  `year` varchar(25) NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `part_number` varchar(50) NOT NULL,
  `net_weight` double NOT NULL,
  `gross_weight` double NOT NULL,
  `length` double NOT NULL,
  `width` double NOT NULL,
  `height` double NOT NULL,
  `tow_hooks` tinyint(1) NOT NULL,
  `factory_receiver` tinyint(1) NOT NULL,
  `fog_lights` tinyint(1) NOT NULL,
  `upc_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_number` (`part_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=369 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `make`, `year`, `model`, `description`, `part_number`, `net_weight`, `gross_weight`, `length`, `width`, `height`, `tow_hooks`, `factory_receiver`, `fog_lights`, `upc_code`) VALUES
(1, 1, 'Chevrolet', '15-16', '2500HD/3500HD (0 front park assist)', 'Legend Grille Guard', 'GGC151BL1', 120, 148, 85, 37, 31, 1, 0, 0, '848917004595'),
(2, 1, 'Chevrolet', '15-16', '2500HD/3500HD (for front park assist)', 'Legend Grille Guard', 'GGC151BLS', 117, 145, 85, 37, 31, 1, 0, 0, '848917004601'),
(3, 1, 'Chevrolet', '15-16', 'Tahoe/Suburban (Does 0t accommodate sensors)', 'Legend Grille Guard', 'GGC15HBL1', 108, 136, 85, 36, 31, 1, 0, 0, '848917004830'),
(4, 1, 'Chevrolet', '2016', '1500 (0 front park assist)', 'Legend Grille Guard', 'GGC16HBL1', 125, 153, 85, 36, 31, 1, 0, 0, '848917005264'),
(5, 1, 'Chevrolet', '14-15', '1500 (0 front park assist)', 'Legend Grille Guard', 'GGC14HBL1', 125, 153, 85, 36, 31, 1, 0, 0, '848917004380'),
(6, 1, 'Chevrolet', '14-15', '1500 (for front park assist)', 'Legend Grille Guard', 'GGC14HBLS', 125, 153, 85, 36, 31, 1, 0, 0, '848917004397'),
(7, 1, 'Chevrolet', '11-14', '2500HD/3500HD', 'Legend Grille Guard', 'GGC111BL1', 128, 156, 85, 36, 31, 1, 0, 0, '848917000009'),
(8, 1, 'Chevrolet', '07.5-13', '1500', 'Legend Grille Guard', 'GGC08HBL1', 105, 138, 85, 36, 31, 1, 0, 0, '848917000016'),
(9, 1, 'Chevrolet', '07.5-10', '2500HD/3500HD', 'Legend Grille Guard', 'GGC081BL1', 130, 158, 85, 36, 31, 1, 0, 0, '848917000023'),
(10, 1, 'Chevrolet', '07-14', '1500 Tahoe/Suburban/Avalanche', 'Legend Grille Guard', 'GGC07HBL1', 99, 127, 85, 36, 31, 1, 0, 0, '848917000030'),
(11, 1, 'Chevrolet', '07-14', '2500 Suburban', 'Legend Grille Guard', 'GGC07TBL1', 101, 129, 85, 36, 31, 1, 0, 0, '848917000047'),
(12, 1, 'Chevrolet', '03-07', '1500 Classic/Avalanche (w/o body cladding)', 'Legend Grille Guard', 'GGC06HBL1', 118, 146, 85, 36, 31, 1, 0, 0, '848917000054'),
(13, 1, 'Chevrolet', '03-07', '1500HD/2500 Classic', 'Legend Grille Guard', 'GGC06TBL1', 124, 148, 85, 36, 31, 1, 0, 0, '848917000061'),
(14, 1, 'Chevrolet', '03-07', '2500HD/3500 Classic', 'Legend Grille Guard', 'GGC031BL1', 122, 150, 85, 36, 31, 1, 0, 0, '848917000078'),
(16, 1, 'Chevrolet', '99-02', '1500/ (00-06) 1500 Suburban/Tahoe', 'Legend Grille Guard', 'GGC99HBL1', 121, 149, 85, 36, 31, 1, 0, 0, '848917000092'),
(17, 1, 'Chevrolet', '99-02', '1500HD/2500/ (00-06) 2500 Suburban', 'Legend Grille Guard', 'GGC99TBL1', 121, 149, 85, 36, 31, 1, 0, 0, '848917000108'),
(19, 1, 'GMC', '15-16', '2500HD/3500HD (0 front park assist)', 'Legend Grille Guard', 'GGG151BL1', 117, 145, 85, 37, 31, 1, 0, 0, '848917004687'),
(20, 1, 'GMC', '15-16', '2500HD/3500HD (front park assist)', 'Legend Grille Guard', 'GGG151BLS', 113, 141, 85, 37, 31, 1, 0, 0, '848917004694'),
(21, 1, 'GMC', '14-15', '1500 (0 front park assist)', 'Legend Grille Guard', 'GGG14HBL1', 117, 145, 85, 36, 31, 1, 0, 0, '848917004526'),
(22, 1, 'GMC', '11-14', '2500HD/3500HD', 'Legend Grille Guard', 'GGG111BL1', 110, 143, 85, 36, 31, 1, 0, 0, '848917000122'),
(23, 1, 'GMC', '07.5-13', '1500 (Modifications needed to fit Denali)', 'Legend Grille Guard', 'GGG08HBL1', 102, 136, 85, 36, 31, 1, 0, 0, '848917000139'),
(24, 1, 'GMC', '07.5-10', '2500HD/3500HD', 'Legend Grille Guard', 'GGG081BL1', 117, 145, 85, 36, 31, 1, 0, 0, '848917000146'),
(25, 1, 'GMC', '07-14', '1500 Yukon/Yukon XL', 'Legend Grille Guard', 'GGG07HBL1', 98, 126, 85, 36, 31, 1, 0, 0, '848917000153'),
(26, 1, 'GMC', '07-14', '2500 Yukon XL', 'Legend Grille Guard', 'GGG07TBL1', 100, 128, 85, 36, 31, 1, 0, 0, '848917000160'),
(27, 1, 'GMC', '03-07', '1500 Classic', 'Legend Grille Guard', 'GGG03HBL1', 122, 150, 85, 36, 31, 1, 0, 0, '848917000177'),
(28, 1, 'GMC', '03-07', '1500HD/2500 Classic', 'Legend Grille Guard', 'GGG03TBL1', 122, 150, 85, 36, 31, 1, 0, 0, '848917000184'),
(29, 1, 'GMC', '03-07', '2500HD/3500 Classic', 'Legend Grille Guard', 'GGG031BL1', 125, 153, 85, 36, 31, 1, 0, 0, '848917000191'),
(30, 1, 'GMC', '01-02', '2500HD/3500', 'Legend Grille Guard', 'GGC011BL1', 124, 152, 85, 36, 31, 1, 0, 0, '848917000085'),
(31, 1, 'GMC', '99-02', '1500/ (00-06) 1500 Yukon/YukonXL', 'Legend Grille Guard', 'GGG99HBL1', 116, 144, 85, 36, 31, 1, 0, 0, '848917000214'),
(32, 1, 'GMC', '99-02', '1500HD/2500/ (00-06) 2500 YukonXL', 'Legend Grille Guard', 'GGG99TBL1', 116, 144, 85, 36, 31, 1, 0, 0, '848917000221'),
(33, 1, 'GMC', '88-98', '1500/2500/3500/ (92-99) Suburban/Yukon/Jimmy', 'Legend Grille Guard', 'GGC881BL1', 103, 131, 85, 36, 31, 1, 0, 0, '848917000238'),
(34, 1, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Legend Grille Guard', 'GGD101BL1', 128, 156, 85, 36, 31, 1, 0, 0, '848917000245'),
(35, 1, 'Dodge', '09-16', '1500 (Excluding Sport Series) (Sport will work on 13 & up)', 'Legend Grille Guard', 'GGD09HBL1', 125, 153, 85, 36, 31, 1, 0, 0, '848917000252'),
(36, 1, 'Dodge', '06-08', '1500 (Excluding 1500 Mega Cab)', 'Legend Grille Guard', 'GGD06HBL1', 115, 153, 85, 36, 31, 1, 0, 0, '848917000269'),
(37, 1, 'Dodge', '03-09', '2500/3500 & 1500 Mega Cab', 'Legend Grille Guard', 'GGD061BL1', 122, 150, 85, 36, 31, 1, 0, 0, '848917000276'),
(38, 1, 'Dodge', '02-05', '1500', 'Legend Grille Guard', 'GGD02HBL1', 115, 143, 85, 36, 31, 0, 0, 0, '848917000283'),
(39, 1, 'Dodge', '94-01', '1500/ (94-02) 2500/3500/(98-02 Excluding Sport Series)', 'Legend Grille Guard', 'GGD941BL1', 115, 143, 85, 36, 31, 0, 0, 0, '848917000290'),
(40, 1, 'Ford', '15-16', 'F150 (4x2 & 4x4) Will work with front camera', 'Legend Grille Guard', 'GGF15HBLC', 112, 140, 85, 36, 31, 1, 0, 0, '848917005240'),
(41, 1, 'Ford', '15-16', 'F150 (4x2 & 4x4)', 'Legend Grille Guard', 'GGF15HBL1', 112, 140, 85, 36, 31, 1, 0, 0, '848917004854'),
(42, 1, 'Ford', '11-16', 'F250/F350/F450/F550, (F450 & F550 require addl bolt kit - GGF114BP)', 'Legend Grille Guard', 'GGF111BL1', 120, 159, 85, 36, 31, 1, 0, 0, '848917000306'),
(43, 1, 'Ford', '09-14', 'F150', 'Legend Grille Guard', 'GGF09HBL1', 120, 148, 85, 36, 31, 1, 0, 0, '848917000313'),
(44, 1, 'Ford', '08-10', 'F250/F350/F450/F550 Superduty', 'Legend Grille Guard', 'GGF081BL1', 129, 157, 85, 36, 31, 1, 0, 0, '848917000320'),
(45, 1, 'Ford', '07-16', 'Expedition/ExpeditionEL (front parking sensors will 0t work ''12+)', 'Legend Grille Guard', 'GGF07HBL1', 98, 135, 85, 36, 31, 1, 0, 0, '848917000344'),
(46, 1, 'Ford', '04-08', 'F150', 'Legend Grille Guard', 'GGF06HBL1', 118, 142, 85, 36, 31, 1, 0, 0, '848917000351'),
(47, 1, 'Ford', '05-07', 'F250/F350/F450/F550 Superduty/ (05) Excursion', 'Legend Grille Guard', 'GGF051BL1', 114, 142, 85, 36, 31, 1, 0, 0, '848917000368'),
(48, 1, 'Ford', '03-06', 'Expedition', 'Legend Grille Guard', 'GGF03HBL1', 114, 135, 85, 36, 31, 1, 0, 0, '848917000375'),
(49, 1, 'Ford', '99-04', 'F250/F350/F450/F550 Superduty/ (00-04) Excursion', 'Legend Grille Guard', 'GGF99SBL1', 117, 145, 85, 36, 31, 1, 0, 0, '848917000382'),
(50, 1, 'Ford', '99-03', 'F150/F250/ (99-02) Expedition, (4X2 Only)', 'Legend Grille Guard', 'GGF992BL1', 106, 134, 85, 36, 31, 0, 0, 0, '848917000399'),
(51, 1, 'Ford', '99-03', 'F150/F250/ (99-02) Expedition, (4X4 Only)', 'Legend Grille Guard', 'GGF994BL1', 109, 137, 85, 36, 31, 1, 0, 0, '848917000405'),
(52, 1, 'Ford', '97-98', 'F150/F250/ Expedition, (4X2 Only)', 'Legend Grille Guard', 'GGF972BL1', 106, 134, 85, 36, 31, 0, 0, 0, '848917000412'),
(53, 1, 'Ford', '97-98', 'F150/F250/ Expedition, (4X4 Only)', 'Legend Grille Guard', 'GGF974BL1', 106, 134, 85, 36, 31, 1, 0, 0, '848917000429'),
(54, 1, 'Ford', '92-96', 'F150/F250/F350/ BRONCO/ 1997 F350', 'Legend Grille Guard', 'GGF921BL1', 127, 155, 85, 36, 31, 0, 0, 0, '848917000436'),
(55, 1, 'Ford', '2016+', 'Ford Explorer (Will 0t Fit Eco-Boost)', 'Legend Grille Guard', 'GGF16EBL1', 85, 113, 78, 36, 35, 0, 0, 0, '848917004984'),
(56, 1, 'Toyota', '14-16', 'Tundra (Regular, Double,Crew Max)', 'Legend Grille Guard', 'GGT14HBL1', 139, 154, 85, 36, 31, 1, 0, 0, '848917004533'),
(57, 1, 'Toyota', '07-13', 'Tundra (Regular, Double,Crew Max)', 'Legend Grille Guard', 'GGT07HBL1', 112, 145, 85, 36, 31, 1, 0, 0, '848917000443'),
(58, 1, 'Toyota', '04-06', 'Tundra (Double Cab Only)/ (01-04) Sequoia', 'Legend Grille Guard', 'GGT01HBL1', 109, 140, 85, 36, 31, 1, 0, 0, '848917000450'),
(59, 1, 'Toyota', '2016+', 'Tacoma', 'Legend Grille Guard', 'GGT16MBL1', 93, 121, 79, 36, 35, 1, 0, 0, '848917005233'),
(60, 1, 'Toyota', '05-15', 'Tacoma', 'Legend Grille Guard', 'GGT05MBL1', 89, 117, 85, 36, 31, 1, 0, 0, '848917000467'),
(65, 2, 'Chevrolet', '15-16', '2500HD/3500HD', 'Push Bar', 'PBC151BL1', 85, 113, 44, 36, 12, 1, 0, 0, '848917004656'),
(66, 3, 'Chevrolet', '15-16', '2500HD/3500HD', 'Legend Front Bumper', 'FBC151BLR', 260, 288, 86, 36, 37, 1, 0, 0, '848917004618'),
(67, 3, 'Chevrolet', '11-14', '2500HD/3500HD', 'Legend Front Bumper', 'FBC111BLR', 288, 312, 86, 36, 37, 1, 0, 0, '848917001105'),
(68, 3, 'Chevrolet', '7.5-10', '2500HD/3500HD', 'Legend Front Bumper', 'FBC081BLR', 266, 320, 86, 36, 37, 1, 0, 0, '848917001099'),
(69, 3, 'Chevrolet', '03-07', '2500HD/3500 Classic', 'Legend Front Bumper', 'FBC031BLR', 249, 272, 86, 36, 37, 1, 0, 0, '848917001112'),
(70, 3, 'Chevrolet', '01-02', '2500HD/3500', 'Legend Front Bumper', 'FBC011BLR', 267, 260, 86, 36, 37, 0, 0, 0, '848917001129'),
(72, 3, 'GMC', '15-16', '2500HD/3500HD', 'Legend Front Bumper', 'FBG151BLR', 255, 283, 86, 37, 37, 1, 0, 0, '848917004717'),
(73, 3, 'GMC', '11-14', '2500HD/3500HD', 'Legend Front Bumper', 'FBG111BLR', 270, 298, 86, 36, 37, 1, 0, 0, '848917001150'),
(74, 3, 'GMC', '7.5-10', '2500HD/3500HD', 'Legend Front Bumper', 'FBG081BLR', 270, 306, 86, 36, 37, 1, 0, 0, '848917001167'),
(75, 3, 'GMC', '03-07', '2500HD/3500 Classic', 'Legend Front Bumper', 'FBG031BLR', 266, 294, 86, 36, 37, 1, 0, 0, '848917001174'),
(76, 3, 'GMC', '01-02', '2500HD/3500', 'Legend Front Bumper', 'FBG011BLR', 258, 286, 86, 36, 37, 0, 0, 0, '848917001181'),
(77, 3, 'GMC', '88-98', '1500/2500/3500/ (92-99) Suburban/Jimmy/Yukon', 'Legend Front Bumper', 'FBC881BLR', 238, 248, 86, 36, 37, 1, 0, 0, '848917001211'),
(78, 3, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Legend Front Bumper', 'FBD101BLR', 275, 322, 86, 36, 37, 1, 0, 0, '848917001228'),
(79, 3, 'Dodge', '06-09', '2500/3500 & 1500 Mega Cab', 'Legend Front Bumper', 'FBD061BLR', 255, 303, 86, 36, 37, 1, 0, 0, '848917001235'),
(80, 3, 'Dodge', '03-05', '2500/3500', 'Legend Front Bumper', 'FBD031BLR', 255, 301, 86, 36, 37, 1, 0, 0, '848917001242'),
(81, 3, 'Dodge', '02-05', '1500', 'Legend Front Bumper', 'FBD02HBLR', 208, 246, 86, 36, 37, 0, 0, 0, '848917001259'),
(82, 3, 'Dodge', '94-01', '1500/ (94-02) 2500/3500, (98-02 Excluding Sport Series)', 'Legend Front Bumper', 'FBD941BLR', 226, 258, 86, 36, 37, 0, 0, 0, '848917001266'),
(83, 3, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Legend Front Bumper', 'FBF111BLR', 289, 308, 86, 36, 37, 1, 0, 0, '848917001273'),
(84, 3, 'Ford', '08-10', 'F250/F350/F450/F550 Superduty', 'Legend Front Bumper', 'FBF081BLR', 289, 317, 86, 36, 37, 1, 0, 0, '848917001280'),
(85, 3, 'Ford', '05-07', 'F250/F350/F450/F550 Superduty/ (05) Excursion', 'Legend Front Bumper', 'FBF051BLR', 260, 288, 86, 36, 37, 1, 0, 0, '848917001297'),
(86, 3, 'Ford', '99-04', 'F250/F350/F450/F550 Superduty/ (00-04) Excursion', 'Legend Front Bumper', 'FBF991BLR', 262, 273, 86, 36, 37, 1, 0, 0, '848917001303'),
(87, 3, 'Ford', '97-03', 'F-150/F-250/ (97-02) Expedition', 'Legend Front Bumper', 'FBF9X1BLR', 245, 253, 86, 36, 37, 1, 0, 0, '848917001310'),
(88, 3, 'Ford', '92-96', 'F150/F250/F350/ BRONCO/ 1997 F350', 'Legend Front Bumper', 'FBF921BLR', 246, 253, 86, 36, 37, 0, 0, 0, '848917001327'),
(89, 4, 'Chevrolet', '2016+', '1500', 'Summit Front Bumper', 'FSC16HBL1', 176, 204, 86, 36, 37, 1, 0, 0, '848917005271'),
(90, 4, 'Chevrolet', '15-16', '2500HD/3500HD', 'Summit Front Bumper', 'FSC151BL1', 203, 231, 86, 38, 37, 1, 0, 0, '848917004670'),
(91, 4, 'Chevrolet', '14-15', '1500', 'Summit Front Bumper', 'FSC14HBL1', 178, 206, 86, 36, 37, 1, 0, 0, '848917004465'),
(92, 4, 'Chevrolet', '11-14', '2500HD/3500HD', 'Summit Front Bumper', 'FSC111BL1', 240, 293, 86, 36, 37, 1, 0, 0, '848917001334'),
(93, 4, 'Chevrolet', '7.5-13', '1500', 'Summit Front Bumper', 'FSC08HBL1', 180, 211, 86, 36, 37, 1, 0, 0, '848917001341'),
(94, 4, 'Chevrolet', '7.5-10', '2500HD/3500HD', 'Summit Front Bumper', 'FSC081BL1', 238, 304, 86, 36, 37, 1, 0, 0, '848917001358'),
(95, 1, 'Chevrolet', '03-07', '1500 Classic/ Avalanche (w/o body cladding)', 'Summit Front Bumper', 'FSC03HBL1', 175, 209, 86, 36, 37, 1, 0, 0, '848917001365'),
(96, 1, 'Chevrolet', '03-07', '2500HD/3500 Classic', 'Summit Front Bumper', 'FSC031BL1', 198, 228, 86, 36, 37, 1, 0, 0, '848917001372'),
(97, 1, 'Chevrolet', '99-02', '1500/ (00-06) Suburban/Tahoe', 'Summit Front Bumper', 'FSC99HBL1', 165, 193, 86, 36, 37, 1, 0, 0, '848917001389'),
(98, 1, 'GMC', '15-16', '2500HD/3500HD', 'Summit Front Bumper', 'FSG151BL1', 204, 232, 86, 37, 37, 1, 0, 0, '848917004700'),
(99, 1, 'GMC', '14-15', '1500', 'Summit Front Bumper', 'FSG14HBL1', 178, 200, 86, 37, 37, 1, 0, 0, '848917004977'),
(100, 1, 'GMC', '11-14', '2500HD/3500HD', 'Summit Front Bumper', 'FSG111BL1', 234, 262, 86, 36, 37, 1, 0, 0, '848917001396'),
(101, 1, 'GMC', '7.5-13', '1500', 'Summit Front Bumper', 'FSG08HBL1', 175, 214, 86, 36, 37, 1, 0, 0, '848917001402'),
(102, 1, 'GMC', '7.5-10', '2500HD/3500HD', 'Summit Front Bumper', 'FSG081BL1', 234, 262, 86, 36, 37, 1, 0, 0, '848917001419'),
(103, 1, 'GMC', '03-07', '1500 Classic', 'Summit Front Bumper', 'FSG03HBL1', 175, 209, 86, 36, 37, 1, 0, 0, '848917001426'),
(104, 1, 'GMC', '03-07', '2500HD/3500 Classic', 'Summit Front Bumper', 'FSG031BL1', 195, 223, 86, 36, 37, 1, 0, 0, '848917001433'),
(105, 1, 'Dodge', '13-16', '1500 (Excluding Sport & Express)', 'Summit Front Bumper', 'FSD13HBL1', 180, 208, 86, 36, 37, 1, 0, 0, '848917003284'),
(106, 1, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Summit Front Bumper', 'FSD101BL1', 236, 263, 86, 36, 37, 1, 0, 0, '848917001440'),
(107, 1, 'Dodge', '09-12', '1500 (Excluding Sport Series)', 'Summit Front Bumper', 'FSD09HBL1', 180, 211, 86, 36, 37, 1, 0, 0, '848917001457'),
(108, 1, 'Dodge', '06-08', '1500 (Excluding 1500 Mega Cab)', 'Summit Front Bumper', 'FSD06HBL1', 178, 208, 86, 36, 37, 1, 0, 0, '848917001464'),
(109, 1, 'Dodge', '06-09', '2500/3500 & 1500 Mega Cab', 'Summit Front Bumper', 'FSD061BL1', 220, 253, 86, 36, 37, 1, 0, 0, '848917001471'),
(110, 1, 'Dodge', '03-05', '2500/3500', 'Summit Front Bumper', 'FSD031BL1', 220, 251, 86, 36, 37, 1, 0, 0, '848917001488'),
(111, 1, 'Ford', '15-16', 'F150', 'Summit Front Bumper', 'FSF15HBL1', 172, 200, 86, 36, 37, 1, 0, 0, '848917004892'),
(112, 1, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Summit Front Bumper', 'FSF111BL1', 230, 258, 86, 36, 37, 1, 0, 0, '848917001495'),
(113, 1, 'Ford', '09-14', 'F150', 'Summit Front Bumper', 'FSF09HBL1', 182, 212, 86, 36, 37, 1, 0, 0, '848917001501'),
(114, 1, 'Ford', '08-10', 'F250/F350/F450/F550 Superduty', 'Summit Front Bumper', 'FSF081BL1', 210, 261, 86, 36, 37, 1, 0, 0, '848917001518'),
(115, 1, 'Ford', '06-08', 'F150', 'Summit Front Bumper', 'FSF06HBL1', 170, 198, 86, 36, 37, 1, 0, 0, '848917001525'),
(116, 1, 'Ford', '05-07', 'F250/F350/F450/F550 Superduty/ (05) Excursion', 'Summit Front Bumper', 'FSF051BL1', 199, 227, 86, 36, 37, 1, 0, 0, '848917001532'),
(117, 1, 'Ford', '04-05', 'F150', 'Summit Front Bumper', 'FSF04HBL1', 170, 198, 86, 36, 37, 1, 0, 0, '848917001549'),
(118, 1, 'Ford', '99-04', 'F250/F350/F450/F550 Superduty/ (00-04) Excursion', 'Summit Front Bumper', 'FSF991BL1', 195, 223, 86, 36, 37, 1, 0, 0, '848917001556'),
(119, 1, 'Toyota', '14-16', 'Tundra (Regular, Double, Crew Max) (Excludes Limited)', 'Summit Front Bumper', 'FST14HBL1', 217, 245, 86, 36, 37, 1, 0, 0, '848917004557'),
(120, 1, 'Toyota', '07-13', 'Tundra (Regular, Double, Crew Max) (Excludes Limited)', 'Summit Front Bumper', 'FST07HBL1', 182, 228, 86, 36, 37, 1, 0, 0, '848917001563'),
(121, 5, 'Chevrolet', '15-16', '2500HD/3500HD', 'Sport Front Bumper - 15K winch rea', 'FBC155BLR', 298, 326, 86, 37, 37, 1, 0, 0, '848917004847'),
(122, 5, 'Chevrolet', '11-14', '2500HD/3500HD', 'Sport Front Bumper - 15K winch rea', 'FBC115BLR', 273, 336, 86, 36, 37, 1, 0, 0, '848917001587'),
(123, 5, 'Chevrolet', '7.5-10', '2500HD/3500HD', 'Sport Front Bumper - 15K winch rea', 'FBC085BLR', 301, 342, 86, 36, 37, 1, 0, 0, '848917001594'),
(124, 5, 'GMC', '11-14', '2500HD/3500HD', 'Sport Front Bumper - 15K winch rea', 'FBG115BLR', 301, 329, 86, 36, 37, 1, 0, 0, '848917001617'),
(125, 5, 'GMC', '7.5-10', '2500HD/3500HD', 'Sport Front Bumper - 15K winch rea', 'FBG085BLR', 305, 333, 86, 36, 37, 1, 0, 0, '848917001624'),
(126, 5, 'Dodge', '10-16', '2500/3500 & Mega Cab, 4500/5500 (11-16)', 'Sport Front Bumper - 15K winch rea', 'FBD105BLR', 313, 341, 86, 36, 37, 1, 0, 0, '848917001648'),
(127, 5, 'Dodge', '06-09', '2500/3500 & 1500 Mega Cab', 'Sport Front Bumper - 15K winch rea', 'FBD065BLR', 270, 318, 86, 36, 37, 1, 0, 0, '848917001662'),
(128, 5, 'Dodge', '03-05', '2500/3500', 'Sport Front Bumper - 15K winch rea', 'FBD035BLR', 270, 316, 86, 36, 37, 1, 0, 0, '848917001679'),
(129, 5, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Sport Front Bumper - 15K winch rea', 'FBF115BLR', 289, 344, 86, 36, 37, 1, 0, 0, '848917001686'),
(130, 5, 'Ford', '08-10', 'F250/F350/F450/F550 Superduty', 'Sport Front Bumper - 15K winch rea', 'FBF085BLR', 289, 337, 86, 36, 37, 1, 0, 0, '848917001693'),
(131, 5, 'Ford', '05-07', 'F250/F350/F450/F550 Superduty/ (05) Excursion', 'Sport Front Bumper - 15K winch rea', 'FBF055BLR', 230, 307, 86, 36, 37, 0, 0, 0, '848917001709'),
(132, 5, 'Ford', '99-04', 'F250/F350/F450/F550 Superduty/ (00-04) Excursion', 'Sport Front Bumper - 15K winch rea', 'FBF995BLR', 228, 298, 86, 36, 37, 0, 0, 0, '848917001716'),
(133, 7, 'Chevrolet', '15-16', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTC151BLR', 197, 225, 84, 36, 37, 1, 0, 0, '848917004779'),
(134, 7, 'Chevrolet', '11-14', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTC111BLR', 235, 268, 83, 36, 37, 1, 0, 0, '848917001723'),
(135, 1, 'Chevrolet', '7.5-10', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTC081BLR', 204, 270, 83, 36, 37, 1, 0, 0, '848917001730'),
(136, 1, 'Chevrolet', '03-07', '2500HD/3500 Classic', 'Legend Bull0se Front Bumper', 'BTC031BLR', 178, 231, 83, 36, 37, 1, 0, 0, '848917001754'),
(137, 1, 'GMC', '15-16', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTG151BLR', 200, 228, 84, 36, 37, 1, 0, 0, '848917004793'),
(138, 1, 'GMC', '11-14', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTG111BLR', 230, 260, 83, 36, 37, 1, 0, 0, '848917001785'),
(139, 1, 'GMC', '7.5-10', '2500HD/3500HD', 'Legend Bull0se Front Bumper', 'BTG081BLR', 205, 256, 83, 36, 37, 1, 0, 0, '848917001792'),
(140, 1, 'GMC', '03-07', '1500HD/2500/2500HD/3500 Classic', 'Legend Bull0se Front Bumper', 'BTG031BLR', 178, 225, 83, 36, 37, 1, 0, 0, '848917001815'),
(141, 1, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Legend Bull0se Front Bumper', 'BTD101BLR', 190, 312, 83, 36, 37, 1, 0, 0, '848917001822'),
(142, 1, 'Dodge', '06-09', '2500/3500 & 1500 Mega Cab', 'Legend Bull0se Front Bumper', 'BTD061BLR', 195, 243, 83, 36, 37, 1, 0, 0, '848917001839'),
(143, 1, 'Dodge', '03-05', '2500/3500', 'Legend Bull0se Front Bumper', 'BTD031BLR', 195, 243, 83, 36, 37, 1, 0, 0, '848917001846'),
(144, 1, 'Dodge', '94-01', '1500/ (94-02) 2500/3500 (98-02 Excluding Sport Series)', 'Legend Bull0se Front Bumper', 'BTD941BLR', 179, 203, 83, 36, 37, 0, 0, 0, '848917001860'),
(145, 1, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Legend Bull0se Front Bumper', 'BTF111BLR', 212, 243, 83, 36, 37, 1, 0, 0, '848917001877'),
(146, 1, 'Ford', '08-10', 'F250/F350/F450/F550 Superduty', 'Legend Bull0se Front Bumper', 'BTF081BLR', 212, 243, 83, 36, 37, 1, 0, 0, '848917001884'),
(147, 1, 'Ford', '05-07', 'F250/F350/F450/F550 Superduty/ (05) Excursion', 'Legend Bull0se Front Bumper', 'BTF051BLR', 185, 213, 83, 36, 37, 1, 0, 0, '848917001891'),
(148, 1, 'Ford', '99-04', 'F250/F350/F450/F550 Superduty/ (00-04) Excursion', 'Legend Bull0se Front Bumper', 'BTF991BLR', 186, 208, 83, 36, 37, 1, 0, 0, '848917001907'),
(149, 8, 'Chevrolet', '2016+', '1500', 'Summit Bull0se Front Bumper', 'BSC16HBL1', 137, 165, 83, 36, 37, 1, 0, 0, '848917005288'),
(150, 8, 'Chevrolet', '15-16', '2500HD/3500HD', 'Summit Bull0se Front Bumper', 'BSC151BL1', 150, 178, 84, 36, 37, 1, 0, 0, '848917004786'),
(151, 8, 'Chevrolet', '14-15', '1500', 'Summit Bull0se Front Bumper', 'BSC14HBL1', 133, 161, 83, 36, 37, 1, 0, 0, '848917004564'),
(152, 8, 'Chevrolet', '7.5-13', '1500', 'Summit Bull0se Front Bumper', 'BSC08HBL1', 149, 177, 83, 36, 37, 1, 0, 0, '848917001914'),
(153, 8, 'Chevrolet', '11-14', '2500HD/3500HD', 'Summit Bull0se Front Bumper', 'BSC111BL1', 190, 218, 83, 36, 37, 1, 0, 0, '848917003062'),
(154, 8, 'GMC', '15-16', '2500HD/3500HD', 'Summit Bull0se Front Bumper', 'BSG151BL1', 153, 181, 84, 36, 37, 1, 0, 0, '848917004809'),
(155, 8, 'GMC', '14-15', '1500', 'Summit Bull0se Front Bumper', 'BSG14HBL1', 137, 165, 84, 36, 37, 1, 0, 0, '848917004960'),
(156, 8, 'GMC', '7.5-13', '1500', 'Summit Bull0se Front Bumper', 'BSG08HBL1', 140, 174, 83, 36, 37, 1, 0, 0, '848917001921'),
(157, 8, 'Dodge', '13-16', '1500 (Excluding Sport & Express)', 'Summit Bull0se Front Bumper', 'BSD13HBL1', 135, 173, 83, 36, 37, 1, 0, 0, '848917003949'),
(158, 8, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Summit Bull0se Front Bumper', 'BSD101BL1', 193, 221, 83, 36, 37, 1, 0, 0, '848917004175'),
(159, 8, 'Dodge', '09-12', '1500', 'Summit Bull0se Front Bumper', 'BSD09HBL1', 135, 173, 83, 36, 37, 1, 0, 0, '848917001938'),
(160, 8, 'Ford', '15-16', 'F150', 'Summit Bull0se Front Bumper', 'BSF15HBL1', 135, 173, 83, 36, 37, 1, 0, 0, '848917004885'),
(161, 8, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Summit Bull0se Front Bumper', 'BSF111BL1', 165, 193, 83, 36, 37, 1, 0, 0, '848917001945'),
(162, 8, 'Ford', '09-14', 'F150', 'Summit Bull0se Front Bumper', 'BSF09HBL1', 120, 174, 83, 36, 37, 1, 0, 0, '848917001952'),
(163, 8, 'Ford', '06-08', 'F150', 'Summit Bull0se Front Bumper', 'BSF06HBL1', 115, 145, 83, 36, 37, 1, 0, 0, '848917001969'),
(164, 8, 'Ford', '04-05', 'F150', 'Summit Bull0se Front Bumper', 'BSF04HBL1', 115, 145, 83, 36, 37, 1, 0, 0, '848917001976'),
(165, 8, 'Toyota', '14-16', 'Toyota Tundra (excludes Limited)', 'Summit Bull0se Front Bumper', 'BST14HBL1', 152, 180, 83, 36, 37, 1, 0, 0, '848917004571'),
(166, 8, 'Toyota', '07-13', 'Toyota Tundra (excludes Limited)', 'Summit Bull0se Front Bumper', 'BST07HBL1', 145, 188, 83, 36, 37, 1, 0, 0, '848917001983'),
(167, 9, 'Chevrolet', '11-14', '2500HD/3500HD', 'Sport Bull0se Front Bumper - 15K', 'BTC115BLR', 239, 289, 83, 36, 37, 1, 0, 0, '848917002263'),
(168, 9, 'GMC', '11-14', '2500HD/3500HD', 'Sport Bull0se Front Bumper - 15K', 'BTG115BLR', 260, 293, 83, 36, 37, 1, 0, 0, '848917002287'),
(169, 9, 'Dodge', '10-16', '2500/3500 & Mega Cab', 'Sport Bull0se Front Bumper - 15K', 'BTD105BLR', 273, 305, 83, 36, 37, 1, 0, 0, '848917002300'),
(170, 9, 'Ford', '11-16', 'F250/F350/F450/F550 Superduty', 'Sport Bull0se Front Bumper - 15K', 'BTF115BLR', 250, 274, 83, 36, 37, 1, 0, 0, '848917002324'),
(171, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Bull0se Front Bumpe', 'BHJ071BMR', 85, 90, 70, 25, 12, 0, 0, 0, '848917004991'),
(172, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Back Bumper', 'HBJ071BML', 85, 88, 73, 25, 10, 0, 0, 0, '848917005004'),
(173, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Pushbar', 'PHJ071BMR', 64, 67, 42, 25, 12, 0, 0, 0, '848917005011'),
(174, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Shackle Brackets', 'SHJ071BP', 7, 9, 10, 8, 5, 0, 0, 0, '848917002386'),
(175, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Winch Plate', 'WHJ071BM1', 16, 15, 22, 9, 7, 0, 0, 0, '848917005059'),
(176, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Tire Carrier', 'TCJ071BM1', 37, 40, 52, 35, 10, 0, 0, 0, '848917005035'),
(177, 10, 'Jeep', '07-16', 'Jeep JK', 'Jeep Horizon Back Bumper for Tire', 'HBJ07CBML', 90, 93, 73, 25, 11, 0, 0, 0, '848917005028'),
(178, 11, 'Jeep', '07-16', 'Jeep JK', 'Jeep Sport Bull0se Front Bumper', 'BTJ071BLR', 116, 119, 70, 25, 15, 0, 0, 0, '848917002331'),
(179, 11, 'Jeep', '07-16', 'Jeep JK', 'Jeep Sport Winch Plate', 'WPJ071BL1', 16, 18, 22, 9, 6, 0, 0, 0, '848917002348'),
(180, 11, 'Jeep', '07-16', 'Jeep JK', 'Jeep Sport Back Bumper', 'BBJ071BLL', 85, 88, 73, 18, 10, 0, 0, 0, '848917002355'),
(181, 11, 'Jeep', '97-06', 'Jeep TJ Wrangler', 'Jeep Sport Bull0se Front Bumper', 'BTJ971BLR', 88, 91, 62, 21, 18, 0, 0, 0, '848917002416'),
(182, 11, 'Jeep', '97-06', 'Jeep TJ Wrangler', 'Jeep Sport Winch Plate', 'WPJ971BL1', 25, 27, 36, 9, 6, 0, 0, 0, '848917002423'),
(183, 11, 'Jeep', '97-06', 'Jeep TJ Wrangler', 'Jeep Sport Back Bumper', 'BBJ971BLL', 66, 69, 64, 12, 9, 0, 0, 0, '848917002430'),
(184, 11, 'Jeep', '97-06', 'Jeep TJ Wrangler', 'Jeep Sport Skid Plate', 'SPJ971BL1', 22, 25, 40, 17, 9, 0, 0, 0, '848917002447'),
(185, 12, 'Chevy', '2015+', '2500HD/3500HD', 'Horizon Bull0se with top ring', 'BHC151BMT', 161, 192, 81, 26, 31, 0, 0, 0, '848917005097'),
(186, 12, 'Chevy', '2015+', '2500HD/3500HD', 'Horizon Bull0se without top ring', 'BHC151BMN', 146, 177, 81, 26, 16, 0, 0, 0, '848917005103'),
(187, 12, 'GMC', '2015+', '2500HD/3500HD', 'Horizon Bull0se with top ring', 'BHG151BMT', 161, 192, 81, 26, 31, 0, 0, 0, '848917005226'),
(188, 12, 'GMC', '2015+', '2500HD/3500HD', 'Horizon Bull0se without top ring', 'BHG151BMN', 146, 177, 81, 26, 16, 0, 0, 0, '848917005219'),
(189, 12, 'Ford', '11-16', 'F250/F350/F450/F550 Super Duty', 'Horizon Bull0se with top ring', 'BHF111BMT', 141, 192, 80, 26, 24, 0, 0, 0, '848917005110'),
(190, 12, 'Ford', '11-16', 'F250/F350/F450/F550 Super Duty', 'Horizon Bull0se without top ring', 'BHF111BMN', 131, 182, 80, 26, 18, 0, 0, 0, '848917005127'),
(191, 12, 'Ford', '2015+', 'F150', 'Horizon Bull0se with top ring', 'BHF15HBMT', 127, 158, 78, 24, 23, 0, 0, 0, '848917005134'),
(192, 12, 'Ford', '2015+', 'F150', 'Horizon Bull0se without top ring', 'BHF15HBMN', 117, 148, 78, 24, 14, 0, 0, 0, '848917005141'),
(193, 12, 'Dodge', '10-16', '2500/3500', 'Horizon Bull0se with top ring', 'BHD101BMT', 124, 155, 81, 28, 24, 0, 0, 0, '848917005202'),
(194, 12, 'Dodge', '10-16', '2500/3500', 'Horizon Bull0se without top ring', 'BHD101BMN', 114, 145, 81, 28, 15, 0, 0, 0, '848917005196'),
(195, 13, 'Chevy/GMC', '2015+', '2500HD/3500HD', 'Horizon Back Bumper', 'HBC151BMSL', 105, 121, 77, 18, 12, 0, 1, 0, '848917005158'),
(196, 13, 'Ford', '11-16', 'F250/F350 Super Duty', 'Horizon Back Bumper', 'HBF111BMSL', 101, 117, 75, 20, 12, 0, 1, 0, '848917005165'),
(197, 13, 'Ford', '2015+', 'F150', 'Horizon Back Bumper', 'HBF15HBMSL', 86, 102, 74, 12, 12, 0, 1, 0, '848917005172'),
(198, 13, 'Dodge', '10-16', '2500/3500', 'Horizon Back Bumper', 'HBD101BMSL', 108, 124, 84, 18, 12, 0, 1, 0, '848917005189'),
(199, 14, 'Chevrolet/GMC', '11-14', '2500HD/3500HD', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBC110BLSL', 144, 147, 77, 18, 12, 0, 1, 0, '848917002461'),
(200, 14, 'Chevrolet/GMC', '07.5-10', '2500HD/3500HD', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBC080BLSL', 140, 143, 77, 18, 12, 0, 1, 0, '848917002485'),
(201, 14, 'Chevrolet/GMC', '01-07', '2500HD Classic', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBC010BLL', 141, 144, 77, 18, 12, 0, 1, 0, '848917002508'),
(202, 14, 'Chevrolet/GMC', '00-06', '1500/2500   Suburban/Tahoe/Yukon/YukonXL', 'Legend Back Bumper - 8",1/10', 'BBC008BLS', 143, 146, 77, 18, 12, 0, 1, 0, '848917002515'),
(203, 14, 'Chevrolet/GMC', '99-07', '1500/1500HD/2500 Classic', 'Legend Back Bumper - 8",1/10', 'BBC998BLS', 128, 131, 77, 18, 12, 0, 1, 0, '848917002522'),
(204, 14, 'Chevrolet/GMC', '88-98', '1500/2500/3500', 'Legend Back Bumper - 8",1/10', 'BBC888BLS', 128, 131, 77, 18, 12, 0, 1, 0, '848917002553'),
(205, 14, 'Dodge', '10-16', '2500/3500', 'Legend Back Bumper - 10",1/10 ,w/s', 'BBD100BLSS', 135, 138, 77, 18, 12, 0, 0, 0, '848917002560'),
(206, 1, 'Dodge', '10-16', '2500/3500', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBD100BLL', 135, 138, 77, 18, 12, 0, 0, 0, '848917002577'),
(207, 1, 'Dodge', '03-08', '1500 (03-09) 2500/3500', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBD030BLL', 140, 143, 77, 18, 12, 0, 0, 0, '848917002591'),
(208, 1, 'Dodge', '94-01', '1500/ (94-02) 2500/3500', 'Legend Back Bumper - 8",1/10', 'BBD948BLS', 132, 135, 77, 18, 12, 1, 0, 0, '848917002607'),
(209, 1, 'Ford', '08-15', 'F250/F350 Superduty', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBF080BLSL', 149, 152, 77, 18, 12, 1, 0, 0, '848917002621'),
(210, 1, 'Ford', '99-07', 'F250/F350 Superduty', 'Legend Back Bumper - 10",1/10 ,Lig', 'BBF050BLL', 149, 152, 77, 18, 12, 1, 0, 0, '848917002645'),
(211, 1, 'Ford', '81-96', 'F150/F250/F350/ 1997 F350', 'Legend Back Bumper - 8",5/5', 'BBF928BLS', 135, 138, 77, 18, 12, 1, 0, 0, '848917002683'),
(212, 15, 'Chevrolet/GMC', '15-16', '2500HD/3500HD', 'Sport Back Bumper - Lighted w/ sen', 'SBC151BLSL', 93, 96, 78, 18, 15, 0, 1, 0, '848917004588'),
(213, 15, 'Chevrolet/GMC', '14-16', '1500', 'Sport Back Bumper - Lighted w/ sen', 'SBC14HBLSL', 93, 96, 78, 18, 15, 0, 1, 0, '848917004472'),
(214, 15, 'Chevrolet/GMC', '11-14', '2500HD/3500HD', 'Sport Back Bumper - Lighted w/ sen', 'SBC111BLSL', 97, 100, 78, 18, 15, 0, 1, 0, '848917002690'),
(215, 15, 'Chevrolet/GMC', '7.5 -13', '1500', 'Sport Back Bumper - Lighted w/ sen', 'SBC08HBLSL', 93, 96, 78, 18, 15, 0, 1, 0, '848917002706'),
(216, 15, 'Chevrolet/GMC', '7.5 -10', '2500HD/3500HD', 'Sport Back Bumper - Lighted w/ sen', 'SBC081BLSL', 95, 98, 78, 18, 15, 0, 1, 0, '848917002713'),
(217, 15, 'Ford', '2016 +', 'F250/F350, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBF161BLSL', 94, 97, 78, 18, 15, 0, 1, 0, '848917005257'),
(218, 15, 'Ford', '15-16', 'F150, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBF15HBLSL', 87, 90, 78, 18, 15, 0, 1, 0, '848917004908'),
(219, 15, 'Ford', '09-14', 'F150, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBF09HBLSL', 87, 90, 78, 18, 15, 0, 1, 0, '848917002720'),
(220, 15, 'Ford', '08-15', 'F250/F350, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBF081BLSL', 94, 97, 78, 18, 15, 0, 1, 0, '848917002737'),
(221, 15, 'Ford', '06-08', 'F150, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBF06HBLSL', 87, 90, 78, 18, 15, 0, 1, 0, '848917002744'),
(222, 15, 'Dodge', '09-16', '1500/ (10-16) 2500/3500, Sensors', 'Sport Back Bumper - Lighted w/ sen', 'SBD09HBLSL', 86, 89, 78, 18, 15, 0, 1, 0, '848917002751'),
(223, 15, 'Dodge', '09-16', '1500/ (10-16) 2500/3500, Rear exhaust', 'Sport Back Bumper - Lighted w/ sen', 'SBD09HBLSLE', 86, 89, 78, 18, 15, 0, 1, 0, '848917002768'),
(224, 15, 'Dodge', '03-08', '1500/(03-09) 2500/3500 & 1500 Mega Cab', 'Sport Back Bumper - Lighted', 'SBD031BLL', 87, 90, 78, 18, 15, 0, 1, 0, '848917002775'),
(225, 15, 'Toyota', '14-16', 'Tundra (Regular, Double, Crew Max) Excludes Limited', 'Sport Back Bumper - Lighted', 'SBT14HBLL', 91, 94, 79, 22, 15, 0, 1, 0, '848917004540'),
(226, 15, 'Toyota', '07-13', 'Tundra (Regular, Double, Crew Max) Excludes Limited', 'Sport Back Bumper - Lighted', 'SBT071BLL', 85, 88, 78, 18, 15, 0, 1, 0, '848917002782'),
(227, 16, 'Chevrolet/GMC', '7.5-15', '1500/ (7.5-16) 2500/2500HD', 'Headache Rack 2" - fully louvered', 'HRC082BLF', 96, 99, 72, 30, 6, 0, 0, 0, '848917002850'),
(228, 16, 'Chevrolet/GMC', '7.5-15', '1500/ (7.5-16) 2500/2500HD', 'Headache Rack 2" - window cut', 'HRC082BLW', 87, 90, 72, 30, 6, 0, 0, 0, '848917002867'),
(229, 16, 'Chevrolet/GMC', '7.5-15', '1500/ (7.5-16) 2500/2500HD', 'Hauler - Lighted, fully louvered', 'HRC08HBLF', 105, 108, 72, 30, 6, 0, 0, 0, '848917002874'),
(230, 16, 'Chevrolet/GMC', '7.5-15', '1500/ (7.5-16) 2500/2500HD', 'Hauler - Lighted, window cut', 'HRC08HBLW', 95, 98, 72, 30, 6, 0, 0, 0, '848917002881'),
(232, 16, 'Dodge', '10-16', '2500/3500/ (09-16) 1500 Mega Cab, 1500 6'' & 8'' Bed', 'Headache Rack 2" - fully louvered', 'HRD102BLF', 97, 100, 72, 30, 6, 0, 0, 0, '848917002935'),
(233, 16, 'Dodge', '10-16', '2500/3500/ (09-16) 1500 Mega Cab, 1500 6'' & 8'' Bed', 'Headache Rack 2" - window cut', 'HRD102BLW', 85, 88, 72, 30, 6, 0, 0, 0, '848917002942'),
(234, 16, 'Dodge', '10-16', '2500/3500/ (09-16) 1500 Mega Cab, 1500 6'' & 8'' Bed', 'Hauler - Lighted, fully louvered', 'HRD10HBLF', 105, 108, 72, 30, 6, 0, 0, 0, '848917002959'),
(235, 16, 'Dodge', '10-16', '2500/3500/ (09-16) 1500 Mega Cab, 1500 6'' & 8'' Bed', 'Hauler - Lighted, window cut', 'HRD10HBLW', 94, 97, 72, 30, 6, 0, 0, 0, '848917002966'),
(237, 16, 'Dodge', '02-08', '1500/(03-09) 2500/3500 & 1500 Mega Cab', 'Headache Rack 2" - fully louvered', 'HRD022BLF', 109, 112, 72, 30, 6, 0, 0, 0, '848917003017'),
(239, 16, 'Ford', '99-16', 'F250/F350 Superduty', 'Headache Rack 2" - fully louvered', 'HRF992BLF', 113, 116, 72, 30, 6, 0, 0, 0, '848917003093'),
(240, 16, 'Ford', '99-16', 'F250/F350 Superduty', 'Headache Rack 2" - window cut', 'HRF992BLW', 113, 116, 72, 30, 6, 0, 0, 0, '848917003109'),
(241, 16, 'Ford', '99-16', 'F250/F350 Superduty', 'Hauler - Lighted, fully louvered', 'HRF99HBLF', 114, 117, 72, 30, 6, 0, 0, 0, '848917003116'),
(242, 16, 'Ford', '99-16', 'F250/F350 Superduty', 'Hauler - Lighted, window cut', 'HRF99HBLW', 129, 132, 72, 30, 6, 0, 0, 0, '848917003123'),
(248, 16, 'Ford', '92-96', 'F150/F250/F350', 'Headache Rack 2" - fully louvered', 'HRUNA2BLF', 113, 116, 72, 30, 6, 0, 0, 0, '848917003215'),
(249, 1, 'Toyota', '04-16', 'Tundra', 'Headache Rack 2" - fully louvered', 'HRF042BLF', 87, 90, 72, 30, 6, 0, 0, 0, '848917003130'),
(250, 1, 'Toyota', '04-16', 'Tundra', 'Headache Rack 2" - window cut', 'HRF042BLW', 79, 82, 72, 30, 6, 0, 0, 0, '848917003147'),
(251, 1, 'Toyota', '04-16', 'Tundra', 'Hauler - Lighted, fully louvered', 'HRF04HBLF', 93, 96, 72, 30, 6, 0, 0, 0, '848917003154'),
(252, 1, 'Toyota', '04-16', 'Tundra', 'Hauler - Lighted, window cut', 'HRF04HBLW', 84, 87, 72, 30, 6, 0, 0, 0, '848917003161'),
(253, 17, 'Chevrolet/GMC', '14-15', '1500/ (15-16) 2500/3500 HD 6''', 'Bed Rails - 6'', 0 Top Rail', 'BRC146BL1', 36, 60, 86, 12, 12, 0, 0, 0, '848917004496'),
(254, 17, 'Chevrolet/GMC', '14-15', '1500/ (15-16) 2500/3500 HD 6''', 'Bed Rails - 6'', Full Top Rail', 'BRC146BLR', 61, 86, 86, 12, 12, 0, 0, 0, '848917004502'),
(255, 17, 'Chevrolet/GMC', '14-15', '1500/ (15-16) 2500/3500 HD 6''', 'Bed Rails - 6'', Toolbox cut Rail', 'BRC146BLT', 54, 79, 86, 12, 12, 0, 0, 0, '848917004519'),
(256, 17, 'Chevrolet/GMC', '07.5-15', '1500/ (7.5-16) 2500HD/3500HD', 'Bed Rails - Short Rails 32"', 'BRC081BL1', 22, 25, 31, 12, 12, 0, 0, 0, '848917003291'),
(257, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 6''', 'Bed Rails - 6'', 0 Top Rail', 'BRC086BL1', 36, 39, 86, 12, 12, 0, 0, 0, '848917003307'),
(258, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 6''', 'Bed Rails - 6'', Full Top Rail', 'BRC086BLR', 61, 64, 86, 12, 12, 0, 0, 0, '848917003314'),
(259, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 6''', 'Bed Rails - 6'', Toolbox cut Rail', 'BRC086BLT', 54, 57, 86, 12, 12, 0, 0, 0, '848917003321'),
(260, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 8''', 'Bed Rails - 8'', 0 Top Rail', 'BRC088BL1', 43, 46, 103, 12, 12, 0, 0, 0, '848917003338'),
(261, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 8''', 'Bed Rails - 8'', Full Top Rail', 'BRC088BLR', 75, 78, 103, 12, 12, 0, 0, 0, '848917003345'),
(262, 17, 'Chevrolet/GMC', '7.5-13', '1500/ (7.5-14) 2500HD/3500HD 8''', 'Bed Rails - 8'', Toolbox cut Rail', 'BRC088BLT', 67, 70, 103, 12, 12, 0, 0, 0, '848917003437'),
(263, 17, 'Chevrolet/GMC', '88-07', '1500/1500HD/2500/2500HD Classic', 'Bed Rails - Short Rails 32"', 'BRC991BL1', 22, 25, 31, 12, 12, 0, 0, 0, '848917003376'),
(264, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 6''', 'Bed Rails - 6'', 0 Top Rail', 'BRD106BL1', 30, 33, 86, 12, 12, 0, 0, 0, '848917003475'),
(265, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 6''', 'Bed Rails - 6'', Full Top Rail', 'BRD106BLR', 56, 59, 86, 12, 12, 0, 0, 0, '848917003482'),
(266, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 6''', 'Bed Rails - 6'', Toolbox cut Rail', 'BRD106BLT', 48, 51, 86, 12, 12, 0, 0, 0, '848917003499'),
(267, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 8''', 'Bed Rails - 8'', 0 Top Rail', 'BRD108BL1', 38, 41, 103, 12, 12, 0, 0, 0, '848917003505'),
(268, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 8''', 'Bed Rails - 8'', Full Top Rail', 'BRD108BLR', 69, 72, 103, 12, 12, 0, 0, 0, '848917003512'),
(269, 17, 'Dodge', '10-16', '2500/3500 & Mega Cab, 8''', 'Bed Rails - 8'', Toolbox cut Rail', 'BRD108BLT', 60, 63, 103, 12, 12, 0, 0, 0, '848917003529'),
(270, 17, 'Dodge', '09-16', '1500/ (10-16) 2500/3500 & Mega Cab (excluding Ram Box)', 'Bed Rails - Short Rails 32"', 'BRD091BL1', 30, 33, 31, 12, 12, 0, 0, 0, '848917003468'),
(271, 17, 'Dodge', '02-08', '1500/*(03-09) 2500/3500 & 1500 Mega Cab', 'Bed Rails - Short Rails 32"', 'BRD021BL1', 30, 33, 31, 12, 12, 0, 0, 0, '848917003536'),
(273, 17, 'Ford', '99-16', 'F250/F350 Superduty', 'Bed Rails - Short Rails 32"', 'BRF991BL1', 26, 29, 86, 12, 12, 0, 0, 0, '848917003628'),
(274, 17, 'Ford', '99-16', 'F250/F350 Superduty, 6''', 'Bed Rails - 6'', 0 Top Rail', 'BRF996BL1', 54, 57, 86, 12, 12, 0, 0, 0, '848917003635'),
(275, 17, 'Ford', '99-16', 'F250/F350 Superduty, 6''', 'Bed Rails - 6'', Full Top Rail', 'BRF996BLR', 58, 61, 86, 12, 12, 0, 0, 0, '848917003642'),
(276, 17, 'Ford', '99-16', 'F250/F350 Superduty, 6''', 'Bed Rails - 6'', Toolbox cut Rail', 'BRF996BLT', 71, 74, 86, 12, 12, 0, 0, 0, '848917003659'),
(277, 17, 'Ford', '99-16', 'F250/F350 Superduty, 8''', 'Bed Rails - 8'', 0 Top Rail', 'BRF998BL1', 64, 67, 103, 12, 12, 0, 0, 0, '848917003666'),
(278, 17, 'Ford', '99-16', 'F250/F350 Superduty, 8''', 'Bed Rails - 8'', Full Top Rail', 'BRF998BLR', 90, 93, 103, 12, 12, 0, 0, 0, '848917003673'),
(279, 17, 'Ford', '99-16', 'F250/F350 Superduty, 8''', 'Bed Rails - 8'', Toolbox cut Rail', 'BRF998BLT', 87, 90, 103, 12, 12, 0, 0, 0, '848917003680'),
(281, 17, 'Ford', '97-03', 'F150/F250', 'Bed Rails - Short Rails 32"', 'BRF971BL1', 26, 29, 31, 12, 12, 0, 0, 0, '848917000337'),
(282, 17, 'Ford', '92-96', 'F150/F250/F350', 'Bed Rails - Short Rails 32"', 'BRD941BL1', 30, 33, 31, 12, 12, 0, 0, 0, '848917003611'),
(283, 17, 'Toyota', '04-16', 'Tundra', 'Bed Rails - Short Rails 32"', 'BRF041BL1', 23, 26, 31, 12, 12, 0, 0, 0, '848917002003'),
(284, 18, 'Various', '88-16', 'Various', 'Low Profile Crossbox (A=70" B=14"', 'CBUNALBL1', 167, 171, 72, 20, 16, 0, 0, 0, '848917004144'),
(285, 18, 'Various', '88-16', 'Various', 'Crossbox (A=70" B=141/2" C=19"', 'CBUNA1BL1', 161, 171, 72, 20, 16, 0, 0, 0, '848917003871'),
(286, 18, 'Various', '88-16', 'Various', 'Toolbox lock', 'LOCK 40KADW1', 0, 3, 12, 6, 4, 0, 0, 0, '848917003895'),
(287, 19, 'Chevrolet/GMC', '07.5-10', '2500HD', 'Steps - CC, Rear Door', 'STC081BLR', 35, 38, 34, 23, 12, 0, 0, 0, '848917003901'),
(288, 19, 'Chevrolet/GMC', '01-10', '2500HD/3500HD', 'Steps - SC/EC/CC, Front Door', 'STC011BLF', 37, 40, 34, 23, 12, 0, 0, 0, '848917003918'),
(289, 19, 'Chevrolet/GMC', '01-07', '2500HD/3500HD Classic', 'Steps - CC, Rear Door', 'STC011BLR', 37, 40, 34, 23, 12, 0, 0, 0, '848917003925'),
(290, 19, 'Chevrolet/GMC', '99-07', '1500/1500HD/2500 Classic', 'Steps - SC/CC, Front & Rear Door', 'STC991BLF', 32, 35, 34, 23, 12, 0, 0, 0, '848917003932'),
(292, 1, 'Dodge', '03-09', '2500/3500', 'Steps - SC/QC/CC/MC, Front & Rea', 'STD031BLF', 49, 52, 34, 23, 12, 0, 0, 0, '848917003956'),
(293, 1, 'Ford', '11-16', 'F250/F350 Superduty', 'Steps - CC, Front Door', 'STF111BLF', 33, 36, 34, 23, 12, 0, 0, 0, '848917003963'),
(294, 1, 'Ford', '11-16', 'F250/F350 Superduty', 'Steps - CC, Rear Door', 'STF111BLR', 35, 38, 34, 23, 12, 0, 0, 0, '848917003970'),
(295, 1, 'Ford', '08-10', 'F250/F350 Superduty', 'Steps - CC, Rear Door', 'STF081BLR', 37, 40, 34, 23, 12, 0, 0, 0, '848917003987'),
(296, 1, 'Ford', '05-10', 'F250/F350 Superduty', 'Steps - SC/EC/CC, Front Door', 'STF051BLF', 37, 40, 34, 23, 12, 0, 0, 0, '848917003994'),
(297, 1, 'Ford', '99-04', 'F250/F350 Superduty', 'Steps - SC/EC/CC, Front Door', 'STF991BLF', 37, 40, 34, 23, 12, 0, 0, 0, '848917004007'),
(298, 1, 'Ford', '99-07', 'F250/F350 Superduty', 'Steps - CC, Rear Door', 'STF991BLR', 37, 40, 34, 23, 12, 0, 0, 0, '848917004014'),
(299, 20, 'Chevy/GMC', '15-16', '2500/3500 Ex Cab', '6''6" Bed, Wheel to Wheel (4 Step)', 'RSC151Q6B4W', 64, 80, 108, 14, 11, 0, 0, 0, '848917004663'),
(300, 20, 'Chevy/GMC', '15-16', '2500/3500 Ex Cab', '6''6" Bed, Bed Access (6 Step)', 'RSC151Q6B6', 74, 90, 108, 14, 11, 0, 0, 0, '848917004625'),
(301, 20, 'Chevy/GMC', '15-16', '2500/3500 Ex Cab', '8'' Bed, Wheel to Wheel (4 Step)', 'RSC151Q8B4W', 70, 86, 120, 14, 11, 0, 0, 0, '848917004724'),
(302, 20, 'Chevy/GMC', '15-16', '2500/3500 Ex Cab', '8'' Bed, Bed Access ( 6 Step)', 'RSC151Q8B6', 78, 94, 120, 14, 11, 0, 0, 0, '848917004731'),
(303, 20, 'Chevy/GMC', '14-16', '1500 Double Cab', '6" Bed, Wheel to Wheel (4 Step)', 'RSC14HQ6B4W', 66, 82, 98, 14, 11, 0, 0, 0, '848917004762'),
(304, 20, 'Chevy/GMC', '14-16', '1500 Double Cab', '8" Bed, Wheel to Wheel (6 Step)', 'RSC14HQ6B6', 76, 92, 99, 14, 11, 0, 0, 0, '848917004915'),
(305, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab', '6''6" Bed, Wheel to Wheel (4 Step)', 'RSC151C6B4W', 72, 88, 120, 14, 11, 0, 0, 0, '848917004632'),
(306, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab', '6''6" Bed, Bed Access (6 Step)', 'RSC151C6B6', 78, 94, 120, 14, 11, 0, 0, 0, '848917004649'),
(307, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab', '8'' Bed, Wheel to Wheel (4 Step)', 'RSC151C8B4W', 70, 86, 120, 14, 11, 0, 0, 0, '848917004724'),
(308, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab', '8'' Bed, Bed Access (6 Step)', 'RSC151C8B6', 82, 98, 132, 14, 11, 0, 0, 0, '848917004748'),
(309, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab Dually', '8? Bed, Wheel to Wheel (4 step)', 'RSC15DC8B4W', 68, 84, 120, 14, 11, 0, 0, 0, '848917004816'),
(310, 20, 'Chevy/GMC', '15-16', '2500/3500 Crew Cab Dually', '8? Bed, Bed Access (6 Step)', 'RSC15DC8B6', 78, 94, 120, 14, 11, 0, 0, 0, '848917004823'),
(311, 20, 'Chevy/GMC', '14-16', '1500 Crew Cab', '5''6" Bed, Wheel to Wheel (4 Step)', 'RSC14HC5B4W', 80, 64, 108, 11, 14, 0, 0, 0, '848917004403'),
(312, 20, 'Chevy/GMC', '14-16', '1500 Crew Cab', '5''6" Bed, Bed Access (6 Step)', 'RSC14HC5B6', 86, 70, 108, 11, 14, 0, 0, 0, '848917004410'),
(313, 20, 'Chevy/GMC', '14-16', '1500 Crew Cab', '6''6" Bed, Wheel to Wheel (4 Step)', 'RSC14HC6B4W', 84, 68, 120, 11, 14, 0, 0, 0, '848917004427'),
(314, 20, 'Chevy/GMC', '14-16', '1500 Crew Cab', '6''6" Bed, Bed Access (6 Step)', 'RSC14HC6B6', 92, 76, 120, 11, 14, 0, 0, 0, '848917004434'),
(315, 20, 'Chevy/GMC', '7.5-13', '1500/ (7.5-14) 2500/3500 Ex Cab', '6''6" Bed. Wheel to Wheel', 'RSC071E6B4W', 80, 80, 108, 14, 11, 0, 0, 0, '848917004151'),
(316, 20, 'Chevy/GMC', '7.5-13', '1500/ (7.5-14) 2500/3500 Ex Cab', '6''6" Bed. Bed Access', 'RSC071E6B6', 74, 90, 120, 14, 11, 0, 0, 0, '848917004182'),
(317, 20, 'Chevy/GMC', '7.5-13', '1500/ (7.5-14) 2500/3500 Ex Cab', '8'' Bed. Wheel to Wheel', 'RSC071E8B4W', 70, 86, 120, 14, 11, 0, 0, 0, '848917004199'),
(318, 20, 'Chevy/GMC', '7.5-13', '1500/ (7.5-14) 2500/3500 Ex Cab', '8'' Bed. Bed Access', 'RSC071E8B6', 78, 94, 120, 14, 11, 0, 0, 0, '848917004205'),
(319, 20, 'Chevy/GMC', '07.5-13', '1500 Crew Cab', '5''7" Bed. Wheel to Wheel', 'RSC07HC5B4W', 64, 78, 98, 11, 14, 0, 0, 0, '848917003772'),
(320, 20, 'Chevy/GMC', '07.5-13', '1500 Crew Cab', '5''7" Bed. Bed Access', 'RSC07HC5B6', 72, 88, 120, 11, 14, 0, 0, 0, '848917003796'),
(321, 1, 'Chevy/GMC', '07.5-14', '2500/3500 Crew Cab', '6''6" Bed. Wheel to Wheel', 'RSC111C6B4W', 68, 82, 108, 11, 14, 0, 0, 0, '848917003741'),
(322, 1, 'Chevy/GMC', '07.5-14', '2500/3500 Crew Cab', '6''6" Bed. Bed Access', 'RSC111C6B6', 78, 94, 120, 11, 14, 0, 0, 0, '848917003802'),
(323, 1, 'Chevy/GMC', '07.5-14', '2500/3500 Crew Cab (Also fits Dually)', '8'' Bed. Wheel to Wheel', 'RSC111C8B4W', 74, 88, 124, 11, 14, 0, 0, 0, '848917003765'),
(324, 1, 'Chevy/GMC', '07.5-14', '2500/3500 Crew Cab (Also fits Dually)', '8'' Bed. Bed Access', 'RSC111C8B6', 84, 98, 124, 11, 14, 0, 0, 0, '848917003758'),
(325, 1, 'Dodge Ram', '09-16', '1500 Quad Cab', '6''4" Bed. Wheel to Wheel', 'RSD09HQ6B4W', 80, 96, 108, 11, 14, 0, 0, 0, '848917004274'),
(326, 1, 'Dodge Ram', '09-16', '1500 Quad Cab', '6''4" Bed. Bed Access', 'RSD09HQ6B6', 86, 102, 108, 11, 14, 0, 0, 0, '848917004281'),
(327, 1, 'Dodge Ram', '09-16', '1500 Crew Cab', '5''7" Bed. Wheel to Wheel', 'RSD09HC5B4W', 80, 96, 108, 11, 14, 0, 0, 0, '848917004236'),
(328, 1, 'Dodge Ram', '09-16', '1500 Crew Cab', '5''7" Bed. Bed Access', 'RSD09HC5B6', 86, 102, 120, 11, 14, 0, 0, 0, '848917004298'),
(329, 1, 'Dodge Ram', '10-16', '2500/3500 Crew Cab', '6''4" Bed. Wheel to Wheel', 'RSD101C6B4W', 80, 96, 120, 11, 14, 0, 0, 0, '848917004212'),
(330, 1, 'Dodge Ram', '10-16', '2500/3500 Crew Cab', '6''4" Bed. Bed Access', 'RSD101C6B6', 90, 106, 120, 11, 14, 0, 0, 0, '848917004304'),
(331, 1, 'Dodge Ram', '10-16', '2500/3500 Crew Cab (Also fits Dually)', '8'' Bed. Wheel to Wheel', 'RSD101C8B4W', 92, 108, 132, 11, 14, 0, 0, 0, '848917004229'),
(332, 1, 'Dodge Ram', '10-16', '2500/3500 Crew Cab (Also fits Dually)', '8'' Bed. Bed Access', 'RSD101C8B6', 96, 112, 132, 11, 14, 0, 0, 0, '848917004243'),
(333, 1, 'Dodge Ram', '10-16', '2500/3500 Mega Cab (Also fits Dually)', '6''4" Bed. Wheel to Wheel', 'RSD101M6B4W', 86, 102, 132, 11, 14, 0, 0, 0, '848917004250'),
(334, 1, 'Dodge Ram', '10-16', '2500/3500 Mega Cab (Also fits Dually)', '6''4" Bed. Bed Access', 'RSD101M6B6', 94, 110, 132, 11, 14, 0, 0, 0, '848917004267'),
(335, 1, 'Ford', '15-16', 'F150 Crew Cab', '5''6" Bed. Wheel to Wheel', 'RSF15HC5B4W', 72, 85, 108, 14, 11, 0, 0, 0, '848917004861'),
(336, 1, 'Ford', '15-16', 'F150 Crew Cab', '6" Bed, Wheel to Wheel (4 Step)', 'RSF15HC6B4W', 80, 96, 108, 14, 11, 0, 0, 0, '848917004953'),
(337, 1, 'Ford', '15-16', 'F150 Crew Cab', '6'' Bed, Bed Access', 'RSF15HC6B6', 84, 100, 116, 11, 14, 0, 0, 0, '848917004878'),
(338, 1, 'Ford', '09-14', 'F150 Crew Cab and Raptor', '5''6" Bed. Wheel to Wheel', 'RSF09HC5B4W', 74, 90, 108, 11, 14, 0, 0, 0, '848917003260'),
(339, 1, 'Ford', '09-14', 'F150 Crew Cab', '6''6" Bed. Wheel to Wheel', 'RSF09HC6B4W', 78, 94, 120, 11, 14, 0, 0, 0, '848917003277'),
(340, 1, 'Ford', '09-14', 'F150 Crew Cab', '6''6" Bed. Bed Access', 'RSF09HC6B6', 86, 100, 116, 11, 14, 0, 0, 0, '848917003734'),
(341, 1, 'Ford', '99-16', 'F250/F350 Ext Cab', '6''9" Bed. Wheel to Wheel', 'RSF991E6B4W', 74, 90, 108, 11, 14, 0, 0, 0, '848917003239'),
(342, 1, 'Ford', '99-16', 'F250/F350 Ext Cab', '6''9" Bed. Bed Access', 'RSF991E6B6', 84, 100, 108, 11, 14, 0, 0, 0, '848917003789'),
(343, 1, 'Ford', '99-16', 'F250/F350 Ext Cab', '8'' Bed. Wheel to Wheel', 'RSF991E8B4W', 80, 96, 120, 11, 14, 0, 0, 0, '848917003246'),
(344, 1, 'Ford', '99-16', 'F250/F350 Ext Cab', '8'' Bed. Bed Access', 'RSF991E8B6', 88, 102, 109, 11, 14, 0, 0, 0, '848917003697'),
(345, 1, 'Ford', '99-16', 'F250/F350 Crew Cab', '6''9" Bed. Wheel to Wheel', 'RSF991C6B4W', 80, 86, 118, 11, 14, 0, 0, 0, '848917003222'),
(346, 1, 'Ford', '99-16', 'F250/F350 Crew Cab', '6''9" Bed. Bed Access', 'RSF991C6B6', 88, 102, 118, 11, 14, 0, 0, 0, '848917003215'),
(347, 1, 'Ford', '99-16', 'F250/F350 Crew Cab (Also fits Dually 99-10)', '8'' Bed. Wheel to Wheel', 'RSF991C8B4W', 86, 96, 120, 11, 14, 0, 0, 0, '848917003253'),
(348, 1, 'Ford', '99-16', 'F250/F350 Crew Cab (Also fits Dually 99-10)', '8'' Bed. Bed Access', 'RSF991C8B6', 94, 108, 124, 11, 14, 0, 0, 0, '848917003703'),
(349, 1, 'Ford', '11-16', 'F250/F350/F450 DUALLY Crew Cab', '8'' Bed. Wheel to Wheel', 'RSF11DC8B4W', 84, 98, 120, 11, 14, 0, 0, 0, '848917003710'),
(350, 1, 'Ford', '11-16', 'F250/F350/F450 DUALLY Crew Cab', '8'' Bed. Bed Access', 'RSF11DC8B6', 90, 104, 118, 11, 14, 0, 0, 0, '848917003727'),
(351, 1, 'Jeep', '12-16', 'Wrangler 2 Door JK-Matte Finish', 'Wheel to Wheel', 'RSJ122M2W', 32, 43, 60, 11, 14, 0, 0, 0, '848917005066'),
(352, 1, 'Jeep', '07-11', 'Wrangler 2 Door JK-Matte Finish', 'Wheel to Wheel', 'RSJ072M2W', 32, 43, 60, 11, 14, 0, 0, 0, '848917005073'),
(353, 1, 'Jeep', '07-16', 'Wrangler 4 Door JK-Matte Finish', 'Wheel to Wheel', 'RSJ074M4W', 48, 60, 84, 11, 14, 0, 0, 0, '848917005080'),
(354, 1, 'Toyota', '07-16', 'Tundra Double Cab', '6''6" Bed. Wheel to Wheel', 'RST07HQ6B4W', 62, 78, 108, 11, 14, 0, 0, 0, '848917004328'),
(355, 1, 'Toyota', '07-16', 'Tundra Double Cab', '6''6". Bed Access', 'RST07HQ6B6', 68, 84, 108, 11, 14, 0, 0, 0, '848917004335'),
(356, 1, 'Toyota', '07-16', 'Tundra Crew Max', '5''. Wheel to Wheel', 'RST07HC5B4W', 62, 78, 108, 11, 14, 0, 0, 0, '848917004311'),
(357, 21, 'Various', 'N/A', 'Various', '6" LED Clear Oval Light (EA)', 'LEDLIGHTCLEAR', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(358, 21, 'Various', 'N/A', 'Various', '6" LED Red Oval Light (EA)', 'LEDLIGHTRED', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(359, 21, 'Various', 'N/A', 'Various', 'License Plate Clear Light (EA)', 'LTU-NALCLR', 5, 6, 12, 6, 4, 0, 0, 0, '848917004090'),
(360, 21, 'Various', 'N/A', 'Various', '2" Bolt-On Receiver Tube (500/5000', 'RHU001BLB', 13, 14, 13, 7, 4, 0, 0, 0, '848917004106'),
(361, 21, 'Various', 'N/A', 'Various', 'Universal Rubber Upright Pads (Pair', 'RUPU', 0, 6, 12, 6, 4, 0, 0, 0, '848917004113'),
(362, 21, 'Various', 'N/A', 'Various', 'Universal Fog Light Bracket (Pair)', 'LBUNA1BP', 10, 11, 12, 6, 4, 0, 0, 0, '848917004120'),
(363, 21, 'Various', 'N/A', 'Various', 'Mounting Brackets', 'Various', 10, 0, 0, 0, 0, 0, 0, 0, ''),
(364, 21, 'Various', 'N/A', 'Various', 'Shocks for Tool Box (EA) ball socket', 'SAUNA60LB', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(365, 21, 'Various', 'N/A', 'Various', 'Shocks for Tool Box (EA) eyelet styl', 'SAUNA30LB', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(366, 21, 'Various', 'N/A', 'Various', 'Sensor cover tabs', 'USCBP', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(368, 21, 'Ford', '11-16', 'F450/F550', 'Mounting Kit for Grille Guard', 'GGF114BP', 12, 6, 4, 10, 10, 0, 0, 0, '848917004168');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
