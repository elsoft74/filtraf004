-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 24, 2022 at 02:28 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u153265461_monte`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistiti`
--

CREATE TABLE `assistiti` (
  `id` int(11) NOT NULL,
  `id_usca` int(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `cognome` varchar(60) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `indirizzo` text NOT NULL,
  `codicefiscale` varchar(16) NOT NULL,
  `note` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `nascita` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assistiti`
--

INSERT INTO `assistiti` VALUES(1, NULL, 'Ivo', 'Pugliese', '3935397897', 'elsoft74@gmail.com', 'Via della liberta\' 15 - Roccella Jonica (RC)', 'PGLVIO74M20H224C', 'Inserimento di test', 1, NULL);
INSERT INTO `assistiti` VALUES(2, NULL, 'IVO', 'PUGLIESE', '3431234242', 'a@b.com', 'VIA DI CASA MIA', 'PAG', 'Do Re Mi ', 1, NULL);
INSERT INTO `assistiti` VALUES(3, 1, 'GUGLIELMO', 'DUGO', '222222222', 'ed@dasf-ot', 'DASCVVOA', 'DGUGLL', '', 1, '2022-08-01 00:00:00');
INSERT INTO `assistiti` VALUES(4, NULL, 'BVG', 'FVCHVB', '22', 'n@n.it', 'VK', 'MHBCHJ', '', 1, NULL);
INSERT INTO `assistiti` VALUES(5, NULL, 'PROVA', '1', '55555', '', 'VIA NON LO SO', 'DGUGLL87', '', 1, '1987-01-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `priorita`
--

CREATE TABLE `priorita` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(10) NOT NULL,
  `valore` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `priorita`
--

INSERT INTO `priorita` VALUES(1, 'Verde', 1, 1);
INSERT INTO `priorita` VALUES(2, 'Giallo', 2, 1);
INSERT INTO `priorita` VALUES(3, 'Rosso', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `richieste`
--

CREATE TABLE `richieste` (
  `id` int(11) NOT NULL,
  `id_assistito` int(11) NOT NULL,
  `id_tipologia` int(11) NOT NULL,
  `id_priorita` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `note` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `deleted_date` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `richieste`
--

INSERT INTO `richieste` VALUES(1, 2, 2, 1, '2022-08-15 00:00:00', 'Richiesta aggiornata nuovamente', 0, '2022-08-14 21:24:18', 1, '2022-08-15 16:08:01', 0, '2022-08-15 18:12:49', 6);
INSERT INTO `richieste` VALUES(2, 2, 1, 2, '2022-08-17 00:00:00', 'bbnam', 0, '2022-08-15 08:46:28', 1, NULL, NULL, '2022-08-15 14:51:39', 1);
INSERT INTO `richieste` VALUES(6, 2, 1, 1, '2022-08-31 00:00:00', 'Quarta dose', 0, '2022-08-15 16:11:09', 0, NULL, NULL, '2022-08-15 18:13:42', 6);
INSERT INTO `richieste` VALUES(7, 1, 1, 1, '0000-00-00 00:00:00', '', 0, '2022-08-15 18:17:28', 6, NULL, NULL, '2022-08-15 18:17:32', 6);
INSERT INTO `richieste` VALUES(8, 3, 2, 1, '2022-08-16 00:00:00', '', 1, '2022-08-15 18:18:48', 6, '2022-08-15 20:01:23', 5, NULL, NULL);
INSERT INTO `richieste` VALUES(9, 3, 1, 1, '0000-00-00 00:00:00', '', 0, '2022-08-15 18:20:06', 6, '2022-08-15 18:20:34', 6, '2022-08-15 20:01:40', 5);
INSERT INTO `richieste` VALUES(10, 3, 2, 1, '2022-08-31 00:00:00', '', 1, '2022-08-15 18:20:43', 6, '2022-08-19 10:19:40', 5, NULL, NULL);
INSERT INTO `richieste` VALUES(11, 3, 3, 1, '2022-08-22 00:00:00', '', 1, '2022-08-15 20:02:58', 5, NULL, NULL, NULL, NULL);
INSERT INTO `richieste` VALUES(12, 5, 1, 1, '0000-00-00 00:00:00', '', 0, '2022-08-17 17:41:58', 6, NULL, NULL, '2022-08-17 17:53:06', 6);
INSERT INTO `richieste` VALUES(13, 4, 1, 1, '0000-00-00 00:00:00', '', 0, '2022-08-17 17:53:23', 6, NULL, NULL, '2022-08-17 17:53:28', 6);
INSERT INTO `richieste` VALUES(14, 3, 1, 1, '2022-08-30 00:00:00', '', 1, '2022-08-22 05:43:01', 5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(20) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` VALUES(1, 'Admin', 1, '{\"canViewDetails\":true,\"canCreateUser\":true,\"canEditUser\":true,\"canDeleteUser\":true,\"canCreateAssistito\":true,\"canEditAssistito\":true,\"canDeleteAssistito\":true,\"canCreateRequest\":true,\"canDeleteRequest\":true,\"canEditRequest\":true,\"canExport\":false,\"canViewAllRequests\":true}');
INSERT INTO `roles` VALUES(2, 'Operatore', 1, '{\"canViewDetails\":false,\"canCreateUser\":false,\"canEditUser\":false,\"canDeleteUser\":false,\"canCreateAssistito\":true,\"canEditAssistito\":true,\"canDeleteAssistito\":false,\"canCreateRequest\":true,\"canDeleteRequest\":true,\"canEditRequest\":true,\"canExport\":false,\"canViewAllRequests\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `tipologie`
--

CREATE TABLE `tipologie` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipologie`
--

INSERT INTO `tipologie` VALUES(1, 'Vaccinazione', 1);
INSERT INTO `tipologie` VALUES(2, 'Visita', 1);
INSERT INTO `tipologie` VALUES(3, 'Tampone', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usca`
--

CREATE TABLE `usca` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `chiave` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `for_new_positive` tinyint(1) NOT NULL DEFAULT 0,
  `full_data` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usca`
--

INSERT INTO `usca` VALUES(1, 'Residenti Messina', 'piattaformeinformatiche.covid@asp.messina.it', 'MESSINA', 1, 1, 0);
INSERT INTO `usca` VALUES(2, 'Taormina', 'piattaformeinformatiche.covid@asp.messina.it', 'TAORMINA', 1, 0, 0);
INSERT INTO `usca` VALUES(3, 'Barcellona', 'piattaformeinformatiche.covid@asp.messina.it', 'BARCELLONA', 1, 0, 0);
INSERT INTO `usca` VALUES(4, 'Ionica', 'piattaformeinformatiche.covid@asp.messina.it', 'IONICA', 0, 0, 0);
INSERT INTO `usca` VALUES(5, 'Lipari', 'piattaformeinformatiche.covid@asp.messina.it', 'LIPARI', 1, 0, 0);
INSERT INTO `usca` VALUES(6, 'Longano', 'piattaformeinformatiche.covid@asp.messina.it', 'LONGANO', 0, 0, 0);
INSERT INTO `usca` VALUES(7, 'Milazzo', 'piattaformeinformatiche.covid@asp.messina.it', 'MILAZZO', 1, 0, 0);
INSERT INTO `usca` VALUES(8, 'Milazzo-Barcellona', 'piattaformeinformatiche.covid@asp.messina.it', 'MILAZZOBARCELLONA', 1, 0, 0);
INSERT INTO `usca` VALUES(9, 'Mistretta', 'piattaformeinformatiche.covid@asp.messina.it', 'MISTRETTA', 1, 0, 0);
INSERT INTO `usca` VALUES(10, 'Nebrodi', 'piattaformeinformatiche.covid@asp.messina.it', 'NEBRODI', 0, 0, 0);
INSERT INTO `usca` VALUES(11, 'Patti', 'piattaformeinformatiche.covid@asp.messina.it', 'PATTI', 1, 0, 0);
INSERT INTO `usca` VALUES(12, 'Patti Scolastica', 'piattaformeinformatiche.covid@asp.messina.it', 'PATTISCOLASTICA', 0, 0, 0);
INSERT INTO `usca` VALUES(13, 'Peloritani', 'piattaformeinformatiche.covid@asp.messina.it', 'PELORITANI', 0, 0, 0);
INSERT INTO `usca` VALUES(14, 'Peloritani 2', 'piattaformeinformatiche.covid@asp.messina.it', 'PELORITANI2', 0, 0, 0);
INSERT INTO `usca` VALUES(15, 'Roccalumera', 'piattaformeinformatiche.covid@asp.messina.it', 'ROCCALUMERA', 1, 1, 0);
INSERT INTO `usca` VALUES(16, 'San\'Agata di Militello', 'piattaformeinformatiche.covid@asp.messina.it', 'SANTAGATA', 1, 0, 0);
INSERT INTO `usca` VALUES(17, 'Saponara', 'piattaformeinformatiche.covid@asp.messina.it', 'SAPONARA', 1, 1, 0);
INSERT INTO `usca` VALUES(18, 'Tirrenica', 'piattaformeinformatiche.covid@asp.messina.it', 'TIRRENICA', 0, 0, 0);
INSERT INTO `usca` VALUES(19, 'Altri', 'piattaformeinformatiche.covid@asp.messina.it', 'ALTRI', 1, 0, 0);
INSERT INTO `usca` VALUES(20, 'Nuovi Positivi', 'piattaformeinformatiche.covid@asp.messina.it', 'NUOVI', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `role_id` int(11) NOT NULL,
  `id_usca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'Ivo', 'Pugliese', 'iwok', 'ivo@ivopugliese.it', '27b1c75f7de9997ec5a2ac654e8a7c85cfab3d6221b2ed1b5bf80a2c708c9e4e', 1, 1, NULL);
INSERT INTO `users` VALUES(4, 'a', 'a', 'iwok2', 'sa', 'fa1de4364cfd94d75e7bda5d0583bcb136d6437c88a36dc06bcd64566a3530ae', 0, 1, NULL);
INSERT INTO `users` VALUES(5, 'i', 'p', 'iwokop', 'elsoft74@gmail.com', '27b1c75f7de9997ec5a2ac654e8a7c85cfab3d6221b2ed1b5bf80a2c708c9e4e', 1, 2, 8);
INSERT INTO `users` VALUES(6, 'William', 'Dugo', 'william.dugo', 'w.dugo87@gmail.com', 'af34c3b20653088651cfc35176ba7fff6d3b11387522d6ea4fbae258fa01462b', 1, 1, NULL);
INSERT INTO `users` VALUES(7, 'William', 'Dugo', 'william.dugo2', 'w.dugo87@gmail.com', 'af34c3b20653088651cfc35176ba7fff6d3b11387522d6ea4fbae258fa01462b', 1, 2, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_richieste`
-- (See below for the actual view)
--
CREATE TABLE `vista_richieste` (
`id_assistito` int(11)
,`nome` varchar(60)
,`cognome` varchar(60)
,`email` varchar(50)
,`indirizzo` text
,`codicefiscale` varchar(16)
,`note_assistito` text
,`assistito_is_active` tinyint(1)
,`telefono` varchar(10)
,`nascita` datetime
,`id_usca` int(11)
,`id_richiesta` int(11)
,`id_tipologia` int(11)
,`id_priorita` int(11)
,`data` datetime
,`note_richiesta` text
,`richiesta_is_active` tinyint(1)
,`created` timestamp
,`created_by` int(11)
,`last_update` timestamp
,`last_update_by` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vista_richieste`
--
DROP TABLE IF EXISTS `vista_richieste`;

CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`u153265461_monte`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vista_richieste`  AS SELECT `a`.`id` AS `id_assistito`, `a`.`nome` AS `nome`, `a`.`cognome` AS `cognome`, `a`.`email` AS `email`, `a`.`indirizzo` AS `indirizzo`, `a`.`codicefiscale` AS `codicefiscale`, `a`.`note` AS `note_assistito`, `a`.`is_active` AS `assistito_is_active`, `a`.`telefono` AS `telefono`, `a`.`nascita` AS `nascita`, `a`.`id_usca` AS `id_usca`, `r`.`id` AS `id_richiesta`, `r`.`id_tipologia` AS `id_tipologia`, `r`.`id_priorita` AS `id_priorita`, `r`.`data` AS `data`, `r`.`note` AS `note_richiesta`, `r`.`is_active` AS `richiesta_is_active`, `r`.`created` AS `created`, `r`.`created_by` AS `created_by`, `r`.`last_update` AS `last_update`, `r`.`last_update_by` AS `last_update_by` FROM (`assistiti` `a` left join `richieste` `r` on(`a`.`id` = `r`.`id_assistito`)) WHERE `a`.`is_active` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistiti`
--
ALTER TABLE `assistiti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `ndx_user_usca` (`id_usca`);

--
-- Indexes for table `priorita`
--
ALTER TABLE `priorita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `richieste`
--
ALTER TABLE `richieste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_assistito` (`id_assistito`),
  ADD KEY `id_tipologia` (`id_tipologia`),
  ADD KEY `id_priorita` (`id_priorita`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tipologie`
--
ALTER TABLE `tipologie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `usca`
--
ALTER TABLE `usca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assistiti`
--
ALTER TABLE `assistiti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `priorita`
--
ALTER TABLE `priorita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `richieste`
--
ALTER TABLE `richieste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipologie`
--
ALTER TABLE `tipologie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistiti`
--
ALTER TABLE `assistiti`
  ADD CONSTRAINT `fk_user_usca` FOREIGN KEY (`id_usca`) REFERENCES `usca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
