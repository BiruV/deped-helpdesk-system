-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2026 at 02:35 AM
-- Server version: 8.4.2
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int NOT NULL,
  `categoryName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `categoryType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`, `categoryType`) VALUES
(5, 'Computer Malfunction', 'Hardware Problems'),
(6, 'Hardware Problem', 'Hardware Problems'),
(7, 'Printer / Scanner Problem', 'Hardware Problems'),
(8, 'Software bugs or glitches', 'Software Problems'),
(9, 'Incompatibility issues', 'Software Problems'),
(10, 'Software Updates/Installations', 'Software Problems'),
(11, 'Network Installation', 'Network Problems'),
(12, 'Network outages or downtime', 'Network Problems'),
(13, 'Difficulty accessing network', 'Network Problems'),
(14, 'Graphic Design Solution', 'Others'),
(21, 'Creation', 'Account Services'),
(22, 'Retention', 'Account Services'),
(23, 'Reset', 'Account Services'),
(24, 'Transfer', 'Account Services'),
(25, 'Deletion', 'Account Services');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int NOT NULL,
  `departmentCode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `departmentName` text NOT NULL,
  `section_unit` text NOT NULL,
  `departmentHead` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentCode`, `departmentName`, `section_unit`, `departmentHead`) VALUES
(1, 'AD-AMS', 'Administrative Division', 'Asset Management Section', '4217547'),
(2, 'AD-GSU', 'Administrative Division', 'General Services Unit', '4821305'),
(3, 'AD-PSU', 'Administrative Division', 'Payroll Services Unit', '4217547'),
(4, 'AD-RECORDS', 'Administrative Division', 'Records Section', '4821344'),
(5, 'AD-PERSONNEL', 'Administrative Division', 'Personnel Section', '4821307'),
(6, 'AD-CASH', 'Administrative Division', 'Cash Section', '4821330'),
(7, 'AD', 'Administrative Division', '', '4821278'),
(8, 'CLMD-LRMS', 'Curriculum and Learning Management Division', 'Learning Resource Management Section', '4821265'),
(9, 'CLMD', 'Curriculum and Learning Management Division', '', '4821265'),
(10, 'ESSD-HN', 'Education Support Services Division', 'Health and Nutrition', '4821259'),
(11, 'ESSD-PP', 'Education Support Services Division', 'Programs and Projects', '4821259'),
(12, 'ESSD-FAC', 'Education Support Services Division', 'Facilities', '4821259'),
(13, 'ESSD', 'Education Support Services Division', '', '4821259'),
(14, 'FTAD', 'Field Technical Assistance Division', '', '4821278'),
(15, 'FD-BUDGET', 'Finance Division', 'Budget Section', '4821345'),
(16, 'FD-ACCOUNTING', 'Finance Division', 'Accounting Section', '4821335'),
(17, 'FD', 'Finance Division', '', '4821346'),
(18, 'HRDD', 'Human Resource Development Division', '', '4821290'),
(19, 'HRDD-NEAP', 'Human Resource Development Division', 'NEAP', '4821290'),
(20, 'ARD', 'Office of the Assistant Regional Director', '', '5007850'),
(21, 'ORD-PROCUREMENT', 'Office of the Regional Director', 'Procurement Unit', '5812149'),
(22, 'ORD-ICT', 'Office of the Regional Director', 'Information and Communications Technology Unit', '4821247'),
(23, 'ORD-PAU', 'Office of the Regional Director', 'Public Affairs Unit', '6313713'),
(24, 'ORD-LEGAL', 'Office of the Regional Director', 'Legal Unit', '4819118'),
(25, 'ORD', 'Office of the Regional Director', '', '4510336'),
(26, 'PPRD', 'Policy Planning and Research Division', '', '4821294'),
(27, 'QAD', 'Quality Assurance Division', '', '4821284');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notifId` int NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `userId` int NOT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticketId` int NOT NULL,
  `subject` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `priority` enum('Low','Medium','High') COLLATE utf8mb4_general_ci DEFAULT 'Medium',
  `status` enum('Pending','Approved By IT','Processing','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `userId` int NOT NULL,
  `departmentId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assignedTo` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticketId`, `subject`, `description`, `priority`, `status`, `remarks`, `userId`, `departmentId`, `createdAt`, `updatedAt`, `assignedTo`, `categoryId`) VALUES
(2, 'Computer fix', 'how to fix', 'Medium', 'Pending', NULL, 1, 1, '2026-02-17 14:36:33', '2026-02-18 09:53:19', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('User','Officer','Technician') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departmentId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `role`, `password`, `firstName`, `lastName`, `departmentId`, `createdAt`) VALUES
(1, 'employee@deped.gov.ph', 'User', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Gabriel', 'Reyes', 1, '2026-02-12 07:34:33'),
(2, 'boss@deped.gov.ph', 'Officer', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Carl', 'Dolino', 2, '2026-02-12 07:34:33'),
(3, 'tech@deped.gov.ph', 'Technician', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bill', 'Variacion', 4, '2026-02-12 07:34:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notifId`),
  ADD KEY `fk_notification_users` (`userId`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticketId`),
  ADD KEY `fk_ticket_users` (`userId`),
  ADD KEY `assignedTo` (`assignedTo`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `fk_ticket_department` (`departmentId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_department` (`departmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notifId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticketId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  ADD CONSTRAINT `fk_ticket_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`assignedTo`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
