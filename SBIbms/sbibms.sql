-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2025 at 03:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbibms`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackid` int(11) NOT NULL,
  `message` varchar(111) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackid`, `message`, `userid`, `date`) VALUES
(13, 'I cannot send money', 60, '2025-01-29 12:37:03'),
(14, 'I cannot transfer money', 66, '2025-01-29 13:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'cashier',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(4, 'cashier1@gmail.com', 'cashier1', 'cashier', '2025-01-29 11:55:07'),
(5, 'cashier2@gmail.com', 'cashier2', 'cashier', '2025-01-29 11:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'manager',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `email`, `password`, `type`, `date`) VALUES
(1, 'manager@gmail.com', 'Manager@2025', 'manager', '2025-01-29 10:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `notice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `userid`, `notice`, `time`) VALUES
(19, 65, 'Transaction limit reached.', '2025-01-29 13:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `otheraccounts`
--

CREATE TABLE `otheraccounts` (
  `id` int(11) NOT NULL,
  `accountno` varchar(11) NOT NULL,
  `bankname` varchar(11) NOT NULL,
  `holdername` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `credit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `debit` varchar(50) NOT NULL,
  `balance` varchar(50) NOT NULL,
  `beneld` varchar(50) NOT NULL,
  `other` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `balance`, `beneld`, `other`, `userid`, `date`) VALUES
(52, 'deposit', '5000', '', '', '', '1', 60, '2025-01-29 12:40:24'),
(53, 'deposit', '5000', '', '', '', '2', 60, '2025-01-29 12:41:07'),
(54, 'withdraw', '', '3000', '', '', '1', 60, '2025-01-29 12:41:21'),
(55, 'transfer', '', '3000', '', '', '1738155050', 66, '2025-01-29 13:01:18'),
(56, 'deposit', '10000', '', '', '', '1', 66, '2025-01-29 13:16:43'),
(57, 'withdraw', '', '3500', '', '', '1', 66, '2025-01-29 13:17:15'),
(58, 'deposit', '2000000', '', '', '', '1', 65, '2025-01-29 13:17:38'),
(59, 'withdraw', '', '300000', '', '', '1', 65, '2025-01-29 13:17:53'),
(60, 'withdraw', '', '200000', '', '', '2', 65, '2025-01-29 13:18:11'),
(61, 'withdraw', '', '1000000', '', '', '3', 65, '2025-01-29 13:18:39'),
(62, 'transfer', '', '60000', '', '', '1738155050', 65, '2025-01-29 13:21:42'),
(63, 'transfer', '', '50000', '', '', '1738155370', 65, '2025-01-29 13:37:30'),
(64, 'deposit', '50000', '', '', '', '3', 66, '2025-01-29 14:17:40'),
(65, 'transfer', '', '5000', '', '', '1738155050', 66, '2025-01-29 14:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `aadhaar` varchar(12) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `profile` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `accountno` int(30) NOT NULL,
  `accounttype` varchar(10) NOT NULL,
  `deposit` int(10) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `name`, `aadhaar`, `gender`, `email`, `phonenumber`, `city`, `address`, `password`, `profile`, `dob`, `accountno`, `accounttype`, `deposit`, `branch`, `occupation`, `time`) VALUES
(65, 'firstuser', '387866568976', 'Female', 'user1@gmail.com', '9987674533', 'Mumbai', 'India', 'user', 'photo_whitebg.jpg', '2005-03-03', 1738155050, 'Current', 473000, '', 'Business', '2025-01-29 14:20:26'),
(66, 'Subhadip Roy', '987645548233', 'Male', 'subhadip2025@gmail.com', '9878622123', 'Coochbehar', 'West Bengal', 'subhadipSB', '1000122512 (1).jpg', '2002-01-14', 1738155370, 'Saving', 108500, '', 'Student', '2025-01-29 14:20:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `aadhaar` (`aadhaar`),
  ADD UNIQUE KEY `accountno` (`accountno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
