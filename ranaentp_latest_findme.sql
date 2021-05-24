-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2021 at 04:36 PM
-- Server version: 10.3.29-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ranaentp_latest_findme`
--

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(2) NOT NULL,
  `pagename` varchar(25) NOT NULL,
  `icon` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_menu`
--

INSERT INTO `main_menu` (`id`, `pagename`, `icon`) VALUES
(1, 'Dashboard', 'entypo-gauge'),
(2, 'Configurations', 'glyphicon glyphicon-cog');

-- --------------------------------------------------------

--
-- Table structure for table `msgs`
--

CREATE TABLE `msgs` (
  `msg_id` int(11) NOT NULL,
  `recv_id` int(11) NOT NULL,
  `send_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msgs`
--

INSERT INTO `msgs` (`msg_id`, `recv_id`, `send_id`, `content`, `date`) VALUES
(704, 95, 50, '0000', '2021-04-08 12:54:22'),
(705, 41, 95, 'Hello', '2021-04-08 12:55:07'),
(706, 95, 41, 'Tty', '2021-04-08 12:56:28'),
(707, 41, 95, 'Jdndmd', '2021-04-08 12:56:36'),
(708, 50, 95, 'Vvv', '2021-04-12 15:02:17'),
(709, 95, 50, 'Hdd', '2021-04-12 15:02:25'),
(710, 95, 50, 'Hessfjncs', '2021-04-12 15:02:30'),
(711, 50, 95, 'Ytewdgb\n', '2021-04-12 15:02:36'),
(712, 95, 50, 'Kueedbkywwg\n', '2021-04-12 15:02:43'),
(713, 50, 95, 'Ewyipljgfxsa\n', '2021-04-12 15:02:51'),
(714, 50, 95, 'Utrfg', '2021-04-12 15:02:55'),
(715, 95, 50, 'Ffcn', '2021-04-12 15:08:45'),
(716, 50, 95, 'Dhkyrdg', '2021-04-12 15:08:53'),
(717, 95, 50, 'Ufbbj', '2021-04-12 15:08:57'),
(718, 95, 50, 'U', '2021-04-12 15:09:04'),
(719, 50, 95, 'Y', '2021-04-12 15:09:08'),
(720, 50, 95, '', '2021-04-12 15:09:09'),
(721, 95, 50, 'T', '2021-04-12 15:09:12'),
(722, 95, 50, 'Rrrr', '2021-04-12 15:11:35'),
(723, 50, 95, 'Nnnn', '2021-04-12 15:11:40'),
(724, 50, 95, 'Vfsd', '2021-04-12 15:14:12'),
(725, 95, 50, 'Ddqruijgsg', '2021-04-12 15:14:16'),
(726, 50, 95, 'Uuu', '2021-04-12 15:15:08'),
(727, 95, 50, 'Gggg', '2021-04-12 15:15:11'),
(728, 95, 50, 'Jhrsvj', '2021-04-12 15:22:33'),
(729, 95, 50, 'Duifkfeo', '2021-04-12 15:22:44'),
(730, 50, 95, ',sdghcz', '2021-04-12 15:22:50'),
(731, 95, 50, 'Iurrescbmmoywsxvnmkkysx', '2021-04-12 15:22:59'),
(732, 50, 95, 'Uuy', '2021-04-12 15:23:02'),
(733, 50, 95, 'Ii', '2021-04-12 15:23:04'),
(734, 50, 95, 'Ijj', '2021-04-12 15:23:05'),
(735, 95, 50, 'Tti', '2021-04-12 15:23:07'),
(736, 95, 50, 'Bbb', '2021-04-12 15:23:08'),
(737, 95, 50, 'Hhh', '2021-04-12 15:23:10'),
(738, 95, 50, 'Bbj', '2021-04-12 15:23:11'),
(739, 95, 50, 'Vvbvaslurw::&#2', '2021-04-12 15:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `RecentSearches`
--

CREATE TABLE `RecentSearches` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` datetime NOT NULL,
  `u_id` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Service,1=Task'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RecentSearches`
--

INSERT INTO `RecentSearches` (`id`, `name`, `date`, `u_id`, `status`) VALUES
(2, 'Carpenter', '2020-05-31 19:57:10', 49, '1'),
(3, 'Carpenter', '2020-05-31 23:09:21', 45, '0'),
(9, 'dsfasfasdf', '2021-03-31 18:28:00', 41, ''),
(10, 'dassadfsdf', '2021-03-31 18:33:01', 41, ''),
(11, 'dassadfsdf', '2021-03-31 18:33:41', 41, ''),
(12, 'dassadfsdf', '2021-03-31 18:33:51', 41, ''),
(13, 'dsfasfasdf', '2021-04-01 11:48:12', 41, ''),
(14, 'dsfasfasdf', '2021-04-01 16:18:45', 41, ''),
(15, 'dsfasfasdf', '2021-04-01 16:22:17', 41, ''),
(16, 'dassadfsdf', '2021-04-01 16:24:54', 41, ''),
(17, 'dassadfsdf', '2021-04-01 16:25:22', 41, ''),
(18, 'dsfasfasdf', '2021-04-01 16:30:20', 41, ''),
(19, 'dassadfsdf', '2021-04-01 16:42:39', 41, ''),
(20, 'dsfasfasdf', '2021-04-01 16:47:24', 41, ''),
(21, 'dassadfsdf', '2021-04-01 16:48:16', 41, '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `register_for` varchar(20) NOT NULL,
  `business_name` text NOT NULL,
  `phone_no` text DEFAULT NULL,
  `type_of_work` int(11) NOT NULL,
  `business_details` text NOT NULL,
  `business_lat` text NOT NULL,
  `business_long` text NOT NULL,
  `image` text NOT NULL,
  `u_id` int(11) NOT NULL,
  `experience` text DEFAULT NULL,
  `status` text NOT NULL DEFAULT 'Online'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `register_for`, `business_name`, `phone_no`, `type_of_work`, `business_details`, `business_lat`, `business_long`, `image`, `u_id`, `experience`, `status`) VALUES
(7, 'Friend', 'Waqas hassan', '+923335925685', 3, 'Nothing', '33.55802204286965', '73.02187794819474', 'uploads/image19', 49, 'My name is khan', 'Online'),
(9, 'Yourself', 'Zaheer hasan ', '+926469494', 2, 'Xbbdb', '24.927423216562524', '67.19029085710645', 'uploads/image21', 44, 'Bbdbsbbs', 'Offline'),
(10, 'Friend', 'Nxnxnx', '+923335925685', 3, 'Xndnd', '33.55588410184254', '73.02364116534591', 'uploads/image27', 49, 'Cnfnfn', 'Online'),
(11, 'Friend', 'Boss', '+92123456789', 1, 'Awesome bro', '24.93245410688096', '67.17737233266234', 'uploads/image28', 44, 'Awesom work done in paat to do it again n agai ', 'Online'),
(12, 'Friend', 'Ahmrd', '+923335262532', 2, 'Bxbxbxnxnx', '33.550304543522515', '73.12298180535436', 'uploads/image29', 49, 'Hdjdhdhsjdjd', 'Online'),
(84, 'Friend', 'Yyy', '+92333322114654', 4, 'Kurwsgjj', '37.4219788', '-122.0839617', 'uploads/undefined', 50, 'Dgdsbkndd', 'Online'),
(85, 'Friend', 'Yyy', '+92333322114654', 4, 'Kurwsgjj', '37.4219788', '-122.0839617', 'uploads/undefined', 50, 'Dgdsbkndd', 'Online'),
(86, 'Friend', 'Yyy', '+92333322114654', 4, 'Kurwsgjj', '37.4219788', '-122.0839617', 'uploads/undefined', 50, 'Dgdsbkndd', 'Online'),
(87, 'Friend', 'Yyy', '+92333322114654', 4, 'Kurwsgjj', '37.4219788', '-122.0839617', 'uploads/undefined', 50, 'Dgdsbkndd', 'Online'),
(88, 'Friend', 'Yyy', '+92333322114654', 4, 'Kurwsgjj', '37.4219788', '-122.0839617', 'uploads/undefined', 50, 'Dgdsbkndd', 'Online'),
(89, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(90, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(91, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(92, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(93, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(94, 'Friend', 'dsdf', '+92344343', 4, '3434', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '34343', 'Online'),
(95, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(96, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(97, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(98, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(99, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(100, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online'),
(101, 'Yourself', 'Ffs', '+92332189', 6, 'Hebky', '37.4219788', '-122.0839617', 'uploads/undefined', 50, '', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE `submenu` (
  `id` int(3) NOT NULL,
  `parentid` int(3) NOT NULL,
  `subpagename` varchar(30) NOT NULL,
  `pageurl` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`id`, `parentid`, `subpagename`, `pageurl`) VALUES
(2, 2, 'User Management', 'Employee'),
(8, 2, 'Customers', 'Customers'),
(23, 2, 'TimeSlot', 'TimeSlot'),
(24, 2, 'Vendors', 'Vendors'),
(25, 2, 'Brand/Item', 'Item'),
(26, 2, 'Orders', 'Orders'),
(27, 2, 'Price Configuration', 'PriceConfig'),
(28, 2, 'TimeSlot Price Configuration', 'TimeSlotPrice');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `tag_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `service_id`, `tag_name`) VALUES
(1, 40, 'Sjdjdbdi'),
(2, 42, 'Fjjwe'),
(3, 43, 'Fjjwe'),
(4, 44, 'Fjjwe'),
(5, 45, 'Ffff'),
(6, 46, 'Ffff'),
(7, 47, 'Ffff'),
(8, 48, 'Ffff'),
(9, 49, 'Ffff'),
(10, 50, 'Ffff'),
(11, 51, 'Ffff'),
(12, 52, 'Ffff'),
(13, 53, 'Ffff'),
(14, 54, 'Ffff'),
(15, 55, 'Ffff'),
(16, 56, 'Ffff'),
(17, 57, 'Ffff'),
(18, 58, 'Ffff'),
(19, 59, 'Ffff'),
(20, 60, 'Fff'),
(21, 61, 'Fg'),
(22, 62, 'Ttt'),
(23, 63, 'Trdf'),
(24, 64, 'Trdf'),
(25, 65, 'Trdf'),
(26, 66, 'Yyyy'),
(27, 68, 'Gsj'),
(28, 69, 'Dbjurg'),
(29, 70, 'Dbjurg'),
(30, 71, 'Dbjurg'),
(31, 72, 'Dbjurg'),
(32, 73, 'Dbjurg'),
(33, 74, 'Dbjurg'),
(34, 75, 'Dbjurg'),
(35, 76, 'Dbjurg'),
(36, 77, 'Dbjurg'),
(37, 78, 'Yesfgk'),
(38, 79, 'Yesfgk'),
(39, 80, 'Yesfgk'),
(40, 81, 'Yesfgk'),
(41, 82, 'Yesfgk'),
(42, 83, 'Yesfgk'),
(43, 84, 'Yesfgk'),
(44, 85, 'Yesfgk'),
(45, 86, 'Yesfgk'),
(46, 87, 'Yesfgk'),
(47, 88, 'Yesfgk'),
(48, 89, '34'),
(49, 90, '34'),
(50, 91, '34'),
(51, 92, '34'),
(52, 93, '34'),
(53, 94, '34'),
(54, 95, 'Jtedb'),
(55, 96, 'Jtedb'),
(56, 97, 'Jtedb'),
(57, 98, 'Jtedb'),
(58, 99, 'Jtedb'),
(59, 100, 'Jtedb'),
(60, 101, 'Jtedb');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_service`
--

CREATE TABLE `type_of_service` (
  `service_id` int(11) NOT NULL,
  `service_name` text NOT NULL,
  `type` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Profession,1=Business'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_of_service`
--

INSERT INTO `type_of_service` (`service_id`, `service_name`, `type`) VALUES
(1, 'Plumber', '0'),
(2, 'Carpenter', '0'),
(3, 'Other', '0'),
(4, 'Car center', '0'),
(5, 'Easypaisa Shop', '1'),
(6, 'Software House', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `phone_no` text NOT NULL,
  `l_name` text NOT NULL,
  `dp` text NOT NULL DEFAULT 'uploads/client.jpeg',
  `joining_date` date NOT NULL,
  `password` text NOT NULL,
  `session` text NOT NULL,
  `user_status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '0=User,1=Admin,2=Employee,3=Vendor',
  `dashboard` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Hide,1=Show',
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `f_name`, `phone_no`, `l_name`, `dp`, `joining_date`, `password`, `session`, `user_status`, `dashboard`, `country`) VALUES
(5, '', '034255820', 'admin@gmail.com', 'uploads/client1.jpeg', '2020-02-21', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1707bad43d82f3f61add0add968f92d3', '1', '1', ''),
(41, 'Sardar', '+923215582381', 'Usama', 'uploads/client.jpeg', '2020-04-23', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '03301e0aef835dc18d7cd2c261db9144', '0', '0', ''),
(44, 'Zaheer', '+923459191116', 'Hasan', 'uploads/client.jpeg', '2020-04-26', '4a363b9b6b2d184850e0cf553ee2516d0bd351df', 'b11fec37288d3ab42f615010b6ac1bb7', '0', '0', ''),
(45, 'Sardar', '+923006620328', 'Usama', 'uploads/client.jpeg', '2020-04-30', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '9905c1e9968516b2d9cb8189cc6907b0', '0', '0', ''),
(48, 'waqas', '+92335925685', 'hasan', 'uploads/client.jpeg', '2020-05-14', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'da2576e77465946c03683e391cbf7ea7', '0', '0', ''),
(49, 'Waqas', '+923335925685', 'Hasan', 'uploads/client.jpeg', '2020-05-18', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'f9c001f8a64ba2380b544e1ed5a2c79c', '0', '0', ''),
(50, 'Bilal', '+923325444417', 'Hasan', 'uploads/client.jpeg', '2020-05-23', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2d79db10d5a1b405a202d5545366dea6', '0', '0', ''),
(94, 'Atther', '+923051370433', 'Rashid', 'uploads/client.jpeg', '2021-04-02', 'd30f79cf7fef47bd7a5611719f936539bec0d2e9', '', '', '0', ''),
(95, 'Zaid', '+923077227710', 'Qureshi', 'uploads/client.jpeg', '2021-04-02', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', '', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_new`
--

CREATE TABLE `users_new` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `do` text NOT NULL,
  `b` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_new`
--

INSERT INTO `users_new` (`id`, `name`, `do`, `b`) VALUES
(1, 'dsafhkj', 'sdafhjksdfh', 'hdfjkh');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rights`
--

INSERT INTO `user_rights` (`id`, `u_id`, `page_id`) VALUES
(71, 3, 1),
(72, 3, 2),
(73, 3, 3),
(85, 10, 2),
(91, 11, 23),
(92, 11, 25),
(96, 6, 2),
(97, 6, 8),
(98, 6, 23),
(99, 6, 24),
(100, 6, 25),
(104, 21, 2),
(105, 21, 8),
(106, 21, 25);

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `work_id` int(11) NOT NULL,
  `looking_for` text NOT NULL,
  `title` text NOT NULL,
  `job_details` text NOT NULL,
  `tags` text DEFAULT NULL,
  `phone_no` text NOT NULL,
  `lat` text NOT NULL,
  `longi` text NOT NULL,
  `image` text NOT NULL,
  `u_id` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`work_id`, `looking_for`, `title`, `job_details`, `tags`, `phone_no`, `lat`, `longi`, `image`, `u_id`, `date`) VALUES
(4, '4', 'Behjdjs jsjsjjs jsjsjs', 'Jejjsjsj', NULL, '+9265664646', '24.844510039140083', '67.0274443924427', 'uploads/image23', '44', '2020-05-18 22:18:46'),
(5, '1', 'Plus ', 'Ghbg gjff jggv ', NULL, '+923215582381', '31.3799947', '73.0812362', 'uploads/image24', '41', '2020-05-29 20:48:07'),
(6, '2', 'G', 'Gg', NULL, '+92555', '31.37998995407198', '73.08122048154473', 'uploads/image25', '41', '2020-05-29 20:52:34'),
(7, '1', 'H', 'Fhghbbj bjgg ', NULL, '+92123', '31.378797772759064', '73.0830386839807', 'uploads/image26', '41', '2020-05-29 21:03:52'),
(8, '3', 'Bbb', 'Hhh', NULL, '+923335925685', '33.55593522037776', '73.02370151504874', '', '49', '2020-05-31 22:58:22'),
(9, '1', 'a plummbberr', 'I need a plber i need a plumber', NULL, '+923335451993', '33.555984964262095', '73.02332835271955', '', '50', '2020-06-02 01:17:57'),
(10, '3', 'Developer', 'A php developer', NULL, '+923215582381', '31.38012477122262', '73.08107832446694', '', '41', '2020-07-21 23:20:15'),
(11, '2', 'Test', 'Test', NULL, '+923215582381', '31.380125057458407', '73.08107832446694', '', '41', '2020-07-21 23:22:24'),
(12, '2', 'Hzbxnzbsb', 'Hxbdbdb', NULL, '+927483938366', '33.54925475835316', '73.12359133735299', 'uploads/image', '51', '2021-03-29 07:38:11'),
(13, '1', 'Hdvdbdb', 'Xhzbsnsbh', NULL, '+92&(@$!$)$/$!$/$)?$', '33.58492605280532', '73.10347275808454', 'uploads/', '51', '2021-03-30 00:08:01'),
(15, '4', ' Cx', '?? ', NULL, '+92192.168.1.3 ', '33.5492801', '73.123896', 'uploads/', '51', '2021-03-30 01:48:46'),
(16, '1', 'Dhdbdhdbdj', 'Uehdbdxn', NULL, '+92&($) $(', '33.54906530947044', '73.12373718246818', 'uploads/', '53', '2021-03-30 05:23:33'),
(17, '3', 'offline', '', 'online', '0307229797', '32.221212', '4343', '', '41', '2021-03-31 15:38:56'),
(18, '4', 'Hello', 'Hi there', '[\"Hdhddj,\"]', '+923077729797', '33.5492568', '73.1237428', '', '51', '2021-04-01 11:19:24'),
(19, '4', 'Hdbdbdb', 'Hdbdb', '[\"Hddbdb.\"]', '+92($($! $! ', '33.5492568', '73.1237428', '', '51', '2021-04-01 11:39:08'),
(20, '4', 'Hdbdbdb', 'Hdbdb', '[\"Hddbdb.\"]', '+92($($! $! ', '33.5492568', '73.1237428', '', '51', '2021-04-01 11:39:48'),
(21, '4', 'Hdbdbdh', 'Sbsnsbsbs', '[\"Bdbdkd\"]', '+923077729797', '33.54917121088823', '73.1236701272428', '', '51', '2021-04-01 12:56:23'),
(22, '4', 'Hdbdbdh', 'Sbsnsbsbs', '[\"Bdbdkd\"]', '+923077729797', '33.54917121088823', '73.1236701272428', '', '51', '2021-04-01 12:57:00'),
(23, '4', 'Hdbdbdh', 'Sbsnsbsbs', '[\"Bdbdkd\"]', '+923077729797', '33.54917121088823', '73.1236701272428', '', '51', '2021-04-01 12:57:25'),
(24, '4', 'Dhxbxbb', 'Bxbxnxn', '[\"Xbbxjf\"]', '+92307262937', '33.54917121088823', '73.1236701272428', '', '51', '2021-04-01 12:58:23'),
(25, '4', 'Dhxbxbb', 'Bxbxnxn', '[\"Xbbxjf\"]', '+92307262937', '33.54917121088823', '73.1236701272428', '', '51', '2021-04-01 13:00:02'),
(27, '4', 'Jdndn', 'Ndndjdjd', '[\"Jdjd.\"]', '+92(&! &! \'', '33.5490032', '73.1235881', '', '51', '2021-04-01 15:10:06'),
(28, '4', 'Jdndn', 'Ndndjdjd', '[\"Jdjd.\"]', '+92(&! &! \'', '33.553421131630806', '73.12089839950204', '', '51', '2021-04-01 15:10:11'),
(34, '1', 'Hello', 'Ho theebbd', '[\"Jdjdidhd\"]', '+92(\'! &) $/$($/$) ', '33.5492599', '73.1237373', '', '51', '2021-04-02 12:52:17'),
(35, '3', 'Tttt', 'Ggfudg', '[]', '+92.85426848655688', '37.4219788', '-122.0839617', 'uploads/undefined', '50', '2021-04-13 12:58:06'),
(36, '3', 'Tttt', 'Ggfudg', '[]', '+92.85426848655688', '37.4219788', '-122.0839617', 'uploads/undefined', '50', '2021-04-13 13:02:57'),
(37, '3', 'Tttt', 'Ggfudg', '[]', '+92.85426848655688', '37.4219788', '-122.0839617', 'uploads/undefined', '50', '2021-04-13 13:05:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `main_menu`
--
ALTER TABLE `main_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `msgs`
--
ALTER TABLE `msgs`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `RecentSearches`
--
ALTER TABLE `RecentSearches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `type_of_service`
--
ALTER TABLE `type_of_service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_new`
--
ALTER TABLE `users_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `msgs`
--
ALTER TABLE `msgs`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=740;

--
-- AUTO_INCREMENT for table `RecentSearches`
--
ALTER TABLE `RecentSearches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `type_of_service`
--
ALTER TABLE `type_of_service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users_new`
--
ALTER TABLE `users_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
