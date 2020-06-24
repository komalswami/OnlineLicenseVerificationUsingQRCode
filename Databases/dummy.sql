-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 05:28 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dummy`
--

-- --------------------------------------------------------

--
-- Table structure for table `dummy_licences`
--

CREATE TABLE `dummy_licences` (
  `DLNO` varchar(16) NOT NULL,
  `License_Path` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dummy_licences`
--

INSERT INTO `dummy_licences` (`DLNO`, `License_Path`) VALUES
('MH-0220070000701', 'FinalProject\\images\\licenses\\MH-0220070000701.jpg'),
('MH-0319990033044', 'FinalProject\\images\\licenses\\MH-0319990033044.jpg'),
('MH-1020160013891', 'FinalProject\\images\\licenses\\MH-1020160013891.jpg'),
('MH-1119730000017', 'FinalProject\\images\\licenses\\MH-1119730000017.jpg'),
('MH-1220050000188', 'FinalProject\\images\\licenses\\MH-1220050000188.jpg'),
('MH-1220050648607', 'FinalProject\\images\\licenses\\MH-1220050648607.jpg'),
('MH-1220130034760', 'FinalProject\\images\\licenses\\MH-1220130034760.jpg'),
('MH-1420090030945', 'FinalProject\\images\\licenses\\MH-1420090030945.jpg'),
('MH-3720080001577', 'FinalProject\\images\\licenses\\MH-3720080001577.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dummy_licences`
--
ALTER TABLE `dummy_licences`
  ADD PRIMARY KEY (`DLNO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
