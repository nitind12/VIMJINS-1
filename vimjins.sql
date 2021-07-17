-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2021 at 06:50 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vimjins`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthId` int(11) NOT NULL,
  `AuthorName` varchar(200) NOT NULL,
  `AuthContact` varchar(10) NOT NULL,
  `AuthEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthId`, `AuthorName`, `AuthContact`, `AuthEmail`) VALUES
(1, 'Dr. Nitin Deepak', '9634944223', 'nitin.d12@gmail.com'),
(2, 'Mrs. Gunjan Mathur', '9634944223', 'gunjan.m19@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `jId` int(11) NOT NULL,
  `jIssue` int(11) NOT NULL,
  `jVolume` int(11) NOT NULL,
  `jDoIssue` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`jId`, `jIssue`, `jVolume`, `jDoIssue`) VALUES
(1, 1, 1, '31/07/2021'),
(2, 1, 2, '1/01/2022');

-- --------------------------------------------------------

--
-- Table structure for table `journaldesc`
--

CREATE TABLE `journaldesc` (
  `id` int(11) NOT NULL,
  `journalid` int(11) NOT NULL,
  `paperTitle` varchar(1000) NOT NULL,
  `authId` int(11) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthId`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`jId`);

--
-- Indexes for table `journaldesc`
--
ALTER TABLE `journaldesc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journalid` (`journalid`),
  ADD KEY `paperTitle` (`paperTitle`(768)),
  ADD KEY `authId` (`authId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `jId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `journaldesc`
--
ALTER TABLE `journaldesc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journaldesc`
--
ALTER TABLE `journaldesc`
  ADD CONSTRAINT `journaldesc_ibfk_1` FOREIGN KEY (`authId`) REFERENCES `authors` (`AuthId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `journaldesc_ibfk_2` FOREIGN KEY (`journalid`) REFERENCES `journal` (`jId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
