-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2018 at 05:39 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pragati`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ads`
--

CREATE TABLE IF NOT EXISTS `tbl_ads` (
  `wardno` int(2) NOT NULL,
  `ads_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE IF NOT EXISTS `tbl_login` (
  `userid` int(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `usertype` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`userid`, `username`, `password`, `usertype`) VALUES
(0, 'admin', 'admin', 'admin'),
(1, 'h', 'h', 'unitadmin'),
(2, 'p', 'p', 'unitadmin'),
(3, 's', 's', 'unitadmin'),
(4, 'a', 'a', 'unitadmin'),
(5, 'r', 'r', 'unitadmin'),
(6, 'g', 'g', 'unitadmin'),
(7, 'c', 'c', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE IF NOT EXISTS `tbl_member` (
  `userid` int(4) NOT NULL AUTO_INCREMENT,
  `wardno` int(2) NOT NULL,
  `unitid` int(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `aadhar` varchar(12) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_member`
--

INSERT INTO `tbl_member` (`userid`, `wardno`, `unitid`, `name`, `address`, `phone`, `dob`, `aadhar`, `status`) VALUES
(1, 4, 1, 'Hari Sankar', 'Thyparambil', '9874563210', '06/06/1995', '123456', 'Verified'),
(2, 2, 2, 'Parvathy', 'Parvathy nilayam', '74859631451', '15/05/1994', '142536', 'Verified'),
(3, 1, 3, 'Santhi', 'Santhi bhavanam', '5566998556', '26/10/1995', '96582562', 'Verified'),
(4, 4, 4, 'Abhilash', 'Manikyamangalam', '55656856589', '02/05/1995', '52146358', 'Verified'),
(5, 2, 5, 'Rahul', 'Rahul Raj Bahvanam', '546876168', '04/04/1995', '856546867', 'Verified'),
(6, 1, 6, 'Gautham', 'Nirnajana', '5545486465', '14/11/1994', '56465744564', 'Verified'),
(7, 1, 7, 'check', 'check', '454', '5', '454', 'Not Verified');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE IF NOT EXISTS `tbl_unit` (
  `unitid` int(4) NOT NULL AUTO_INCREMENT,
  `wardno` int(2) NOT NULL,
  `unitname` varchar(30) NOT NULL,
  `admin_id` int(4) NOT NULL,
  `applicantid` int(4) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`unitid`, `wardno`, `unitname`, `admin_id`, `applicantid`, `status`) VALUES
(1, 4, 'Kairali', 1, 1, 'Verified'),
(2, 2, 'Pragati', 2, 2, 'Verified'),
(3, 1, 'Thriveni', 3, 3, 'Verified'),
(4, 4, 'Varsham', 4, 4, 'Verified'),
(5, 2, 'Rahulam', 5, 5, 'Verified'),
(6, 1, 'Niranjanam', 6, 6, 'Verified'),
(7, 1, 'check', 0, 7, 'Not Verified');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
