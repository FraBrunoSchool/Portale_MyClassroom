-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 23, 2021 alle 10:35
-- Versione del server: 10.4.17-MariaDB
-- Versione PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_myclassroom`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `alunni`
--

CREATE TABLE `alunni` (
  `id_alunno` int(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `id_classe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `argomenti`
--

CREATE TABLE `argomenti` (
  `id_argomento` int(10) NOT NULL,
  `descr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE `classi` (
  `id_classe` varchar(5) NOT NULL,
  `num_alunni` int(2) NOT NULL,
  `id_docente_coord` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `dirigenza`
--

CREATE TABLE `dirigenza` (
  `id_dirigenza` int(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `num_tel` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `id_docente` int(10) NOT NULL,
  `password` int(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `docentidelleclassi`
--

CREATE TABLE `docentidelleclassi` (
  `id_classe` varchar(5) NOT NULL,
  `id_docente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `docentiinsegnanomaterie`
--

CREATE TABLE `docentiinsegnanomaterie` (
  `id_docente` int(10) NOT NULL,
  `id_materia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `files`
--

CREATE TABLE `files` (
  `id_file` int(10) NOT NULL,
  `titolo_documento` varchar(30) NOT NULL,
  `id_alunno` int(5) NOT NULL,
  `id_verifica` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `materie`
--

CREATE TABLE `materie` (
  `id_materia` int(10) NOT NULL,
  `nome_materia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `verifiche`
--

CREATE TABLE `verifiche` (
  `id_verifica` int(10) NOT NULL,
  `titolo_documento` varchar(30) NOT NULL,
  `data_scadenza` date NOT NULL,
  `ora_scadenza` time NOT NULL,
  `id_docente` int(10) NOT NULL,
  `id_materia` int(10) NOT NULL,
  `id_argomento` int(10) NOT NULL,
  `id_classe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `alunni`
--
ALTER TABLE `alunni`
  ADD PRIMARY KEY (`id_alunno`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Indici per le tabelle `argomenti`
--
ALTER TABLE `argomenti`
  ADD PRIMARY KEY (`id_argomento`);

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id_classe`);

--
-- Indici per le tabelle `dirigenza`
--
ALTER TABLE `dirigenza`
  ADD PRIMARY KEY (`id_dirigenza`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indici per le tabelle `docentidelleclassi`
--
ALTER TABLE `docentidelleclassi`
  ADD PRIMARY KEY (`id_classe`,`id_docente`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `docentiinsegnanomaterie`
--
ALTER TABLE `docentiinsegnanomaterie`
  ADD PRIMARY KEY (`id_docente`,`id_materia`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indici per le tabelle `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `id_alunno` (`id_alunno`),
  ADD KEY `id_verifica` (`id_verifica`);

--
-- Indici per le tabelle `materie`
--
ALTER TABLE `materie`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indici per le tabelle `verifiche`
--
ALTER TABLE `verifiche`
  ADD PRIMARY KEY (`id_verifica`),
  ADD KEY `id_argomento` (`id_argomento`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `id_materia` (`id_materia`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `alunni`
--
ALTER TABLE `alunni`
  MODIFY `id_alunno` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `argomenti`
--
ALTER TABLE `argomenti`
  MODIFY `id_argomento` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `dirigenza`
--
ALTER TABLE `dirigenza`
  MODIFY `id_dirigenza` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id_docente` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `files`
--
ALTER TABLE `files`
  MODIFY `id_file` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `materie`
--
ALTER TABLE `materie`
  MODIFY `id_materia` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `verifiche`
--
ALTER TABLE `verifiche`
  MODIFY `id_verifica` int(10) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `alunni`
--
ALTER TABLE `alunni`
  ADD CONSTRAINT `alunni_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `docentidelleclassi`
--
ALTER TABLE `docentidelleclassi`
  ADD CONSTRAINT `docentidelleclassi_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docentidelleclassi_ibfk_3` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `docentiinsegnanomaterie`
--
ALTER TABLE `docentiinsegnanomaterie`
  ADD CONSTRAINT `docentiinsegnanomaterie_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materie` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docentiinsegnanomaterie_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`id_alunno`) REFERENCES `alunni` (`id_alunno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`id_verifica`) REFERENCES `verifiche` (`id_verifica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `verifiche`
--
ALTER TABLE `verifiche`
  ADD CONSTRAINT `verifiche_ibfk_1` FOREIGN KEY (`id_argomento`) REFERENCES `argomenti` (`id_argomento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verifiche_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verifiche_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verifiche_ibfk_4` FOREIGN KEY (`id_materia`) REFERENCES `materie` (`id_materia`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
