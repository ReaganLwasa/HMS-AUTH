-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 06:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `Id` varchar(50) NOT NULL,
  `patientId` varchar(50) NOT NULL,
  `dateofappointment` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `medicalpersonnel` varchar(100) NOT NULL,
  `additionalinfo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinicalfindings`
--

CREATE TABLE `clinicalfindings` (
  `Id` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `presentingcomplaint` varchar(700) NOT NULL,
  `clinicalnotes` varchar(700) NOT NULL,
  `ros` varchar(700) NOT NULL,
  `pmh/pms` varchar(500) NOT NULL,
  `poh` varchar(500) NOT NULL,
  `pgh` varchar(500) NOT NULL,
  `fsh` varchar(500) NOT NULL,
  `generalappearance` varchar(700) NOT NULL,
  `respiratory` varchar(700) NOT NULL,
  `cvs` varchar(500) NOT NULL,
  `ent` varchar(500) NOT NULL,
  `abdomenandgut` varchar(500) NOT NULL,
  `cns` varchar(500) NOT NULL,
  `eye` varchar(500) NOT NULL,
  `muscularskeletal` varchar(700) NOT NULL,
  `skinandothers` varchar(700) NOT NULL,
  `pv/pr` varchar(500) NOT NULL,
  `psychologicalstatus` varchar(500) NOT NULL,
  `provisionaldiagnosis` varchar(500) NOT NULL,
  `treatmentplan` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dental`
--

CREATE TABLE `dental` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drugprescription`
--

CREATE TABLE `drugprescription` (
  `Id` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `drugnames` varchar(100) NOT NULL,
  `drugdosages` varchar(100) NOT NULL,
  `totaldrugprices` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `externalsales`
--

CREATE TABLE `externalsales` (
  `Id` varchar(50) NOT NULL,
  `drugname` varchar(50) NOT NULL,
  `drugqty` varchar(50) NOT NULL,
  `drugprice` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `Id` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `dateofbirth` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `maritalstatus` varchar(20) NOT NULL,
  `nokfirstname` varchar(100) NOT NULL,
  `noklastname` varchar(100) NOT NULL,
  `nokrelationship` varchar(100) NOT NULL,
  `nokcontact` varchar(100) NOT NULL,
  `addittionalinfo` varchar(200) DEFAULT NULL,
  `dateofregistration` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patienttestsandscans`
--

CREATE TABLE `patienttestsandscans` (
  `Id` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `testname` varchar(50) NOT NULL,
  `requestedby` varchar(100) NOT NULL,
  `additionalinfo` varchar(500) DEFAULT NULL,
  `price` varchar(50) NOT NULL,
  `paymentstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patienttriage`
--

CREATE TABLE `patienttriage` (
  `triageId` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `temperature` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `pulse` varchar(100) NOT NULL,
  `muac` varchar(100) NOT NULL,
  `muacstatus` varchar(100) NOT NULL,
  `bloodpressure` varchar(100) NOT NULL,
  `headcircum` varchar(100) NOT NULL,
  `respirationrate` varchar(100) NOT NULL,
  `oxygensaturation` varchar(100) NOT NULL,
  `bmi` varchar(100) NOT NULL,
  `notes` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Id` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `totalamount` varchar(50) NOT NULL,
  `paymentmethod` varchar(50) NOT NULL,
  `paymentstatus` varchar(100) NOT NULL,
  `balance` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `Id` varchar(50) NOT NULL,
  `patientId` varchar(50) NOT NULL,
  `referraldate` varchar(50) NOT NULL,
  `referredby` varchar(100) NOT NULL,
  `referredtodepartment` varchar(100) NOT NULL,
  `medicalpersonnel` varchar(100) NOT NULL,
  `additionalinfo` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testsandscans`
--

CREATE TABLE `testsandscans` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testsandscansresults`
--

CREATE TABLE `testsandscansresults` (
  `Id` varchar(50) NOT NULL,
  `visitId` varchar(50) NOT NULL,
  `testname` varchar(50) NOT NULL,
  `results` varchar(700) NOT NULL,
  `additionalinfo` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dateofbirth` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `maritalstatus` varchar(100) NOT NULL,
  `dateofregistration` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `visitId` varchar(50) NOT NULL,
  `patientId` varchar(50) NOT NULL,
  `patientcategory` varchar(100) NOT NULL,
  `visitdate` varchar(100) NOT NULL,
  `departmenttosee` varchar(100) NOT NULL,
  `personneltosee` varchar(100) NOT NULL,
  `additionalinfo` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `medicalpersonnel` (`medicalpersonnel`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `clinicalfindings`
--
ALTER TABLE `clinicalfindings`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `dental`
--
ALTER TABLE `dental`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `drugprescription`
--
ALTER TABLE `drugprescription`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `drugnames` (`drugnames`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `externalsales`
--
ALTER TABLE `externalsales`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `drugname` (`drugname`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `patienttestsandscans`
--
ALTER TABLE `patienttestsandscans`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `visitId` (`visitId`),
  ADD KEY `testname` (`testname`);

--
-- Indexes for table `patienttriage`
--
ALTER TABLE `patienttriage`
  ADD PRIMARY KEY (`triageId`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `medicalpersonnel` (`medicalpersonnel`),
  ADD KEY `username` (`medicalpersonnel`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `testsandscans`
--
ALTER TABLE `testsandscans`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `testsandscansresults`
--
ALTER TABLE `testsandscansresults`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `visitId` (`visitId`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`visitId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`medicalpersonnel`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patients` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clinicalfindings`
--
ALTER TABLE `clinicalfindings`
  ADD CONSTRAINT `clinicalfindings_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drugprescription`
--
ALTER TABLE `drugprescription`
  ADD CONSTRAINT `drugprescription_ibfk_1` FOREIGN KEY (`drugnames`) REFERENCES `drugs` (`Name`),
  ADD CONSTRAINT `drugprescription_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `externalsales`
--
ALTER TABLE `externalsales`
  ADD CONSTRAINT `externalsales_ibfk_1` FOREIGN KEY (`drugname`) REFERENCES `drugs` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patienttestsandscans`
--
ALTER TABLE `patienttestsandscans`
  ADD CONSTRAINT `patienttestsandscans_ibfk_1` FOREIGN KEY (`testname`) REFERENCES `testsandscans` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patienttestsandscans_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patienttriage`
--
ALTER TABLE `patienttriage`
  ADD CONSTRAINT `patienttriage_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`medicalpersonnel`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referrals_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patients` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testsandscansresults`
--
ALTER TABLE `testsandscansresults`
  ADD CONSTRAINT `testsandscansresults_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `visits` (`visitId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `patients` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
