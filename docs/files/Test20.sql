-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 20. Okt 2020 um 15:44
-- Server-Version: 8.0.22
-- PHP-Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Test20`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assistenten`
--

CREATE TABLE `assistenten` (
  `pers_nr` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `fachgebiet` varchar(30) DEFAULT NULL,
  `von` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `assistenten`
--

INSERT INTO `assistenten` (`pers_nr`, `name`, `fachgebiet`, `von`) VALUES
(3002, 'Sokrates', 'Ideenlehre', 2125),
(3003, 'Aristoteles', 'Syllogistik', 2125),
(3004, 'Wittgenstein', 'Sprachtheorie', 2126),
(3005, 'Mitchell', 'Planetenbewegung', 2127),
(3006, 'Newton', 'Keplersche Gesetze', 2134),
(3007, 'Whitehead', 'analytische Philosophie', 2134);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hoeren`
--

CREATE TABLE `hoeren` (
  `matr_nr` int NOT NULL,
  `vorl_nr` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `hoeren`
--

INSERT INTO `hoeren` (`matr_nr`, `vorl_nr`) VALUES
(25403, 5022),
(26120, 5001),
(27550, 4052),
(27550, 5001),
(28106, 5041),
(28106, 5052),
(28106, 5216),
(28106, 5259),
(29120, 5001),
(29120, 5041),
(29120, 5049),
(29555, 5001),
(29555, 5022);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `professoren`
--

CREATE TABLE `professoren` (
  `pers_nr` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `rang` char(2) DEFAULT NULL,
  `raum` int DEFAULT NULL
) ;

--
-- Daten für Tabelle `professoren`
--

INSERT INTO `professoren` (`pers_nr`, `name`, `rang`, `raum`) VALUES
(2125, 'Hypathia', 'C4', 226),
(2126, 'Russel', 'C4', 232),
(2127, 'Meitner', 'C3', 310),
(2133, 'Gauss', 'C3', 52),
(2134, 'Kepler', 'C3', 309),
(2136, 'Curie', 'C4', 36),
(2137, 'Galileo', 'C4', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pruefen`
--

CREATE TABLE `pruefen` (
  `matr_nr` int NOT NULL,
  `vorl_nr` int NOT NULL,
  `pers_nr` int DEFAULT NULL,
  `note` decimal(2,1) DEFAULT NULL
) ;

--
-- Daten für Tabelle `pruefen`
--

INSERT INTO `pruefen` (`matr_nr`, `vorl_nr`, `pers_nr`, `note`) VALUES
(25403, 5041, 2125, '2.0'),
(27550, 4630, 2137, '2.0'),
(28106, 5001, 2126, '1.0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `studenten`
--

CREATE TABLE `studenten` (
  `matr_nr` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `semester` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `studenten`
--

INSERT INTO `studenten` (`matr_nr`, `name`, `semester`) VALUES
(24002, 'Dijkstra', 18),
(25403, 'Einstein', 12),
(26120, 'Goeppert-Mayer', 10),
(26830, 'Noether', 8),
(27550, 'Goedel', 6),
(28106, 'Lovelace', 3),
(29120, 'Bartik', 2),
(29555, 'Pasteur', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voraussetzen`
--

CREATE TABLE `voraussetzen` (
  `vorgaenger` int NOT NULL,
  `nachfolger` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `voraussetzen`
--

INSERT INTO `voraussetzen` (`vorgaenger`, `nachfolger`) VALUES
(5041, 5052),
(5041, 5216),
(5043, 5052),
(5052, 5022),
(5259, 5041),
(5259, 5043),
(5259, 5049);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vorlesungen`
--

CREATE TABLE `vorlesungen` (
  `vorl_nr` int NOT NULL,
  `titel` varchar(30) DEFAULT NULL,
  `sws` int DEFAULT NULL,
  `gelesen_von` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `vorlesungen`
--

INSERT INTO `vorlesungen` (`vorl_nr`, `titel`, `sws`, `gelesen_von`) VALUES
(4052, 'Medizin', 4, 2125),
(4630, 'Mechanik', 4, 2137),
(5001, 'Physik', 4, 2137),
(5022, 'Astronomie', 2, 2134),
(5041, 'Ethik', 4, 2125),
(5043, 'Erkenntnistheorie', 3, 2126),
(5049, 'Philosophie', 2, 2125),
(5052, 'Wissenschaftstheorie', 3, 2126),
(5216, 'Logik', 2, 2126),
(5259, 'Mathematik', 2, 2133);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `assistenten`
--
ALTER TABLE `assistenten`
  ADD PRIMARY KEY (`pers_nr`),
  ADD KEY `von` (`von`);

--
-- Indizes für die Tabelle `hoeren`
--
ALTER TABLE `hoeren`
  ADD PRIMARY KEY (`matr_nr`,`vorl_nr`);

--
-- Indizes für die Tabelle `professoren`
--
ALTER TABLE `professoren`
  ADD PRIMARY KEY (`pers_nr`),
  ADD UNIQUE KEY `raum` (`raum`);

--
-- Indizes für die Tabelle `pruefen`
--
ALTER TABLE `pruefen`
  ADD PRIMARY KEY (`matr_nr`,`vorl_nr`);

--
-- Indizes für die Tabelle `studenten`
--
ALTER TABLE `studenten`
  ADD PRIMARY KEY (`matr_nr`);

--
-- Indizes für die Tabelle `voraussetzen`
--
ALTER TABLE `voraussetzen`
  ADD PRIMARY KEY (`vorgaenger`,`nachfolger`);

--
-- Indizes für die Tabelle `vorlesungen`
--
ALTER TABLE `vorlesungen`
  ADD PRIMARY KEY (`vorl_nr`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `assistenten`
--
ALTER TABLE `assistenten`
  ADD CONSTRAINT `assistenten_ibfk_1` FOREIGN KEY (`von`) REFERENCES `professoren` (`pers_nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
