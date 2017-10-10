-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2017 at 12:12 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaldatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttable`
--

CREATE TABLE `appointmenttable` (
  `appointmentid` int(5) NOT NULL,
  `appointmentdate` date NOT NULL,
  `doctorid` int(5) NOT NULL,
  `patientid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmenttable`
--

INSERT INTO `appointmenttable` (`appointmentid`, `appointmentdate`, `doctorid`, `patientid`) VALUES
(401, '2017-06-11', 201, 101),
(403, '2017-06-22', 201, 103),
(404, '2017-06-24', 203, 101),
(405, '2017-06-16', 203, 102);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billno` int(5) NOT NULL,
  `patientid` int(5) NOT NULL,
  `bill` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billno`, `patientid`, `bill`) VALUES
(501, 101, 100),
(502, 102, 200),
(503, 102, 200),
(504, 104, 100),
(505, 104, 100);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `name`, `department`, `email`, `gender`) VALUES
(201, 'naga praneeth', 'eye', 'praneeth@gmail.com', 'male'),
(202, 'bushan', 'skin', 'bushan@gmail.com', 'male'),
(203, 'srikar', 'cardiologist', 'srikar@gmail.com', 'male'),
(204, 'naga', 'Anesthesiologist', 'naga@gmail.com', 'male'),
(205, 'siva', 'psychiatrist', 'siva@gmail.com', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `labno` int(5) NOT NULL,
  `patient_id` int(5) NOT NULL,
  `doctorid` int(5) NOT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`labno`, `patient_id`, `doctorid`, `amount`) VALUES
(301, 101, 201, 100),
(302, 102, 202, 200),
(303, 103, 203, 50),
(304, 102, 202, 30),
(305, 101, 204, 50);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(3) NOT NULL,
  `weight` int(3) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `name`, `age`, `weight`, `gender`) VALUES
(101, 'naga praneeth', 22, 170, 'male'),
(102, 'bushan', 28, 170, 'male'),
(103, 'srikar', 23, 160, 'male'),
(104, 'naga', 23, 169, 'male'),
(105, 'siva', 28, 175, 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttable`
--
ALTER TABLE `appointmenttable`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billno`),
  ADD KEY `patientid` (`patientid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`labno`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctorid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointmenttable`
--
ALTER TABLE `appointmenttable`
  ADD CONSTRAINT `appointmenttable_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`),
  ADD CONSTRAINT `appointmenttable_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `patientid` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `doctor_id` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
