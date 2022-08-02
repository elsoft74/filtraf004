-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Lug 17, 2022 alle 18:12
-- Versione del server: 10.5.15-MariaDB-0+deb11u1
-- Versione PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smistaelenchiusca`
--

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `comuni_per_usca`
-- (Vedi sotto per la vista effettiva)
--
DROP VIEW IF EXISTS `comuni_per_usca`;
CREATE TABLE `comuni_per_usca` (
`usca` varchar(30)
,`comune` varchar(50)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `localita`
--

DROP TABLE IF EXISTS `localita`;
CREATE TABLE `localita` (
  `id` int(11) NOT NULL,
  `id_usca` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELAZIONI PER TABELLA `localita`:
--   `id_usca`
--       `usca` -> `id`
--

--
-- Dump dei dati per la tabella `localita`
--

INSERT INTO `localita` (`id`, `id_usca`, `nome`) VALUES
(3, 1, 'MESSINA'),
(4, 1, 'MESSINA (ME)'),
(7, 2, 'GIARDINI-NAXOS (ME)'),
(8, 16, 'ACQUEDOLCI (ME)'),
(9, 16, 'ALCARA LI FUSI (ME)'),
(10, 15, 'ALI\' (ME)'),
(11, 15, 'ALI\' TERME (ME)'),
(12, 2, 'ANTILLO (ME)'),
(13, 3, 'BARCELLONA POZZO DI GOTTO (ME)'),
(14, 3, 'BASICO\' (ME)'),
(15, 11, 'BROLO (ME)'),
(18, 16, 'CAPIZZI (ME)'),
(19, 16, 'CAPO D\'ORLANDO (ME)'),
(20, 16, 'CAPRI LEONE (ME)'),
(21, 16, 'CARONIA (ME)'),
(22, 2, 'CASALVECCHIO SICULO (ME)'),
(23, 9, 'CASTEL DI LUCIO (ME)'),
(24, 16, 'CASTELL\'UMBERTO (ME)'),
(25, 2, 'CASTELMOLA (ME)'),
(26, 3, 'CASTROREALE (ME)'),
(27, 2, 'CESARO\' (ME)'),
(28, 8, 'CONDRO\' (ME)'),
(29, 8, 'FALCONE (ME)'),
(30, 11, 'FICARRA (ME)'),
(31, 15, 'FIUMEDINISI (ME)'),
(32, 11, 'FLORESTA (ME)'),
(33, 2, 'FONDACHELLI-FANTINA (ME)'),
(34, 2, 'FORZA D\'AGRO\' (ME)'),
(35, 2, 'FRANCAVILLA DI SICILIA (ME)'),
(36, 16, 'FRAZZANO\' (ME)'),
(37, 15, 'FURCI SICULO (ME)'),
(38, 8, 'FURNARI (ME)'),
(39, 2, 'GAGGI (ME)'),
(40, 16, 'GALATI MAMERTINO (ME)'),
(41, 2, 'GALLODORO (ME)'),
(42, 11, 'GIOIOSA MAREA (ME)'),
(43, 2, 'GRANITI (ME)'),
(44, 8, 'GUALTIERI SICAMINO\' (ME)'),
(45, 15, 'ITALA (ME)'),
(46, 5, 'LENI (ME)'),
(47, 2, 'LETOJANNI (ME)'),
(48, 11, 'LIBRIZZI (ME)'),
(49, 2, 'LIMINA (ME)'),
(50, 5, 'LIPARI (ME)'),
(51, 16, 'LONGI (ME)'),
(52, 5, 'MALFA (ME)'),
(53, 2, 'MALVAGNA (ME)'),
(54, 15, 'MANDANICI (ME)'),
(55, 3, 'MAZZARRA\' SANT\'ANDREA (ME)'),
(56, 8, 'MERI\' (ME)'),
(57, 7, 'MILAZZO (ME)'),
(58, 16, 'MILITELLO ROSMARINO (ME)'),
(59, 16, 'MIRTO (ME)'),
(60, 9, 'MISTRETTA (ME)'),
(61, 2, 'MOIO ALCANTARA (ME)'),
(62, 7, 'MONFORTE SAN GIORGIO (ME)'),
(63, 2, 'MONGIUFFI MELIA (ME)'),
(64, 11, 'MONTAGNAREALE (ME)'),
(65, 8, 'MONTALBANO ELICONA (ME)'),
(66, 2, 'MOTTA CAMASTRA (ME)'),
(67, 9, 'MOTTA D\'AFFERMO (ME)'),
(68, 16, 'NASO (ME)'),
(69, 15, 'NIZZA DI SICILIA (ME)'),
(70, 8, 'NOVARA DI SICILIA (ME)'),
(71, 11, 'OLIVERI (ME)'),
(72, 8, 'PACE DEL MELA (ME)'),
(73, 15, 'PAGLIARA (ME)'),
(74, 11, 'PATTI (ME)'),
(75, 9, 'PETTINEO (ME)'),
(76, 11, 'PIRAINO (ME)'),
(77, 11, 'RACCUJA (ME)'),
(78, 9, 'REITANO (ME)'),
(79, 2, 'ROCCAFIORITA (ME)'),
(80, 15, 'ROCCALUMERA (ME)'),
(81, 7, 'ROCCAVALDINA (ME)'),
(82, 2, 'ROCCELLA VALDEMONE (ME)'),
(83, 3, 'RODI\' MILICI (ME)'),
(84, 17, 'ROMETTA (ME)'),
(85, 8, 'SAN FILIPPO DEL MELA (ME)'),
(86, 16, 'SAN FRATELLO (ME)'),
(87, 16, 'SAN MARCO D\'ALUNZIO (ME)'),
(88, 8, 'SAN PIER NICETO (ME)'),
(89, 11, 'SAN PIERO PATTI (ME)'),
(90, 16, 'SAN SALVATORE DI FITALIA (ME)'),
(91, 2, 'SAN TEODORO (ME)'),
(92, 2, 'SANTA DOMENICA VITTORIA (ME)'),
(93, 8, 'SANTA LUCIA DEL MELA (ME)'),
(94, 5, 'SANTA MARINA SALINA (ME)'),
(95, 2, 'SANTA TERESA DI RIVA (ME)'),
(96, 16, 'SANT\'AGATA DI MILITELLO (ME)'),
(97, 2, 'SANT\'ALESSIO SICULO (ME)'),
(98, 11, 'SANT\'ANGELO DI BROLO (ME)'),
(99, 9, 'SANTO STEFANO DI CAMASTRA (ME)'),
(100, 17, 'SAPONARA (ME)'),
(101, 2, 'SAVOCA (ME)'),
(102, 15, 'SCALETTA ZANCLEA (ME)'),
(103, 11, 'SINAGRA (ME)'),
(104, 7, 'SPADAFORA (ME)'),
(105, 2, 'TAORMINA (ME)'),
(106, 3, 'TERME VIGLIATORE (ME)'),
(107, 7, 'TORREGROTTA (ME)'),
(108, 16, 'TORRENOVA (ME)'),
(109, 16, 'TORTORICI (ME)'),
(110, 3, 'TRIPI (ME)'),
(111, 9, 'TUSA (ME)'),
(112, 16, 'UCRIA (ME)'),
(113, 7, 'VALDINA (ME)'),
(114, 7, 'VENETICO (ME)'),
(115, 17, 'VILLAFRANCA TIRRENA (ME)');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `numero_comuni_per_usca`
-- (Vedi sotto per la vista effettiva)
--
DROP VIEW IF EXISTS `numero_comuni_per_usca`;
CREATE TABLE `numero_comuni_per_usca` (
`usca` varchar(30)
,`comuni` bigint(21)
);

-- --------------------------------------------------------

--
-- Struttura della tabella `usca`
--

DROP TABLE IF EXISTS `usca`;
CREATE TABLE `usca` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `chiave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELAZIONI PER TABELLA `usca`:
--

