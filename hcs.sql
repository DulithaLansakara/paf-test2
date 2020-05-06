-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2020 at 04:04 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hcs`
--

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

DROP TABLE IF EXISTS `usertbl`;
CREATE TABLE IF NOT EXISTS `usertbl` (
  `UserID_tbl` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(20) NOT NULL,
  `User_Name` varchar(30) NOT NULL,
  `User_DOB` varchar(20) NOT NULL,
  `User_Email` varchar(30) NOT NULL,
  `User_Gender` varchar(20) NOT NULL,
  `User_Phone_No` varchar(30) NOT NULL,
  `User_Address` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID_tbl`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`UserID_tbl`, `User_ID`, `User_Name`, `User_DOB`, `User_Email`, `User_Gender`, `User_Phone_No`, `User_Address`) VALUES
(1, '01', 'AvishkaUpdate', '1995%2F11%2F28', 'dB%40gmail.com', 'male', '7758823', 'mawathgama'),
(4, '02', 'Dulithaupdate', '1995%2F02%2F23', 'dsb%40gmail.com', 'male', '07565454', 'Mawathagma'),
(9, '07', 'tharidu', '1199/23/23', 'r@gmail.com', 'male', '0876542', 'kurunegala');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
