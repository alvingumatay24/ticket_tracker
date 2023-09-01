-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2023 at 12:05 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elp_ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `process_ticket`
--

CREATE TABLE `process_ticket` (
  `issue_id` int(11) NOT NULL,
  `raised_by` text NOT NULL,
  `date_raised` text NOT NULL,
  `school` text NOT NULL,
  `issue_concerns` text NOT NULL,
  `type_of_concern` text NOT NULL,
  `image` text NOT NULL,
  `nature_of_concern` text NOT NULL,
  `root_cause` text NOT NULL,
  `resolution` text NOT NULL,
  `report` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process_ticket`
--

INSERT INTO `process_ticket` (`issue_id`, `raised_by`, `date_raised`, `school`, `issue_concerns`, `type_of_concern`, `image`, `nature_of_concern`, `root_cause`, `resolution`, `report`) VALUES
(27, 'hdhdh', 'bxbx', 'jesus dela peña national high school', 'hxhx', 'assistance', 'image_picker8965371295054130527.jpg', 'xbhx', 'bxhx', 'dhhd', 'dhdg'),
(28, '', '', '', '', '', 'image_picker5122163674037583597.jpg', '', '', '', ''),
(29, 'bxbx', 'bsbs', 'jesus dela peña national high school', 'gdgdg', 'assistance', 'image_picker2630034587822069898.jpg', 'hxhx', 'dhhd', 'xhdh', 'xhx');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `process_ticket`
--
ALTER TABLE `process_ticket`
  ADD PRIMARY KEY (`issue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `process_ticket`
--
ALTER TABLE `process_ticket`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
