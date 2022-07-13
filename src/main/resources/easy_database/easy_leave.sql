-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 09:02 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easy_leave`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departments`
--

CREATE TABLE `tbl_departments` (
  `DepartmentNo` int(5) NOT NULL,
  `DeptName` varchar(25) NOT NULL,
  `DeptSize` int(5) NOT NULL,
  `DeptManager` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_departments`
--

INSERT INTO `tbl_departments` (`DepartmentNo`, `DeptName`, `DeptSize`, `DeptManager`) VALUES
(1, 'Research and Development', 3, 1),
(2, 'Marketing', 4, 2),
(3, 'Account and Finance', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employees`
--

CREATE TABLE `tbl_employees` (
  `staff_id` int(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Female',
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `DeptNo` int(5) NOT NULL,
  `leave_totaldays` int(5) NOT NULL DEFAULT 28,
  `leave_daystaken` int(5) NOT NULL DEFAULT 0,
  `leave_daysremaining` int(5) NOT NULL DEFAULT 28,
  `bonus` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_employees`
--

INSERT INTO `tbl_employees` (`staff_id`, `first_name`, `last_name`, `gender`, `email`, `password`, `DeptNo`, `leave_totaldays`, `leave_daystaken`, `leave_daysremaining`, `bonus`) VALUES
(1231, 'Tim', 'Lidede', 'Male', 'timlidede@gmail.com', '0001', 1, 28, 11, 17, 8),
(1232, 'Joy', 'Nkatha', 'Female', 'joy@gmail.com', '0002', 2, 28, 0, 28, 1),
(1233, 'Adrian', 'Graaf', 'Female', 'adrian@gmail.com', '0003', 3, 28, 0, 28, 1),
(1234, 'Jacob', 'Manayara', 'Male', 'jacob@gmail.com', '0004', 1, 28, 0, 28, 1),
(1235, 'Joy', 'Mithamo', 'Female', 'mitham@gmail.com', '0005', 2, 28, 0, 28, 1),
(1236, 'Jeremy', 'Munroe', 'Male', 'jeremy@gmail.com', '0006', 3, 28, 6, 22, 5),
(1237, 'Sandra', 'Ataro', 'Female', 'sandra@gmail.com', '0007', 1, 28, 0, 28, 1),
(1238, 'Danroy', 'Ndung\'u', 'Male', 'danroy@gmail.com', '0008', 2, 28, 0, 28, 1),
(1239, 'Leslie', 'Akinyi', 'Female', 'leslie@gmail.com', '0009', 3, 28, 0, 28, 1),
(1240, 'Nicole', 'Wambui', 'Female', 'nicole@gmail.com', '0010', 1, 28, 0, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiries`
--

CREATE TABLE `tbl_enquiries` (
  `enquiry_id` int(5) NOT NULL,
  `enquiry_message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `enquiry_reply` text DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL,
  `enquiry_madeby` int(5) NOT NULL,
  `enquiry_replyby` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_enquiries`
--

INSERT INTO `tbl_enquiries` (`enquiry_id`, `enquiry_message`, `created_at`, `enquiry_reply`, `replied_at`, `enquiry_madeby`, `enquiry_replyby`) VALUES
(1, 'Could you increase the response time for applications?', '2021-12-08 14:47:33', NULL, NULL, 1236, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leavedetails`
--

CREATE TABLE `tbl_leavedetails` (
  `leave_id` int(5) NOT NULL,
  `leave_staff` int(5) NOT NULL,
  `leave_startdate` date NOT NULL DEFAULT current_timestamp(),
  `leave_enddate` date DEFAULT NULL,
  `leave_daysrequested` varchar(15) NOT NULL,
  `leave_comments` text NOT NULL,
  `leave_type` enum('Normal','Maternity Leave','Paternity Leave','Compassionate Leave','Sick Leave','Study Leave','Unpaid Leave','Other') NOT NULL DEFAULT 'Normal',
  `leave_status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_leavedetails`
--

INSERT INTO `tbl_leavedetails` (`leave_id`, `leave_staff`, `leave_startdate`, `leave_enddate`, `leave_daysrequested`, `leave_comments`, `leave_type`, `leave_status`) VALUES
(3, 1236, '2021-12-08', '2021-12-28', '14', 'I need to tend to my sick wife.', 'Paternity Leave', 'Accepted'),
(14, 1236, '2021-12-08', '2021-12-29', '15', '', 'Compassionate Leave', 'Pending'),
(15, 1236, '2021-12-08', '2021-12-16', '6', 'Kindly grant me this leave.', 'Normal', 'Accepted'),
(16, 1236, '2021-12-08', '2021-12-28', '14', 'Please Maam.', 'Sick Leave', 'Rejected'),
(17, 1231, '2021-12-08', '2021-12-23', '11', '', 'Normal', 'Accepted'),
(18, 1231, '2021-12-08', '2021-12-28', '14', 'Could you please?', 'Paternity Leave', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_managers`
--

CREATE TABLE `tbl_managers` (
  `manager_id` int(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Female',
  `email` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `DeptNo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_managers`
--

INSERT INTO `tbl_managers` (`manager_id`, `first_name`, `last_name`, `gender`, `email`, `password`, `DeptNo`) VALUES
(1, 'Timothy', 'Lidede', 'Male', 'lidede@gmail.com', '1234', 1),
(2, 'Ryan', 'Lagat', 'Male', 'ryan@gmail.com', '1234', 2),
(3, 'Kendi', 'Ibeere', 'Female', 'kendi@gmail.com', '1234', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD PRIMARY KEY (`DepartmentNo`),
  ADD KEY `DeptManager` (`DeptManager`);

--
-- Indexes for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `DeptNo` (`DeptNo`);

--
-- Indexes for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  ADD PRIMARY KEY (`enquiry_id`),
  ADD KEY `enquiry_madeby` (`enquiry_madeby`),
  ADD KEY `enquiry_replyby` (`enquiry_replyby`);

--
-- Indexes for table `tbl_leavedetails`
--
ALTER TABLE `tbl_leavedetails`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `leave_staff` (`leave_staff`);

--
-- Indexes for table `tbl_managers`
--
ALTER TABLE `tbl_managers`
  ADD PRIMARY KEY (`manager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  MODIFY `DepartmentNo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  MODIFY `staff_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1241;

--
-- AUTO_INCREMENT for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  MODIFY `enquiry_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_leavedetails`
--
ALTER TABLE `tbl_leavedetails`
  MODIFY `leave_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_managers`
--
ALTER TABLE `tbl_managers`
  MODIFY `manager_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_departments`
--
ALTER TABLE `tbl_departments`
  ADD CONSTRAINT `tbl_departments_ibfk_1` FOREIGN KEY (`DeptManager`) REFERENCES `tbl_managers` (`manager_id`);

--
-- Constraints for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD CONSTRAINT `tbl_employees_ibfk_1` FOREIGN KEY (`DeptNo`) REFERENCES `tbl_departments` (`DepartmentNo`);

--
-- Constraints for table `tbl_enquiries`
--
ALTER TABLE `tbl_enquiries`
  ADD CONSTRAINT `tbl_enquiries_ibfk_1` FOREIGN KEY (`enquiry_madeby`) REFERENCES `tbl_employees` (`staff_id`),
  ADD CONSTRAINT `tbl_enquiries_ibfk_2` FOREIGN KEY (`enquiry_replyby`) REFERENCES `tbl_managers` (`manager_id`);

--
-- Constraints for table `tbl_leavedetails`
--
ALTER TABLE `tbl_leavedetails`
  ADD CONSTRAINT `tbl_leavedetails_ibfk_2` FOREIGN KEY (`leave_staff`) REFERENCES `tbl_employees` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