--
-- Dump dei dati per la tabella `usca`
--

INSERT INTO `usca` (`id`, `descrizione`, `email`, `chiave`) VALUES
(1, 'Messina (Nord, Centro, Sud)', NULL, 'MESSINA'),
(2, 'Taormina', NULL, 'TAORMINA'),
(3, 'Barcellona', NULL, 'BARCELLONA'),
(4, 'Ionica', NULL, 'IONICA'),
(5, 'Lipari', NULL, 'LIPARI'),
(6, 'Longano', NULL, 'LONGANO'),
(7, 'Milazzo', NULL, 'MILAZZO'),
(8, 'Milazzo-Barcellona', NULL, 'MILAZZOBARCELLONA'),
(9, 'Mistretta', NULL, 'MISTRETTA'),
(10, 'Nebrodi', NULL, 'NEBRODI'),
(11, 'Patti', NULL, 'PATTI'),
(12, 'Patti Scolastica', NULL, 'PATTISCOLASTICA'),
(13, 'Peloritani', NULL, 'PELORITANI'),
(14, 'Peloritani 2', NULL, 'PELORITANI2'),
(15, 'Roccalumera', NULL, 'ROCCALUMERA'),
(16, 'San\'Agata di Militello', NULL, 'SANTAGATA'),
(17, 'Saponara', NULL, 'SAPONARA'),
(18, 'Tirrenica', NULL, 'TIRRENICA');

-- --------------------------------------------------------

--
-- Struttura per vista `comuni_per_usca`
--
DROP TABLE IF EXISTS `comuni_per_usca`;

DROP VIEW IF EXISTS `comuni_per_usca`;
CREATE ALGORITHM=UNDEFINED DEFINER=`miniced`@`localhost` SQL SECURITY DEFINER VIEW `comuni_per_usca`  AS SELECT `usca`.`descrizione` AS `usca`, `localita`.`nome` AS `comune` FROM (`localita` join `usca` on(`localita`.`id_usca` = `usca`.`id`)) ORDER BY `usca`.`descrizione` ASC, `localita`.`nome` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `numero_comuni_per_usca`
--
DROP TABLE IF EXISTS `numero_comuni_per_usca`;

DROP VIEW IF EXISTS `numero_comuni_per_usca`;
CREATE ALGORITHM=UNDEFINED DEFINER=`miniced`@`localhost` SQL SECURITY DEFINER VIEW `numero_comuni_per_usca`  AS SELECT `usca`.`descrizione` AS `usca`, count(`localita`.`nome`) AS `comuni` FROM (`localita` join `usca` on(`localita`.`id_usca` = `usca`.`id`)) GROUP BY `usca`.`id` ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `localita`
--
ALTER TABLE `localita`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `id` (`id`),
  ADD KEY `id_usca` (`id_usca`);

--
-- Indici per le tabelle `usca`
--
ALTER TABLE `usca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `localita`
--
ALTER TABLE `localita`
  ADD CONSTRAINT `fk_localita_usca` FOREIGN KEY (`id_usca`) REFERENCES `usca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
