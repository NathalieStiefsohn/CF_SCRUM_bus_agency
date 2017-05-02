-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Mai 2017 um 09:01
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `codebus`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `avatar`
--

CREATE TABLE `avatar` (
  `id` int(15) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `avatar`
--

INSERT INTO `avatar` (`id`, `location`) VALUES
(1, 'pictures/avatar1.jpg'),
(2, 'pictures/avatar2.jpg'),
(3, 'pictures/avatar3.jpg'),
(4, 'pictures/avatar4.jpg'),
(5, 'pictures/avatar5.jpg'),
(6, 'pictures/avatar6.jpg'),
(7, 'pictures/avatar7.jpg'),
(8, 'pictures/avatar8.jpg'),
(9, 'pictures/avatar9.jpg'),
(10, 'pictures/avatar10.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `id` int(15) NOT NULL,
  `stamp` datetime NOT NULL,
  `payment_id` int(15) NOT NULL,
  `schedule_id` int(15) NOT NULL,
  `canceled` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`id`, `stamp`, `payment_id`, `schedule_id`, `canceled`) VALUES
(1, '2017-03-01 10:28:00', 1, 30, NULL),
(2, '2017-03-01 23:37:00', 1, 20, NULL),
(3, '2017-03-11 10:40:00', 1, 1, NULL),
(4, '2017-03-11 22:08:00', 1, 24, NULL),
(5, '2017-04-12 10:20:00', 1, 5, NULL),
(6, '2017-04-12 23:00:00', 1, 20, NULL),
(7, '2017-04-14 10:30:00', 1, 22, NULL),
(8, '2017-04-14 10:07:00', 1, 19, NULL),
(9, '2017-04-14 23:20:00', 1, 3, NULL),
(10, '2017-04-21 10:00:00', 1, 14, NULL),
(11, '2017-04-21 22:47:00', 1, 11, NULL),
(12, '2017-04-21 10:00:00', 1, 7, NULL),
(13, '2017-04-28 14:49:47', 1, 1, NULL),
(14, '2017-04-28 14:49:47', 1, 2, NULL),
(15, '2017-04-22 14:20:00', 2, 2, NULL),
(16, '2017-04-23 23:00:00', 2, 13, NULL),
(17, '2017-04-25 13:30:00', 2, 23, NULL),
(18, '2017-04-26 17:07:00', 2, 16, NULL),
(19, '2017-04-24 21:20:00', 2, 6, NULL),
(20, '2017-04-13 11:00:00', 2, 8, NULL),
(21, '2017-01-01 10:28:00', 1, 1, NULL),
(22, '2017-01-01 23:37:00', 1, 2, NULL),
(23, '2017-01-11 10:40:00', 1, 3, NULL),
(24, '2017-01-11 22:08:00', 1, 4, NULL),
(25, '2017-01-12 10:20:00', 1, 5, NULL),
(26, '2017-01-12 23:00:10', 1, 6, NULL),
(27, '2017-01-14 10:30:00', 1, 7, NULL),
(28, '2017-01-14 10:07:00', 1, 8, NULL),
(29, '2017-01-14 23:20:00', 1, 9, NULL),
(30, '2017-01-21 10:00:00', 1, 10, NULL),
(31, '2017-01-21 22:47:10', 1, 11, NULL),
(32, '2017-01-21 10:00:00', 1, 12, NULL),
(33, '2017-01-21 22:42:00', 1, 13, NULL),
(34, '2017-01-21 10:30:00', 1, 14, NULL),
(35, '2017-01-22 14:20:00', 2, 15, NULL),
(36, '2017-01-23 23:00:00', 2, 16, NULL),
(37, '2017-01-25 13:30:00', 2, 17, NULL),
(38, '2017-01-26 17:07:00', 2, 18, NULL),
(39, '2017-01-24 21:20:10', 2, 19, NULL),
(40, '2017-01-21 10:00:00', 1, 20, NULL),
(41, '2017-01-21 22:47:00', 1, 21, NULL),
(42, '2017-01-21 10:00:00', 1, 22, NULL),
(43, '2017-01-21 22:42:00', 1, 23, NULL),
(44, '2017-01-21 10:30:00', 1, 24, NULL),
(45, '2017-01-22 14:20:00', 2, 25, NULL),
(46, '2017-01-23 23:00:00', 2, 26, NULL),
(47, '2017-01-25 13:30:01', 2, 27, NULL),
(48, '2017-01-26 17:07:00', 2, 28, NULL),
(49, '2017-01-24 21:20:00', 2, 29, NULL),
(50, '2017-01-13 11:00:00', 2, 30, NULL),
(51, '2017-02-01 10:28:00', 1, 10, NULL),
(52, '2017-02-01 23:37:00', 1, 20, NULL),
(53, '2017-02-11 10:40:10', 1, 1, NULL),
(54, '2017-02-11 22:08:00', 1, 24, NULL),
(55, '2017-02-12 10:20:00', 1, 5, NULL),
(56, '2017-02-12 23:00:00', 1, 20, NULL),
(57, '2017-02-14 10:30:00', 1, 22, NULL),
(58, '2017-02-14 10:07:00', 1, 19, NULL),
(59, '2017-02-14 23:20:00', 1, 3, NULL),
(60, '2017-02-21 10:00:00', 1, 14, NULL),
(61, '2017-02-21 22:47:00', 1, 11, NULL),
(62, '2017-02-21 10:00:00', 1, 7, NULL),
(63, '2017-02-21 22:42:00', 1, 21, NULL),
(64, '2017-02-21 10:30:10', 1, 17, NULL),
(65, '2017-02-22 14:20:00', 2, 2, NULL),
(66, '2017-02-23 23:03:00', 2, 13, NULL),
(67, '2017-02-25 13:30:00', 2, 23, NULL),
(68, '2017-02-26 17:07:00', 2, 16, NULL),
(69, '2017-02-24 21:20:00', 2, 6, NULL),
(70, '2017-02-13 11:00:00', 2, 1, NULL),
(71, '2017-01-01 10:28:01', 1, 2, NULL),
(72, '2017-01-01 23:37:00', 1, 3, NULL),
(73, '2017-01-11 10:40:00', 1, 4, NULL),
(74, '2017-01-11 22:08:00', 1, 5, NULL),
(75, '2017-01-12 10:20:00', 1, 6, NULL),
(76, '2017-01-12 23:03:00', 1, 7, NULL),
(77, '2017-01-14 10:30:00', 1, 8, NULL),
(78, '2017-01-14 10:07:00', 1, 9, NULL),
(79, '2017-01-14 23:20:00', 1, 10, NULL),
(80, '2017-01-21 10:00:00', 1, 11, NULL),
(81, '2017-01-21 22:47:00', 1, 12, NULL),
(82, '2017-01-21 10:00:00', 1, 13, NULL),
(83, '2017-01-21 22:42:10', 1, 14, NULL),
(84, '2017-01-21 10:30:00', 1, 15, NULL),
(85, '2017-01-22 14:20:00', 2, 16, NULL),
(86, '2017-01-23 23:03:00', 2, 17, NULL),
(87, '2017-01-25 13:30:00', 2, 18, NULL),
(88, '2017-01-26 17:07:00', 2, 19, NULL),
(89, '2017-01-24 21:20:00', 2, 20, NULL),
(90, '2017-01-13 11:00:10', 2, 21, NULL),
(91, '2017-01-21 22:47:00', 1, 22, NULL),
(92, '2017-01-21 10:00:00', 1, 23, NULL),
(93, '2017-01-21 22:42:00', 1, 24, NULL),
(94, '2017-01-21 10:30:00', 1, 25, NULL),
(95, '2017-01-22 14:20:00', 2, 26, NULL),
(96, '2017-01-23 23:30:00', 2, 27, NULL),
(97, '2017-01-25 13:30:00', 2, 28, NULL),
(98, '2017-01-26 17:07:00', 2, 29, NULL),
(99, '2017-01-24 21:20:00', 2, 30, NULL),
(100, '2017-01-13 11:00:00', 2, 7, NULL),
(101, '2017-02-01 10:28:00', 1, 30, NULL),
(102, '2017-02-01 23:37:00', 1, 20, NULL),
(103, '2017-02-11 10:40:00', 1, 1, NULL),
(104, '2017-02-11 22:08:00', 1, 24, NULL),
(105, '2017-02-12 10:20:10', 1, 5, NULL),
(106, '2017-02-12 23:00:00', 1, 20, NULL),
(107, '2017-02-14 10:30:00', 1, 22, NULL),
(108, '2017-02-14 10:07:00', 1, 19, NULL),
(109, '2017-02-14 23:20:00', 1, 3, NULL),
(110, '2017-02-21 10:30:00', 1, 14, NULL),
(111, '2017-02-21 22:47:00', 1, 11, NULL),
(112, '2017-02-21 10:00:10', 1, 7, NULL),
(113, '2017-02-21 22:47:00', 1, 11, NULL),
(114, '2017-02-21 22:47:00', 1, 11, NULL),
(115, '2017-02-22 14:20:00', 2, 2, NULL),
(116, '2017-02-23 23:00:00', 2, 13, NULL),
(117, '2017-02-25 13:30:00', 2, 23, NULL),
(118, '2017-02-26 17:07:00', 2, 16, NULL),
(119, '2017-02-24 21:20:00', 2, 6, NULL),
(120, '2017-02-13 11:00:00', 2, 8, NULL),
(121, '2017-03-05 10:28:05', 1, 30, NULL),
(122, '2017-03-05 23:37:30', 1, 20, NULL),
(123, '2017-03-15 10:40:00', 1, 1, NULL),
(124, '2017-03-15 22:08:00', 1, 24, NULL),
(125, '2017-04-17 10:20:00', 1, 5, NULL),
(126, '2017-04-17 23:00:50', 1, 20, NULL),
(127, '2017-04-14 10:30:10', 1, 22, NULL),
(128, '2017-04-14 10:07:00', 1, 19, NULL),
(129, '2017-04-14 23:20:04', 1, 3, NULL),
(130, '2017-04-25 10:30:00', 1, 14, NULL),
(131, '2017-04-25 22:47:05', 1, 11, NULL),
(132, '2017-04-25 10:00:00', 1, 7, NULL),
(133, '2017-04-25 22:42:00', 1, 21, NULL),
(134, '2017-04-25 10:30:30', 1, 17, NULL),
(135, '2017-04-22 14:20:00', 2, 2, NULL),
(136, '2017-04-23 23:00:50', 2, 13, NULL),
(137, '2017-04-25 13:30:10', 2, 23, NULL),
(138, '2017-04-26 17:07:00', 2, 16, NULL),
(139, '2017-04-24 21:20:30', 2, 6, NULL),
(140, '2017-04-25 10:00:40', 1, 14, NULL),
(141, '2017-04-25 22:47:00', 1, 11, NULL),
(142, '2017-04-25 10:00:00', 1, 7, NULL),
(143, '2017-04-25 22:42:00', 1, 21, NULL),
(144, '2017-04-25 10:30:30', 1, 17, NULL),
(145, '2017-04-27 14:20:05', 2, 2, NULL),
(146, '2017-04-23 23:00:00', 2, 13, NULL),
(147, '2017-04-25 13:30:00', 2, 23, NULL),
(148, '2017-04-26 17:07:00', 2, 16, NULL),
(149, '2017-04-24 21:20:00', 2, 6, NULL),
(150, '2017-04-13 11:30:50', 2, 1, NULL),
(151, '2017-03-05 10:28:04', 1, 2, NULL),
(152, '2017-03-05 23:37:00', 1, 3, NULL),
(153, '2017-03-15 10:40:10', 1, 4, NULL),
(154, '2017-03-15 22:08:00', 1, 5, NULL),
(155, '2017-04-17 10:20:00', 1, 6, NULL),
(156, '2017-04-17 23:00:00', 1, 7, NULL),
(157, '2017-04-14 10:30:00', 1, 8, NULL),
(158, '2017-04-14 10:07:50', 1, 9, NULL),
(159, '2017-04-14 23:20:00', 1, 10, NULL),
(160, '2017-04-21 10:00:10', 1, 11, NULL),
(161, '2017-04-21 22:47:04', 1, 12, NULL),
(162, '2017-04-21 10:00:30', 1, 13, NULL),
(163, '2017-04-21 22:42:05', 1, 14, NULL),
(164, '2017-04-21 10:30:00', 1, 15, NULL),
(165, '2017-04-22 14:20:01', 2, 16, NULL),
(166, '2017-04-23 23:30:00', 2, 17, NULL),
(167, '2017-04-25 13:30:10', 2, 18, NULL),
(168, '2017-04-26 17:07:00', 2, 19, NULL),
(169, '2017-04-24 21:20:00', 2, 20, NULL),
(170, '2017-04-13 11:00:00', 2, 21, NULL),
(171, '2017-03-01 10:28:50', 1, 22, NULL),
(172, '2017-03-01 23:37:40', 1, 23, NULL),
(173, '2017-03-11 10:40:03', 1, 24, NULL),
(174, '2017-03-11 22:08:03', 1, 25, NULL),
(175, '2017-04-12 10:20:00', 1, 26, NULL),
(176, '2017-04-12 23:00:00', 1, 27, NULL),
(177, '2017-04-14 10:30:00', 1, 28, NULL),
(178, '2017-04-14 10:07:05', 1, 29, NULL),
(179, '2017-04-14 23:20:00', 1, 30, NULL),
(180, '2017-04-21 10:30:40', 1, 22, NULL),
(181, '2017-04-21 22:47:00', 1, 11, NULL),
(182, '2017-04-21 10:00:10', 1, 7, NULL),
(183, '2017-04-21 22:42:00', 1, 21, NULL),
(184, '2017-04-21 10:30:00', 1, 17, NULL),
(185, '2017-04-22 14:20:00', 2, 2, NULL),
(186, '2017-04-23 23:00:30', 2, 13, NULL),
(187, '2017-04-25 13:30:00', 2, 23, NULL),
(188, '2017-04-26 17:07:50', 2, 16, NULL),
(189, '2017-04-24 21:20:05', 2, 6, NULL),
(190, '2017-04-13 11:00:00', 2, 8, NULL),
(191, '2017-04-21 22:47:01', 1, 11, NULL),
(192, '2017-04-21 10:00:00', 1, 7, NULL),
(193, '2017-04-21 22:42:40', 1, 21, NULL),
(194, '2017-04-21 10:30:03', 1, 17, NULL),
(195, '2017-04-22 14:20:00', 2, 2, NULL),
(196, '2017-04-23 23:30:00', 2, 13, NULL),
(197, '2017-04-25 13:30:10', 2, 23, NULL),
(198, '2017-04-26 17:07:00', 2, 16, NULL),
(199, '2017-04-24 21:20:03', 2, 6, NULL),
(200, '2017-04-13 11:30:50', 2, 8, NULL),
(201, '2017-05-02 08:17:46', 1, 5, NULL),
(202, '2017-05-02 08:18:55', 1, 12, NULL),
(203, '2017-05-02 08:29:01', 1, 2, NULL),
(204, '2017-05-02 08:34:58', 1, 2, NULL),
(205, '2017-05-02 08:36:31', 1, 2, NULL),
(206, '2017-05-02 08:37:06', 1, 2, NULL),
(207, '2017-05-02 08:38:05', 1, 2, NULL),
(208, '2017-05-02 08:39:05', 1, 6, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus`
--

CREATE TABLE `bus` (
  `id` int(15) NOT NULL,
  `model_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bus`
--

INSERT INTO `bus` (`id`, `model_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `device`
--

CREATE TABLE `device` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `device`
--

INSERT INTO `device` (`id`, `name`) VALUES
(1, 'Mobile'),
(2, 'Tablet'),
(3, 'Desktop');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `discount`
--

CREATE TABLE `discount` (
  `id` int(15) NOT NULL,
  `rate` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `discount`
--

INSERT INTO `discount` (`id`, `rate`) VALUES
(1, '0.00'),
(2, '0.10'),
(3, '0.20'),
(4, '0.25');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `holiday`
--

CREATE TABLE `holiday` (
  `id` int(15) NOT NULL,
  `event` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `holiday`
--

INSERT INTO `holiday` (`id`, `event`) VALUES
(1, '2017-01-01'),
(2, '2017-01-06'),
(3, '2017-04-17'),
(4, '2017-05-01'),
(5, '2017-05-25'),
(6, '2017-06-05'),
(7, '2017-06-15'),
(8, '2017-08-15'),
(9, '2017-10-26'),
(10, '2017-11-01'),
(11, '2017-12-08'),
(12, '2017-12-25'),
(13, '2017-12-26'),
(14, '2018-01-01'),
(15, '2018-01-06'),
(16, '2018-04-02'),
(17, '2018-05-01'),
(18, '2018-05-10'),
(19, '2018-05-21'),
(20, '2018-05-31'),
(21, '2018-08-15'),
(22, '2018-10-26'),
(23, '2018-11-01'),
(24, '2018-12-08'),
(25, '2018-12-25'),
(26, '2018-12-26');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `model`
--

CREATE TABLE `model` (
  `id` int(15) NOT NULL,
  `seats` int(5) NOT NULL,
  `rows` int(5) NOT NULL,
  `columns` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `model`
--

INSERT INTO `model` (`id`, `seats`, `rows`, `columns`) VALUES
(1, 56, 15, 6),
(2, 42, 11, 6),
(3, 12, 6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `iban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `iban`) VALUES
(1, 1, '123456789'),
(2, 2, 'DE258265656'),
(3, 3, 'DE25826233556'),
(4, 4, 'DE2582623300556'),
(5, 5, 'AT2582623300556'),
(6, 6, 'AT2623300556'),
(7, 7, 'AT262330000556'),
(8, 8, 'AT2627777000556'),
(9, 9, 'AT2627777845856');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `id` int(15) NOT NULL,
  `booking_id` int(15) NOT NULL,
  `seat_id` int(15) NOT NULL,
  `canceled` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`id`, `booking_id`, `seat_id`, `canceled`) VALUES
(2, 1, 12, NULL),
(3, 1, 3, NULL),
(4, 2, 39, NULL),
(5, 2, 40, NULL),
(6, 3, 8, NULL),
(7, 4, 1, NULL),
(8, 5, 27, NULL),
(9, 6, 36, NULL),
(10, 7, 18, NULL),
(11, 7, 9, NULL),
(12, 8, 26, NULL),
(13, 8, 27, NULL),
(17, 2, 39, NULL),
(18, 2, 40, NULL),
(19, 3, 8, NULL),
(20, 104, 1, NULL),
(21, 5, 27, NULL),
(22, 6, 36, NULL),
(23, 7, 18, NULL),
(24, 7, 9, NULL),
(25, 8, 26, NULL),
(26, 8, 27, NULL),
(27, 101, 11, NULL),
(30, 2, 39, NULL),
(31, 62, 40, NULL),
(32, 3, 8, NULL),
(33, 4, 1, NULL),
(34, 105, 27, NULL),
(35, 6, 36, NULL),
(36, 7, 18, NULL),
(37, 7, 9, NULL),
(38, 108, 26, NULL),
(39, 8, 27, NULL),
(40, 8, 27, NULL),
(51, 1, 11, NULL),
(54, 2, 39, NULL),
(55, 2, 40, NULL),
(56, 103, 8, NULL),
(57, 4, 1, NULL),
(58, 5, 27, NULL),
(59, 6, 36, NULL),
(60, 76, 18, NULL),
(61, 7, 9, NULL),
(62, 8, 26, NULL),
(63, 108, 27, NULL),
(64, 141, 11, NULL),
(67, 2, 39, NULL),
(68, 102, 40, NULL),
(69, 3, 8, NULL),
(70, 4, 1, NULL),
(71, 135, 27, NULL),
(72, 6, 36, NULL),
(73, 7, 18, NULL),
(74, 7, 9, NULL),
(75, 78, 26, NULL),
(76, 8, 27, NULL),
(78, 17, 12, NULL),
(80, 62, 39, NULL),
(81, 2, 40, NULL),
(82, 3, 8, NULL),
(83, 4, 1, NULL),
(84, 105, 27, NULL),
(85, 6, 36, NULL),
(86, 147, 18, NULL),
(87, 7, 9, NULL),
(88, 138, 26, NULL),
(89, 8, 27, NULL),
(90, 87, 27, NULL),
(94, 2, 39, NULL),
(95, 2, 40, NULL),
(96, 193, 8, NULL),
(97, 4, 1, NULL),
(98, 5, 27, NULL),
(99, 6, 36, NULL),
(100, 107, 18, NULL),
(101, 71, 11, NULL),
(102, 13, 12, NULL),
(103, 131, 3, NULL),
(104, 142, 39, NULL),
(105, 2, 40, NULL),
(106, 193, 8, NULL),
(107, 104, 1, NULL),
(108, 5, 27, NULL),
(109, 76, 36, NULL),
(110, 73, 18, NULL),
(111, 197, 9, NULL),
(112, 87, 26, NULL),
(113, 8, 27, NULL),
(115, 191, 12, NULL),
(116, 41, 3, NULL),
(117, 26, 39, NULL),
(118, 102, 40, NULL),
(119, 3, 8, NULL),
(120, 74, 1, NULL),
(121, 53, 27, NULL),
(122, 6, 36, NULL),
(123, 137, 18, NULL),
(124, 7, 9, NULL),
(125, 8, 26, NULL),
(126, 8, 27, NULL),
(128, 1, 12, NULL),
(129, 191, 3, NULL),
(130, 27, 39, NULL),
(131, 2, 40, NULL),
(132, 133, 8, NULL),
(133, 4, 1, NULL),
(134, 145, 27, NULL),
(135, 6, 36, NULL),
(136, 7, 18, NULL),
(137, 47, 9, NULL),
(138, 108, 26, NULL),
(139, 78, 27, NULL),
(140, 8, 27, NULL),
(151, 1, 11, NULL),
(152, 191, 12, NULL),
(153, 13, 3, NULL),
(154, 102, 39, NULL),
(155, 2, 40, NULL),
(156, 3, 8, NULL),
(157, 104, 1, NULL),
(158, 5, 27, NULL),
(159, 6, 36, NULL),
(160, 67, 18, NULL),
(161, 7, 9, NULL),
(162, 108, 26, NULL),
(163, 8, 27, NULL),
(164, 1, 11, NULL),
(165, 141, 12, NULL),
(166, 17, 3, NULL),
(167, 2, 39, NULL),
(168, 132, 40, NULL),
(169, 3, 8, NULL),
(170, 4, 1, NULL),
(171, 105, 27, NULL),
(172, 6, 36, NULL),
(173, 73, 18, NULL),
(174, 7, 9, NULL),
(175, 8, 26, NULL),
(176, 83, 27, NULL),
(177, 71, 11, NULL),
(178, 41, 12, NULL),
(180, 132, 39, NULL),
(181, 2, 40, NULL),
(182, 103, 8, NULL),
(183, 4, 1, NULL),
(184, 56, 27, NULL),
(185, 6, 36, NULL),
(186, 147, 18, NULL),
(187, 7, 9, NULL),
(188, 8, 26, NULL),
(189, 98, 27, NULL),
(190, 87, 27, NULL),
(191, 1, 11, NULL),
(194, 26, 39, NULL),
(195, 102, 40, NULL),
(196, 3, 8, NULL),
(197, 4, 1, NULL),
(198, 95, 27, NULL),
(199, 146, 36, NULL),
(200, 7, 18, NULL),
(201, 201, 35, NULL),
(202, 201, 31, NULL),
(203, 202, 23, NULL),
(204, 202, 24, NULL),
(205, 203, 28, NULL),
(206, 203, 32, NULL),
(207, 204, 48, NULL),
(208, 204, 47, NULL),
(209, 205, 22, NULL),
(210, 206, 42, NULL),
(211, 207, 53, NULL),
(212, 208, 29, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `route`
--

CREATE TABLE `route` (
  `id` int(15) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `bus_id` int(15) NOT NULL,
  `min_seats` int(15) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `duration` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `route`
--

INSERT INTO `route` (`id`, `destination`, `bus_id`, `min_seats`, `price`, `duration`) VALUES
(1, 'Vienna-Bratislava', 1, 10, '12.00', '00:40:00'),
(2, 'Bratislava-Vienna', 1, 10, '12.00', '00:40:00'),
(3, 'Vienna-Frankfurt', 2, 10, '87.00', '10:30:00'),
(4, 'Frankfurt-Vienna', 2, 10, '87.00', '10:30:00'),
(5, 'Vienna-Paris', 3, 10, '114.00', '17:25:00'),
(6, 'Paris-Vienna', 3, 10, '114.00', '17:25:00'),
(7, 'Vienna-Venice', 4, 10, '68.00', '09:30:00'),
(8, 'Venice-Vienna', 4, 10, '68.00', '09:30:00'),
(9, 'Vienna-Salzburg', 5, 4, '46.00', '02:50:00'),
(10, 'Salzburg-Vienna', 5, 4, '46.00', '02:50:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schedule`
--

CREATE TABLE `schedule` (
  `id` int(15) NOT NULL,
  `route_id` int(15) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `schedule`
--

INSERT INTO `schedule` (`id`, `route_id`, `departure_date`, `departure_time`) VALUES
(1, 1, '2017-04-01', '10:00:00'),
(2, 1, '2017-05-01', '10:00:00'),
(3, 1, '2017-06-01', '10:00:00'),
(4, 2, '2017-04-01', '12:00:00'),
(5, 2, '2017-05-01', '12:00:00'),
(6, 2, '2017-06-01', '12:00:00'),
(7, 3, '2017-04-01', '10:00:00'),
(8, 3, '2017-05-01', '10:00:00'),
(9, 3, '2017-06-01', '10:00:00'),
(10, 4, '2017-04-01', '20:00:00'),
(11, 4, '2017-05-01', '20:00:00'),
(12, 4, '2017-06-01', '20:00:00'),
(13, 5, '2017-04-01', '10:00:00'),
(14, 5, '2017-05-01', '10:00:00'),
(15, 5, '2017-06-01', '10:00:00'),
(16, 6, '2017-04-02', '05:00:00'),
(17, 6, '2017-05-02', '05:00:00'),
(18, 6, '2017-06-02', '05:00:00'),
(19, 7, '2017-04-01', '10:00:00'),
(20, 7, '2017-05-01', '10:00:00'),
(21, 7, '2017-06-01', '10:00:00'),
(22, 8, '2017-04-01', '19:00:00'),
(23, 8, '2017-05-01', '19:00:00'),
(24, 8, '2017-06-01', '19:00:00'),
(25, 9, '2017-04-01', '10:00:00'),
(26, 9, '2017-05-01', '10:00:00'),
(27, 9, '2017-06-01', '10:00:00'),
(28, 10, '2017-04-01', '13:00:00'),
(29, 10, '2017-05-01', '13:00:00'),
(30, 10, '2017-06-01', '13:00:00'),
(31, 1, '2017-04-11', '10:00:00'),
(32, 1, '2017-05-11', '10:00:00'),
(33, 1, '2017-06-11', '10:00:00'),
(34, 2, '2017-04-11', '12:00:00'),
(35, 2, '2017-05-11', '12:00:00'),
(36, 2, '2017-06-11', '12:00:00'),
(37, 3, '2017-04-11', '10:00:00'),
(38, 3, '2017-05-11', '10:00:00'),
(39, 3, '2017-06-11', '10:00:00'),
(40, 4, '2017-04-11', '20:00:00'),
(41, 4, '2017-05-11', '20:00:00'),
(42, 4, '2017-06-11', '20:00:00'),
(43, 5, '2017-04-11', '10:00:00'),
(44, 5, '2017-05-11', '10:00:00'),
(45, 5, '2017-06-11', '10:00:00'),
(46, 6, '2017-04-12', '05:00:00'),
(47, 6, '2017-05-12', '05:00:00'),
(48, 6, '2017-06-12', '05:00:00'),
(49, 7, '2017-04-11', '10:00:00'),
(50, 7, '2017-05-11', '10:00:00'),
(51, 7, '2017-06-11', '10:00:00'),
(52, 8, '2017-04-11', '19:00:00'),
(53, 8, '2017-05-11', '19:00:00'),
(54, 8, '2017-06-11', '19:00:00'),
(55, 9, '2017-04-11', '10:00:00'),
(56, 9, '2017-05-11', '10:00:00'),
(57, 9, '2017-06-11', '10:00:00'),
(58, 10, '2017-04-11', '13:00:00'),
(59, 10, '2017-05-11', '13:00:00'),
(60, 10, '2017-06-11', '13:00:00'),
(61, 1, '2017-04-21', '10:00:00'),
(62, 1, '2017-05-21', '10:00:00'),
(63, 1, '2017-06-21', '10:00:00'),
(64, 2, '2017-04-21', '12:00:00'),
(65, 2, '2017-05-21', '12:00:00'),
(66, 2, '2017-06-21', '12:00:00'),
(67, 3, '2017-04-21', '10:00:00'),
(68, 3, '2017-05-21', '10:00:00'),
(69, 3, '2017-06-21', '10:00:00'),
(70, 4, '2017-04-21', '20:00:00'),
(71, 4, '2017-05-21', '20:00:00'),
(72, 4, '2017-06-21', '20:00:00'),
(73, 5, '2017-04-21', '10:00:00'),
(74, 5, '2017-05-21', '10:00:00'),
(75, 5, '2017-06-21', '10:00:00'),
(76, 6, '2017-04-22', '05:00:00'),
(77, 6, '2017-05-22', '05:00:00'),
(78, 6, '2017-06-22', '05:00:00'),
(79, 7, '2017-04-21', '10:00:00'),
(80, 7, '2017-05-21', '10:00:00'),
(81, 7, '2017-06-21', '10:00:00'),
(82, 8, '2017-04-21', '19:00:00'),
(83, 8, '2017-05-21', '19:00:00'),
(84, 8, '2017-06-21', '19:00:00'),
(85, 9, '2017-04-21', '10:00:00'),
(86, 9, '2017-05-21', '10:00:00'),
(87, 9, '2017-06-21', '10:00:00'),
(88, 10, '2017-04-21', '13:00:00'),
(89, 10, '2017-05-21', '13:00:00'),
(90, 10, '2017-06-21', '13:00:00'),
(101, 1, '2017-04-05', '10:00:00'),
(102, 1, '2017-05-05', '10:00:00'),
(103, 1, '2017-06-05', '10:00:00'),
(104, 2, '2017-04-05', '12:00:00'),
(105, 2, '2017-05-05', '12:00:00'),
(106, 2, '2017-06-05', '12:00:00'),
(107, 3, '2017-04-05', '10:00:00'),
(108, 3, '2017-05-05', '10:00:00'),
(109, 3, '2017-06-05', '10:00:00'),
(110, 4, '2017-04-05', '20:00:00'),
(111, 4, '2017-05-05', '20:00:00'),
(112, 4, '2017-06-05', '20:00:00'),
(113, 5, '2017-04-05', '10:00:00'),
(114, 5, '2017-05-05', '10:00:00'),
(115, 5, '2017-06-05', '10:00:00'),
(116, 6, '2017-04-06', '05:00:00'),
(117, 6, '2017-05-06', '05:00:00'),
(118, 6, '2017-06-06', '05:00:00'),
(119, 7, '2017-04-05', '10:00:00'),
(120, 7, '2017-05-05', '10:00:00'),
(121, 7, '2017-06-05', '10:00:00'),
(122, 8, '2017-04-05', '19:00:00'),
(123, 8, '2017-05-05', '19:00:00'),
(124, 8, '2017-06-05', '19:00:00'),
(125, 9, '2017-04-05', '10:00:00'),
(126, 9, '2017-05-05', '10:00:00'),
(127, 9, '2017-06-05', '10:00:00'),
(128, 10, '2017-04-05', '13:00:00'),
(129, 10, '2017-05-05', '13:00:00'),
(130, 10, '2017-06-05', '13:00:00'),
(131, 1, '2017-04-15', '10:00:00'),
(132, 1, '2017-05-15', '10:00:00'),
(133, 1, '2017-06-15', '10:00:00'),
(134, 2, '2017-04-15', '12:00:00'),
(135, 2, '2017-05-15', '12:00:00'),
(136, 2, '2017-06-15', '12:00:00'),
(137, 3, '2017-04-15', '10:00:00'),
(138, 3, '2017-05-15', '10:00:00'),
(139, 3, '2017-06-15', '10:00:00'),
(140, 4, '2017-04-15', '20:00:00'),
(141, 4, '2017-05-15', '20:00:00'),
(142, 4, '2017-06-15', '20:00:00'),
(143, 5, '2017-04-15', '10:00:00'),
(144, 5, '2017-05-15', '10:00:00'),
(145, 5, '2017-06-15', '10:00:00'),
(146, 6, '2017-04-16', '05:00:00'),
(147, 6, '2017-05-16', '05:00:00'),
(148, 6, '2017-06-16', '05:00:00'),
(149, 7, '2017-04-15', '10:00:00'),
(150, 7, '2017-05-15', '10:00:00'),
(151, 7, '2017-06-15', '10:00:00'),
(152, 8, '2017-04-15', '19:00:00'),
(153, 8, '2017-05-15', '19:00:00'),
(154, 8, '2017-06-15', '19:00:00'),
(155, 9, '2017-04-15', '10:00:00'),
(156, 9, '2017-05-15', '10:00:00'),
(157, 9, '2017-06-15', '10:00:00'),
(158, 10, '2017-04-15', '13:00:00'),
(159, 10, '2017-05-15', '13:00:00'),
(160, 10, '2017-06-15', '13:00:00'),
(161, 1, '2017-04-25', '10:00:00'),
(162, 1, '2017-05-25', '10:00:00'),
(163, 1, '2017-06-25', '10:00:00'),
(164, 2, '2017-04-25', '12:00:00'),
(165, 2, '2017-05-25', '12:00:00'),
(166, 2, '2017-06-25', '12:00:00'),
(167, 3, '2017-04-25', '10:00:00'),
(168, 3, '2017-05-25', '10:00:00'),
(169, 3, '2017-06-25', '10:00:00'),
(170, 4, '2017-04-25', '20:00:00'),
(171, 4, '2017-05-25', '20:00:00'),
(172, 4, '2017-06-25', '20:00:00'),
(173, 5, '2017-04-25', '10:00:00'),
(174, 5, '2017-05-25', '10:00:00'),
(175, 5, '2017-06-25', '10:00:00'),
(176, 6, '2017-04-26', '05:00:00'),
(177, 6, '2017-05-26', '05:00:00'),
(178, 6, '2017-06-26', '05:00:00'),
(179, 7, '2017-04-25', '10:00:00'),
(180, 7, '2017-05-25', '10:00:00'),
(181, 7, '2017-06-25', '10:00:00'),
(182, 8, '2017-04-25', '19:00:00'),
(183, 8, '2017-05-25', '19:00:00'),
(184, 8, '2017-06-25', '19:00:00'),
(185, 9, '2017-04-25', '10:00:00'),
(186, 9, '2017-05-25', '10:00:00'),
(187, 9, '2017-06-25', '10:00:00'),
(188, 10, '2017-04-25', '13:00:00'),
(189, 10, '2017-05-25', '13:00:00'),
(190, 10, '2017-06-25', '13:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seat`
--

CREATE TABLE `seat` (
  `id` int(15) NOT NULL,
  `model_id` int(15) NOT NULL,
  `num` int(15) NOT NULL,
  `row` int(3) NOT NULL,
  `col` int(3) NOT NULL,
  `discount_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `seat`
--

INSERT INTO `seat` (`id`, `model_id`, `num`, `row`, `col`, `discount_id`) VALUES
(1, 1, 1, 1, 5, 1),
(2, 1, 2, 1, 6, 1),
(3, 1, 3, 2, 1, 1),
(4, 1, 4, 2, 2, 1),
(5, 1, 5, 2, 5, 1),
(6, 1, 6, 2, 6, 1),
(7, 1, 7, 3, 1, 1),
(8, 1, 8, 3, 2, 1),
(9, 1, 9, 3, 5, 1),
(10, 1, 10, 3, 6, 1),
(11, 1, 11, 4, 1, 1),
(12, 1, 12, 4, 2, 1),
(13, 1, 13, 4, 5, 1),
(14, 1, 14, 4, 6, 1),
(15, 1, 15, 5, 1, 1),
(16, 1, 16, 5, 2, 1),
(17, 1, 17, 5, 5, 1),
(18, 1, 18, 5, 6, 1),
(19, 1, 19, 6, 1, 1),
(20, 1, 20, 6, 2, 1),
(21, 1, 21, 6, 5, 1),
(22, 1, 22, 6, 6, 1),
(23, 1, 23, 7, 1, 2),
(24, 1, 24, 7, 2, 2),
(25, 1, 25, 8, 1, 2),
(26, 1, 26, 8, 2, 2),
(27, 1, 27, 9, 1, 2),
(28, 1, 28, 9, 2, 2),
(29, 1, 29, 9, 5, 2),
(30, 1, 30, 9, 6, 2),
(31, 1, 31, 10, 1, 2),
(32, 1, 32, 10, 2, 2),
(33, 1, 33, 10, 5, 2),
(34, 1, 34, 10, 6, 2),
(35, 1, 35, 11, 1, 2),
(36, 1, 36, 11, 2, 2),
(37, 1, 37, 11, 5, 2),
(38, 1, 38, 11, 6, 2),
(39, 1, 39, 12, 1, 3),
(40, 1, 40, 12, 2, 3),
(41, 1, 41, 12, 5, 3),
(42, 1, 42, 12, 6, 3),
(43, 1, 43, 13, 1, 3),
(44, 1, 44, 13, 2, 3),
(45, 1, 45, 13, 5, 3),
(46, 1, 46, 13, 6, 3),
(47, 1, 47, 14, 1, 3),
(48, 1, 48, 14, 2, 3),
(49, 1, 49, 14, 5, 3),
(50, 1, 50, 14, 6, 3),
(51, 1, 51, 15, 1, 3),
(52, 1, 52, 15, 2, 3),
(53, 1, 53, 15, 3, 3),
(54, 1, 54, 15, 4, 3),
(55, 1, 55, 15, 5, 3),
(56, 1, 56, 15, 6, 3),
(57, 2, 1, 1, 1, 1),
(58, 2, 2, 1, 2, 1),
(59, 2, 3, 1, 5, 1),
(60, 2, 4, 1, 6, 1),
(61, 2, 5, 2, 1, 1),
(62, 2, 6, 2, 2, 1),
(63, 2, 7, 2, 5, 1),
(64, 2, 8, 2, 6, 1),
(65, 2, 9, 3, 1, 1),
(66, 2, 10, 3, 2, 1),
(67, 2, 11, 3, 5, 1),
(68, 2, 12, 3, 6, 1),
(69, 2, 13, 4, 1, 1),
(70, 2, 14, 4, 2, 1),
(71, 2, 15, 4, 5, 1),
(72, 2, 16, 4, 6, 1),
(73, 2, 17, 5, 1, 2),
(74, 2, 18, 5, 2, 2),
(75, 2, 19, 6, 1, 2),
(76, 2, 20, 6, 2, 2),
(77, 2, 21, 7, 1, 2),
(78, 2, 22, 7, 2, 2),
(79, 2, 23, 7, 5, 2),
(80, 2, 24, 7, 6, 2),
(81, 2, 25, 8, 1, 2),
(82, 2, 26, 8, 2, 2),
(83, 2, 27, 8, 5, 2),
(84, 2, 28, 8, 6, 2),
(85, 2, 29, 9, 1, 3),
(86, 2, 30, 9, 2, 3),
(87, 2, 31, 9, 5, 3),
(88, 2, 32, 9, 6, 3),
(89, 2, 33, 10, 1, 3),
(90, 2, 34, 10, 2, 3),
(91, 2, 35, 10, 5, 3),
(92, 2, 36, 10, 6, 3),
(93, 2, 37, 11, 1, 3),
(94, 2, 38, 11, 2, 3),
(95, 2, 39, 11, 3, 3),
(96, 2, 40, 11, 4, 3),
(97, 2, 41, 11, 5, 3),
(98, 2, 42, 11, 6, 3),
(99, 3, 1, 1, 3, 1),
(100, 3, 2, 2, 1, 1),
(101, 3, 3, 2, 3, 1),
(102, 3, 4, 3, 1, 2),
(103, 3, 5, 3, 3, 2),
(104, 3, 6, 4, 1, 2),
(105, 3, 7, 4, 3, 2),
(106, 3, 8, 5, 1, 3),
(107, 3, 9, 5, 3, 3),
(108, 3, 10, 6, 1, 3),
(109, 3, 11, 6, 2, 3),
(110, 3, 12, 6, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `session`
--

CREATE TABLE `session` (
  `id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `reg_date` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `device_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `title`
--

CREATE TABLE `title` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `title`
--

INSERT INTO `title` (`id`, `name`) VALUES
(1, 'Mr.'),
(2, 'Ms.'),
(3, 'Mrs.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(15) NOT NULL,
  `title_id` int(15) NOT NULL,
  `avatar_id` int(15) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `birth_year` year(4) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `title_id`, `avatar_id`, `first_name`, `last_name`, `email`, `tel`, `birth_year`, `password`) VALUES
(1, 1, 1, 'Admin', 'Surname', 'admin@CodeBus.com', '+43 660 123 1234', 1972, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 1, 1, 'Goran', 'Stevic', 'goran.steviccc@codebus.com', '0664226025', 1988, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(3, 1, 1, 'Igor', 'Stevic', 'igor.stevic@codebus.com', '0664226025', 1988, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(4, 3, 2, 'Lisa', 'Duschek', 'lisa.duschek@codebus.com', '0664226025', 1991, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(5, 3, 2, 'Nathalie', 'Stiefsohn', 'nathalie.stiefsohn@codemasters.com', '0664226025', 1993, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(6, 1, 1, 'Nicky', 'Pallas', 'nicky.pallas@codemasters.com', '0664226025', 1983, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(7, 1, 1, 'Test', 'Test', 'test@test.com', '0664126995', 1983, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(8, 1, 1, 'Christoph', 'Pirringer', 'chris@test.com', '0664126995', 1983, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(9, 3, 2, 'Ema', 'Horvath', 'ema@test.com', '0664126995', 1994, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`,`user_id`);

--
-- Indizes für die Tabelle `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `id` (`id`,`payment_id`,`schedule_id`);

--
-- Indizes für die Tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id` (`id`,`user_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `id` (`id`,`booking_id`,`seat_id`);

--
-- Indizes für die Tabelle `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `id` (`id`,`bus_id`);

--
-- Indizes für die Tabelle `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `id` (`id`,`route_id`);

--
-- Indizes für die Tabelle `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `id` (`id`,`model_id`,`discount_id`);

--
-- Indizes für die Tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `id` (`id`,`user_id`,`device_id`);

--
-- Indizes für die Tabelle `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_id` (`title_id`),
  ADD KEY `avatar_id` (`avatar_id`),
  ADD KEY `id` (`id`,`title_id`,`avatar_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT für Tabelle `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT für Tabelle `device`
--
ALTER TABLE `device`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT für Tabelle `model`
--
ALTER TABLE `model`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT für Tabelle `route`
--
ALTER TABLE `route`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT für Tabelle `seat`
--
ALTER TABLE `seat`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT für Tabelle `session`
--
ALTER TABLE `session`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `title`
--
ALTER TABLE `title`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`);

--
-- Constraints der Tabelle `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`);

--
-- Constraints der Tabelle `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`);

--
-- Constraints der Tabelle `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);

--
-- Constraints der Tabelle `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  ADD CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

--
-- Constraints der Tabelle `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`);

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
