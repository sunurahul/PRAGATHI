-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 01:20 AM
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
-- Table structure for table `tbl_attendance`
--

CREATE TABLE IF NOT EXISTS `tbl_attendance` (
  `attid` int(5) NOT NULL AUTO_INCREMENT,
  `mid` int(4) NOT NULL,
  `userid` int(4) NOT NULL,
  `attendance` varchar(8) NOT NULL,
  `pay_amt` int(4) NOT NULL,
  PRIMARY KEY (`attid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `fid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loanpayment`
--

CREATE TABLE IF NOT EXISTS `tbl_loanpayment` (
  `lid` int(5) NOT NULL AUTO_INCREMENT,
  `loanid` int(4) NOT NULL,
  `amount` int(5) NOT NULL,
  `dateofpay` varchar(10) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loans`
--

CREATE TABLE IF NOT EXISTS `tbl_loans` (
  `loanid` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) NOT NULL,
  `loanamt` int(6) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `verifyby` varchar(4) NOT NULL,
  `reqdate` varchar(10) NOT NULL,
  `approvedate` varchar(10) NOT NULL,
  `duepayment` int(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`loanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
(0, 'admin', 'admin', 'admin');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mempayment`
--

CREATE TABLE IF NOT EXISTS `tbl_mempayment` (
  `mpid` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) NOT NULL,
  `totpay` int(5) NOT NULL,
  PRIMARY KEY (`mpid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE IF NOT EXISTS `tbl_message` (
  `msgid` int(4) NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `datee` varchar(10) NOT NULL,
  `fromid` int(4) NOT NULL,
  `usertype` varchar(15) NOT NULL,
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messagedetails`
--

CREATE TABLE IF NOT EXISTS `tbl_messagedetails` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `toid` int(4) NOT NULL,
  `msgid` int(4) NOT NULL,
  `totype` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE IF NOT EXISTS `tbl_product` (
  `pid` int(4) NOT NULL AUTO_INCREMENT,
  `unitid` int(4) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `descri` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL,
  `photo` longblob NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unitchange`
--

CREATE TABLE IF NOT EXISTS `tbl_unitchange` (
  `ucid` int(4) NOT NULL AUTO_INCREMENT,
  `userid` int(4) NOT NULL,
  `fromm` int(4) NOT NULL,
  `too` int(4) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`ucid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unitmeetings`
--

CREATE TABLE IF NOT EXISTS `tbl_unitmeetings` (
  `mid` int(4) NOT NULL AUTO_INCREMENT,
  `unitid` int(4) NOT NULL,
  `date` varchar(10) NOT NULL,
  `place` varchar(30) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
