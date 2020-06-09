-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 06, 2020 at 04:25 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
CREATE TABLE IF NOT EXISTS `favourite` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `fk_favorite_resid` (`res_id`),
  KEY `fk_favorite_uid` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`f_id`, `res_id`, `u_id`) VALUES
(1, 50, 3),
(2, 75, 1),
(3, 51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`f_id`),
  KEY `fk_feedback` (`res_id`),
  KEY `fk_feedback_oid` (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `res_id`, `o_id`, `rate`, `date`) VALUES
(1, 50, 60, '4', '2020-04-12 12:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_desc` varchar(30) NOT NULL,
  `image_name` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkm_id` (`m_id`),
  KEY `fk_item_resid` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `m_id`, `res_id`, `item_name`, `item_desc`, `image_name`, `price`, `quantity`, `status`, `date`, `availability`) VALUES
(59, 128, 50, 'Oil Masala Dosa', 'a', '(2020-02-26)(12-22-12)d2.jpg', 95, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(60, 129, 51, 'Rose Falooda', 'asd', '(2020-02-26)(12-32-06)i1.jpg', 90, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(61, 130, 51, 'Mava Malai Ice cream', 'asf', '(2020-02-26)(12-34-46)i2.jpg', 50, 12, 'Accpted', '2020-03-13 12:01:14', 1),
(62, 130, 51, 'Special Akshar Ice cream', 'as', '(2020-02-27)(04-16-25)i3.jpg', 80, 40, 'Accpted', '2020-03-13 12:01:14', 1),
(63, 130, 51, 'Kesar Badam Ice cream', 'aAD', '(2020-02-27)(04-17-35)i4.jpg', 40, 50, 'Accpted', '2020-03-13 12:01:14', 1),
(64, 130, 51, 'Paan Masala Ice cream', 'DSG', '(2020-02-27)(04-18-35)I5.jpg', 50, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(65, 130, 51, 'Rajbhog Ice cream', 'SG', '(2020-02-27)(04-19-28)i6.jpg', 10, 25, 'Accpted', '2020-03-13 12:01:14', 1),
(66, 130, 51, 'American Dry Fruits Ice cream', 'asd', '(2020-02-27)(04-20-38)i7.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(67, 129, 51, 'Rose Falooda', 'as', '(2020-02-27)(04-24-41)i8.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(68, 129, 51, 'Kesar Pista Falooda', 'sdf', '(2020-02-27)(04-25-04)i9.jpg', 120, 30, 'Accpted', '2020-03-13 12:01:14', 1),
(69, 129, 51, 'Chocolate Falooda', 'asd', '(2020-02-27)(04-25-26)i10.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(72, 132, 52, 'Chocolate Sandwich', 'Sweet Tooth', '(2020-02-27)(09-39-27)1.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(73, 132, 52, 'Pineapple Sandwich', 'Sweet Tooth', '(2020-02-27)(09-47-16)6.jpg', 195, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(74, 134, 52, 'French Fries', 'Quick Bites', '(2020-02-27)(09-49-18)2.jpg', 90, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(75, 134, 52, 'Shakti Special Bhel', 'Quick Bites', '(2020-02-27)(09-50-26)3.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(76, 134, 52, 'Boss (Best Of Shakti Sandwich)', 'Quick Bites', '(2020-02-27)(09-51-23)4.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(77, 134, 52, 'Garlic Bread', 'Quick Bites', '(2020-02-27)(09-51-53)5.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(78, 134, 52, 'Classic Burger', 'Quick Bites', '(2020-02-27)(09-52-39)16.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(79, 135, 52, 'Pizza Sandwich', 'Love For Sandwich', '(2020-02-27)(09-53-58)6.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(80, 135, 52, 'Mexican Sandwich (Non Grilled)', 'Love For Sandwich', '(2020-02-27)(09-54-41)8.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(81, 135, 52, 'Tuscany Grilled Sandwich', 'Love For Sandwich', '(2020-02-27)(09-55-07)9.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(82, 135, 52, 'Italy Touch Grilled Sandwich', 'Love For Sandwich', '(2020-02-27)(09-55-41)10.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(83, 135, 52, 'Cheese Chilli Grilled Sandwich', 'Love For Sandwich', '(2020-02-27)(09-56-12)11.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(84, 135, 52, 'Ahmedabadi Touch Grilled', 'Love For Sandwich', '(2020-02-27)(09-56-43)12.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(85, 135, 52, 'Mexican Grilled Sandwich', 'Love For Sandwich', '(2020-02-27)(09-57-09)13.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(86, 135, 52, 'Russian Grilled Sandwich', 'Love For Sandwich', '(2020-02-27)(09-58-04)14.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(87, 137, 54, 'Grill Butter Vada Pav', 'Snacks', '(2020-02-27)(11-30-37)1.jpg', 30, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(88, 137, 54, 'Punjabi Samosa (2 Pcs)', 'Snacks', '(2020-02-27)(11-31-15)2.jpg', 40, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(89, 137, 54, 'Basket Chaat (Gangaur Special)', 'Snacks', '(2020-02-27)(11-32-02)3.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(90, 137, 54, 'Veg Cheese Frankie', 'Snacks', '(2020-02-27)(11-32-31)4.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(91, 137, 54, 'Panipuri (18 Pcs)', 'Snacks', '(2020-02-27)(11-33-16)5.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(93, 138, 54, 'Sabudana Khichadi', 'Falahari', '(2020-02-27)(11-34-34)6.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(94, 138, 54, 'Sabudana Vada (4 Pcs)', 'Falahari', '(2020-02-27)(11-38-31)7.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(95, 138, 54, 'Falhari Bhel', 'Falahari', '(2020-02-27)(11-39-00)8.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(96, 138, 54, 'Falahari Panipuri (18 Pcs)', 'Falahari ', '(2020-02-27)(11-40-32)f5.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(97, 138, 54, 'Falahari dhosa', 'Falahari ', '(2020-02-27)(11-42-55)22.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(98, 139, 54, 'Pizza Shots (4Pcs)', 'Pizza And Burger', '(2020-02-27)(11-44-20)9.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(99, 139, 54, 'Veg Cheese Burger', 'Pizza And Burger', '(2020-02-27)(11-44-51)10.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(100, 139, 54, '7\" Stuffed Cheese Pizza', 'Pizza And Burger', '(2020-02-27)(11-46-17)11.jpg', 150, 160, 'Accpted', '2020-03-13 12:01:14', 1),
(101, 142, 54, 'Matka Grilled Sandwich', 'Sandwiches', '(2020-02-28)(09-04-29)14.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(102, 142, 54, 'Kashmiri Toast Sandwich', 'Sandwich', '(2020-02-28)(09-05-13)15.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(103, 143, 54, 'Butter Pav Bhaji with 2 breads', 'Gangour Specials', '(2020-02-28)(09-07-22)17.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(104, 143, 54, 'Masala Butter Milk', 'Gangour Specials', '(2020-02-28)(09-07-58)18.jpg', 40, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(105, 143, 54, 'French Fries With Chaat Masala', 'Gangour Specials', '(2020-02-28)(09-08-22)19.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(106, 143, 54, 'Paneer Tikka', 'Gangour Specials', '(2020-02-28)(09-08-50)20.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(107, 143, 54, 'Kaju Badam Kulfi', 'Kulfi Gangour Ki', '(2020-02-28)(09-09-11)21.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(108, 143, 54, 'Paneer Chole Bhatoora (2)', 'Gangour Specials', '(2020-02-28)(09-10-19)16.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(109, 142, 54, 'Veg Cheese Grilled(3)', 'Sandwiches', '(2020-02-28)(09-12-12)13.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(110, 142, 54, 'Pizza Sandwich', 'Sandwich', '(2020-02-28)(09-13-06)6.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(111, 142, 54, 'Mexican Sandwich (Non Grilled)', 'Sandwich ', '(2020-02-28)(09-13-35)7.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(112, 142, 54, 'Russian Sandwich (Non Grilled)', 'Sandwich ', '(2020-02-28)(09-13-58)8.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(113, 142, 54, 'Tuscany Grilled Sandwich', 'Sandwich', '(2020-02-28)(09-14-18)9.jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(114, 142, 54, 'Italy Touch Grilled Sandwich', 'Sandwich', '(2020-02-28)(09-14-40)11.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(115, 142, 54, 'Mexican Grilled Sandwich', 'Sandwich', '(2020-02-28)(09-15-00)13.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(116, 144, 55, 'Strawberry Thick Shake', 'Thick Shake', '(2020-02-28)(11-05-16)Thickshake strawberry.jpg', 90, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(117, 144, 55, 'Oreo Monster Thick Shake', 'Thick Shake', '(2020-02-28)(11-07-39)thick shake oreo.jpg', 70, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(118, 144, 55, 'Kit Kat ( 300 ml ) Thick Shake', ' Thick Shake', '(2020-02-28)(11-09-30)thick shake kit kat.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(119, 144, 55, 'Rajwadi Dry Fruit Thick Shake', ' Thick Shake', '(2020-02-28)(11-11-25)thick shake dry friut.jpg', 90, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(120, 144, 55, 'Chocolate Chips Thick shake ', 'Thick shake ', '(2020-02-28)(11-13-25)thickshake Chocolate Chips.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(121, 145, 55, ' Cold Coco', 'Coco', '(2020-02-28)(11-15-13)coco cold.jpg', 70, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(122, 145, 55, 'Rajwadi Coco', 'Coco', '(2020-02-28)(11-16-00)coco rajwadi.jpg', 90, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(123, 145, 55, 'Coco with Kaju', 'Coco ', '(2020-02-28)(11-16-39)coco with akje.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(124, 145, 55, 'Coco with Cadbury', 'Coco ', '(2020-02-28)(11-17-37)coco with Cadbury.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(125, 145, 55, 'Cold Cofee', 'Coco', '(2020-02-28)(11-18-27)cofee cold.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(126, 145, 55, 'Oreo Coco', 'Coco', '(2020-02-28)(11-19-52)coco kitkat.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(127, 145, 55, 'Coco With Icecream', 'Coco ', '(2020-02-28)(11-21-04)Ice Cream Coco Shake.jpg', 120, NULL, 'Accpted', '2020-03-13 12:01:14', 1),
(128, 146, 55, ' Rose Lassi', '51 Rainbow Ice Cream special', '(2020-02-28)(11-22-49)lassi rosse.jpg', 110, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(129, 146, 55, ' Mango Kaju Lassi', '51 Rainbow Ice Cream Special', '(2020-02-28)(11-23-53)lassi mango kaju.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(130, 146, 55, 'Kaju Lassi', '51 Rainbow Ice Cream Special', '(2020-02-28)(11-24-47)kaju lassi.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(131, 146, 55, 'Kiwi juice ', '51 Rainbow Ice Cream special', '(2020-02-28)(11-25-51)juise Kiwi.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(132, 146, 55, 'Rajwadi Dry Fruits Shake', '51 Rainbow Ice Cream special', '(2020-02-28)(11-26-49)Rajwadi Dry Fruits Shake.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(133, 147, 58, 'Black Forest Pastry', 'Pastry', '(2020-02-28)(11-35-57)pastry black forest.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(134, 147, 58, 'Choco Chips Pastry', 'Pastry', '(2020-02-28)(11-36-35)pastry Choco Chips.jpg', 40, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(135, 147, 58, 'Dutch Brownie Pastry', 'Pastry', '(2020-02-28)(11-37-14)pastry Dutch Brownie.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(136, 147, 58, 'Chocolate Pastry', 'Pastry', '(2020-02-28)(11-37-52)pastry choko.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(137, 147, 58, 'Rainbow Pastry', 'Pastry', '(2020-02-28)(11-38-21)pastry Rainbow.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(138, 147, 58, 'Royal Chocolate Pastry', 'Pastry', '(2020-02-28)(11-38-52)pastry Royal Chocolate.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(139, 147, 58, 'New York Cheesecake ', 'Pastries', '(2020-02-28)(11-40-05)New York Cheesecake (Pack Of 2).jpg', 40, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(140, 147, 58, 'Rich Red & New York Cheesecake', 'Pastry', '(2020-02-28)(11-40-52)Rich Red Velvet Pastry & New York Cheesecake (Pack of 2).jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(141, 147, 58, 'New York Cheesecake', 'Pastry', '(2020-02-28)(11-41-27)these nift....jpg', 55, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(142, 148, 58, 'WhiteForest Cake (500 gms)', 'Cake ', '(2020-02-28)(11-42-42)cake White Forest.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(143, 148, 58, 'Swiss Desire Cake', 'Cake ', '(2020-02-28)(11-43-24)cake Swiss Desire.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(144, 148, 58, 'Marble Chocolate Cake', 'cake', '(2020-02-28)(11-43-54)cake Marble Chocolate.jpg', 250, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(145, 148, 58, 'Rainbow Cake', 'Cake', '(2020-02-28)(11-44-18)cake Rainbow.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(146, 148, 58, 'German Fantasy Cake', 'Cake', '(2020-02-28)(11-44-50)cake German Fantasy.jpg', 260, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(147, 148, 58, 'Dutch Almond Cake', 'Cake', '(2020-02-28)(11-45-18)cake Dutch Almond.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(148, 148, 58, 'Choco Chip Bite Cake', 'Cake', '(2020-02-28)(11-45-47)cake Choco Chip Bite.jpg', 280, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(149, 148, 58, 'Pineapple Cake', 'Cake', '(2020-02-28)(11-46-53)cake pinapple.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(150, 148, 58, 'Black Forest Cake', 'Cake', '(2020-02-28)(11-47-29)cake Black Forest.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(151, 149, 62, 'Vanilla Cake 500 Gms', 'Cake ', '(2020-02-28)(11-58-22)Vanilla Cake 500 Gms.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(152, 149, 62, 'Butter Scotch Cake 500 Gms', 'Cake ', '(2020-02-28)(11-59-14)Butter Scotch Cake 500 Gms.jpg', 260, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(153, 149, 62, 'Kiwi Cake 500 Gms', 'Cake ', '(2020-02-28)(11-59-37)Kiwi Cake 500 Gms.jpg', 290, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(154, 149, 62, 'Blue Berry Cake 500 Gms', 'Cake ', '(2020-02-28)(12-00-00)Blue Berry Cake 500 Gms.jpg', 290, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(155, 149, 62, 'Mango Cake 500 Gms', 'Cake ', '(2020-02-28)(12-00-30)Mango Cake 500 Gms.jpg', 300, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(156, 149, 62, 'Orange Cake 500 Gms', 'Cake ', '(2020-02-28)(12-00-47)Orange Cake 500 Gms.jpg', 310, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(157, 149, 62, 'Strawberry Cake 500 Gms', 'Cake ', '(2020-02-28)(12-01-18)Strawberry Cake 500 Gms.jpg', 320, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(158, 149, 62, 'Pineapple Cake 500 Gms', 'Cake ', '(2020-02-28)(12-01-44)Pineapple Cake 500 Gms.jpg', 320, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(159, 149, 62, 'Chocolate Cake 500 Gms', 'Cake ', '(2020-02-28)(12-02-04)Chocolate Cake 500 Gms.jpg', 320, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(160, 149, 62, 'Chocolate Vanilla Cake 500 Gms', 'Cake', '(2020-02-28)(12-02-23)Chocolate Vanilla Cake 500 Gms.jpg', 320, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(161, 149, 62, 'Chocolate Chips Cake 500 Gms', 'Cake ', '(2020-02-28)(12-03-21)Chocolate Chips Cake 500 Gms.jpg', 330, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(162, 149, 62, 'Pan Masala Cake 500 Gms', 'Cake ', '(2020-02-28)(12-03-43)Pan Masala Cake 500 Gms.jpg', 330, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(163, 149, 62, 'Choco Forest Cake 500 Gms', 'Cake ', '(2020-02-28)(12-03-58)Choco Forest Cake 500 Gms.jpg', 350, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(164, 149, 62, 'White Forest cake', 'cake', '(2020-02-28)(12-04-30)cake White Forest.jpg', 260, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(165, 149, 62, 'Swiss Desire Cake', 'Cake', '(2020-02-28)(12-04-57)cake Swiss Desire.jpg', 290, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(166, 149, 62, 'Marble Chocolate Cake', 'Cake', '(2020-02-28)(12-05-18)cake Marble Chocolate.jpg', 310, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(167, 149, 62, 'Rainbow Cake', 'Cake', '(2020-02-28)(12-05-44)cake Rainbow.jpg', 350, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(168, 149, 62, 'German Fantasy Cake', 'Cake', '(2020-02-28)(12-06-14)cake German Fantasy.jpg', 350, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(169, 149, 62, 'Dutch Almond Cake', 'Cake', '(2020-02-28)(12-07-05)cake Dutch Almond.jpg', 290, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(170, 149, 62, 'Choco Chip Bite Cake', 'Cake', '(2020-02-28)(12-07-32)cake Choco Chip Bite.jpg', 280, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(171, 149, 62, 'Pineapple Cake', 'Cake', '(2020-02-28)(12-08-07)cake pinapple.jpg', 220, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(172, 150, 63, 'Garlic Sendwich', 'Sendwich', '(2020-02-28)(12-12-56)sendwich (2).jpg', 100, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(173, 150, 63, 'Sendwich Amdavadi', 'Sendwich ', '(2020-02-28)(12-13-37)sendwich amdavadi.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(174, 150, 63, 'Sendwich Chocolate', 'Sendwich ', '(2020-02-28)(12-14-11)sendwich chocolate.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(175, 150, 63, 'Chesee Grilled Sendwich', 'Sendwich', '(2020-02-28)(12-14-44)sendwich grilled chese.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(176, 150, 63, 'Sendwich Grilled', 'Sendwich ', '(2020-02-28)(12-15-20)sendwich grilled.jpg', 160, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(177, 150, 63, 'Sendwich Italy', 'Sendwich ', '(2020-02-28)(12-15-49)sendwich italy.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(178, 150, 63, 'Sendwich Matka', 'Sendwich ', '(2020-02-28)(12-16-14)sendwich Matka.jpg', 170, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(179, 150, 63, 'Sendwich Maxican Grilled', 'Sendwich ', '(2020-02-28)(12-16-47)sendwich maxican grilled.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(180, 150, 63, 'Sendwich Maxican', 'Sendwich ', '(2020-02-28)(12-17-20)sendwich maxican.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(181, 150, 63, 'Sendwich Paneer Tandoori', 'Sendwich ', '(2020-02-28)(12-17-54)sendwich paneer tandoori.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(182, 150, 63, 'Sendwich Pizza', 'Sendwich ', '(2020-02-28)(12-18-45)sendwich pizza.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(183, 150, 63, 'Sendwich Russian Grilled', 'Sendwich ', '(2020-02-28)(12-19-30)sendwich russian grilled.jpg', 150, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(184, 150, 63, 'Sendwich African', 'Sendwich', '(2020-02-28)(12-20-38)sendwich.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(185, 151, 63, 'Simple Samosa', 'Samosa', '(2020-02-28)(12-22-28)samosa 4.jpg', 30, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(186, 151, 63, 'Samosa Aloo', 'Samosa', '(2020-02-28)(12-23-35)Samosa allo.jpg', 30, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(187, 151, 63, 'Chinese Samosa ', 'Samosa ', '(2020-02-28)(12-24-18)Samosa Chinese.jpg', 50, 12, 'Accpted', '2020-03-13 12:01:14', 1),
(188, 151, 63, 'Dry Fruit Samosa', 'Samosa', '(2020-02-28)(12-24-57)Samosa Dry Fruit.jpg', 40, 5, 'Accpted', '2020-03-13 12:01:14', 1),
(189, 151, 63, 'Pizza Samosa', 'Samosa', '(2020-02-28)(12-25-40)samosa pizza.jpg', 30, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(190, 152, 64, 'Kaju Curry', 'Main Course', '(2020-02-28)(01-55-53)main course kaju karry.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(191, 152, 64, 'Kaju Masala', 'Main Course', '(2020-02-28)(01-56-17)main course Kaju Masala.jpg', 180, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(192, 152, 64, 'Paneer Toofani', 'Main Course', '(2020-02-28)(01-57-06)main course.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(193, 152, 64, 'Veg Hyderabadi Biryani', 'Main Course', '(2020-02-28)(01-57-35)main course Veg Hyderabadi Biryani.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(194, 152, 64, 'Jeera Rice', 'main course', '(2020-02-28)(01-58-15)main course Jeera Rice.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(195, 152, 64, 'Dal Khichdi', 'Main Course', '(2020-02-28)(01-58-43)main course Dal Khichdi.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(196, 152, 64, 'Masala Khichdi', 'Main Course', '(2020-02-28)(01-59-05)main course Masala Khichdi.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(197, 152, 64, 'Kulcha', 'Main Course', '(2020-02-28)(01-59-42)main course Kulcha.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(198, 152, 64, 'Masala Papad', 'Main Course', '(2020-02-28)(02-00-37)main course v.jpg', 20, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(199, 152, 64, 'Fry Papad', 'Main Course', '(2020-02-28)(02-01-01)main course Fry Papad.jpg', 20, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(200, 152, 64, 'Roasted Papad', 'Main Course', '(2020-02-28)(02-01-26)main course Roasted Papad.jpg', 20, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(201, 153, 64, 'Butter Milk', 'Beverages', '(2020-02-28)(02-03-49)Beverages butter milk.jpg', 30, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(202, 153, 64, 'Cold Coffee Milk Shake', 'Beverages', '(2020-02-28)(02-04-22)Beverages cold cofee.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(203, 154, 64, 'Idli Sambhar', 'South Indian', '(2020-02-28)(02-05-15)South Indian idada.jpg', 60, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(204, 154, 64, 'Idli Sambhar', 'South Indian ', '(2020-02-28)(02-05-41)South Indian jd special dhosa.jpg', 100, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(205, 154, 64, 'Masala Dosa', 'South Indian', '(2020-02-28)(02-06-13)South Indian masala dhosa.jpg', 100, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(206, 154, 64, 'Jinni Roll', 'South Indian', '(2020-02-28)(02-06-45)South Indian jinni roll+.jpg', 130, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(207, 154, 64, 'Onion Uttapam', 'South Indian', '(2020-02-28)(02-07-08)South Indian onion uttapam.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(208, 154, 64, 'Tomato Uttapam', 'South Indian', '(2020-02-28)(02-07-32)South Indian tommoto uttapam.jpg', 100, 1, 'Accpted', '2020-03-13 12:01:14', 1),
(209, 155, 64, 'Pav Bhaji', 'Quick Bites', '(2020-02-28)(02-09-15)Quick Bites pav bhaji.jpg', 100, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(210, 155, 64, 'Chilli Paneer Dry', 'Quick Bites', '(2020-02-28)(02-10-15)Quick Bites amnchurian.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(211, 155, 64, 'Schezwan Fried Rice', 'Quick Bites', '(2020-02-28)(02-11-04)Quick Bites chainese bhe;.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(212, 155, 64, 'Veg Hakka Noodles', 'Quick Bites', '(2020-02-28)(02-11-54)Quick Bites noodles.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(213, 156, 69, 'Masala Puff', 'Puffs', '(2020-03-05)(10-14-04)puff masala.jpg', 40, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(214, 156, 69, 'Sev Puff', 'Puffs', '(2020-03-05)(10-14-28)puff save.jpg', 35, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(215, 156, 69, 'Aloosev Puff', 'Puffs', '(2020-03-05)(10-17-15)puff alosev.jpg', 40, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(216, 156, 69, 'Chutney Onion Puff', 'Puffs', '(2020-03-05)(10-17-41)puff onion.jpg', 40, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(217, 156, 69, 'Schezwan Puff', 'Puffs', '(2020-03-05)(10-18-18)puff Schezwan.jpg', 40, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(218, 156, 69, 'Chinese Puff', 'Puffs', '(2020-03-05)(10-18-39)puff Chinese.jpg', 45, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(219, 156, 69, 'Green Chutney Puff', 'Puffs', '(2020-03-05)(10-19-02)puff grenn chutney.jpg', 45, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(220, 156, 69, 'Special Veg Puff', 'Puffs', '(2020-03-05)(10-19-28)pff special..jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(221, 156, 69, 'Special Veg Puff', 'Puffs', '(2020-03-05)(10-19-28)pff special..jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(222, 156, 69, 'Chinese Garlic Puff', 'Puffs', '(2020-03-05)(10-20-10)puff chinese garlic.jpg', 55, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(223, 156, 69, 'Garlic Singbhajiya Puff', 'Puffs', '(2020-03-05)(10-20-31)puff garlic Singbhajiya.jpg', 55, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(224, 156, 69, 'Malai Puff', 'Puffs', '(2020-03-05)(10-20-56)puff malai.jpg', 55, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(225, 156, 69, 'Malai Garlic Puff', 'Puffs', '(2020-03-05)(10-21-16)puff Malai Garlic.jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(226, 156, 69, 'Cheese Puff', 'Puffs', '(2020-03-05)(10-21-35)puff Cheese.jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(227, 156, 69, 'Chinese Cheese Puff', 'Puffs', '(2020-03-05)(10-22-08)puff v.jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(228, 156, 69, 'Cheese Sing Puff', 'Puffs', '(2020-03-05)(10-22-34)puff Cheese Sing.jpg', 50, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(229, 156, 69, 'Cheese Mayonnaise Puff', 'Puffs', '(2020-03-05)(10-22-54)puff Cheese Mayonnaise.jpg', 60, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(230, 156, 69, 'Cream & Onion Puff', 'Puffs', '(2020-03-05)(10-23-36)puff Cream & Onion.jpg', 60, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(231, 156, 69, 'Double Cheese Puff', 'Puffs', '(2020-03-05)(10-23-58)puff Double Cheese.jpg', 70, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(232, 156, 69, 'Patels Special Puff', 'Puffs', '(2020-03-05)(10-24-21)puff Patels Special.jpg', 70, 15, 'Accpted', '2020-03-13 12:01:14', 1),
(249, 157, 73, '9 Hawaiin Delight Pizza', 'Pizzas', '(2020-03-13)(10-48-43)(2020-02-27)(09-05-48)16.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(250, 157, 73, '9\' Indiano Pizza', 'Pizzas', '(2020-03-07)(07-34-38)12.jpg', 220, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(251, 157, 73, '9\' Deluxe Veggie Pizza', 'Pizzas', '(2020-03-07)(07-35-08)21.jpg', 220, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(252, 157, 73, '9\' Schezwan Pizza', 'Pizzas', '(2020-03-07)(07-35-32)20.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(253, 158, 73, 'Peri Peri Fries', 'Quick Bites', '(2020-03-07)(07-36-31)19.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(254, 158, 73, 'Cheese Fries', 'Quick Bites', '(2020-03-07)(07-36-58)18.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(255, 158, 73, 'Cheese Garlic Bread', 'Quick Bites', '(2020-03-07)(07-37-27)17.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(256, 158, 73, 'American Garlic Bread', 'Quick Bites', '(2020-03-07)(07-37-53)16.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(257, 158, 73, 'Veggie Toast Grilled Sandwich', 'Quick Bites', '(2020-03-07)(07-38-40)15.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(258, 159, 73, 'Alfredo Penne Pasta', 'Pastas', '(2020-03-07)(07-42-52)13.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(259, 159, 73, 'Penne Pasta All Pomodoro', 'Pastas', '(2020-03-07)(08-02-18)12 (2).jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(260, 160, 74, 'Lazziz Khas Pizza + Coke', 'Beverage Combos', '(2020-03-07)(08-08-33)pizza 8 Lazziz Khas + Coke.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(261, 160, 74, 'Paneer Tikka Pizza + Coke', 'Beverage Combos', '(2020-03-07)(08-09-16)7 Veg Carnival Pizza + Coke 250 Ml Pet Bottle.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(262, 160, 74, 'Veg Carnival Pizza + Coke', 'Beverage Combos', '(2020-03-07)(08-10-06)pizza 7 Veg Carnival Pizza + Coke 250 Ml Pet Bottle.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(263, 161, 74, 'French Fries', 'Pops', '(2020-03-07)(08-10-43)French Friess.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(264, 161, 74, 'Jalapenos Pops', 'Pops', '(2020-03-07)(08-15-49)pop1.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(265, 161, 74, 'Veggie Stick', 'Pops', '(2020-03-07)(08-16-20)pop2.jpg', 120, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(266, 161, 74, 'Potato Wedges', 'Pops', '(2020-03-07)(08-16-46)pop3.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(267, 162, 74, 'Veg Burger', 'Burgers', '(2020-03-07)(08-17-09)Veg Burger.jpg', 40, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(268, 162, 74, 'Veg Cheese Burger', 'Burgers', '(2020-03-07)(08-17-44)Veg Cheese Burger.jpg', 60, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(269, 163, 74, 'Garlic Cheese Bread', 'Breads', '(2020-03-07)(08-18-32)Garlic Cheese Bread.jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(270, 163, 74, 'Four Flavour Garlic Bread', 'Breads', '(2020-03-07)(08-18-53)Four Flavour Garlic Bread.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(271, 163, 74, 'Garlic Sticks', 'Breads', '(2020-03-07)(08-19-14)Garlic Sticks.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(272, 164, 74, '7\" Creamy Cheese Pizza', 'Classic Veg', '(2020-03-07)(08-19-51)7 Creamy Cheese Pizza.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(273, 164, 74, '7\" Double Cheese Margherita', 'Classic Veg', '(2020-03-07)(08-20-24)7 Double Cheese Margherita.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(274, 164, 74, '8\" Lazziz Khas Pizza', 'Classic Veg', '(2020-03-07)(08-21-04)8 Lazziz Khas Pizza.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(275, 164, 74, '8\" Paneer Tikka Pizza', 'Classic Veg', '(2020-03-07)(08-22-12)8 Paneer Tikka Pizza.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(276, 165, 74, '7\" Veg Paprica Pizza', 'Exotic Veg', '(2020-03-07)(08-22-41)7 Veg Paprica Pizza.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(277, 165, 74, '7\" Veg Mexican Pizza', 'Exotic Veg', '(2020-03-07)(08-23-05)7Veg Mexican Pizza.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(278, 165, 74, '8\" Cheese Margheritta Pizza', 'Exotic Veg', '(2020-03-07)(08-26-56)8 Yummy Cheese Margheritta Pizza.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(279, 165, 74, '8\" Veg Mexican Pizza', 'Exotic Veg', '(2020-03-07)(08-28-02)8 Veg Mexican Pizza.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(280, 165, 74, '10\" Italian Lazizo Pizza', 'Exotic Veg', '(2020-03-07)(08-36-21)Italian Lazizo Pizza.jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(281, 165, 74, '12\" Farmhouse Pizza', 'Exotic Veg', '(2020-03-07)(08-37-27)7. Peppy Paneer Pizza.jpg', 150, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(282, 166, 74, '7\" Peppy Paneer Pizza', 'Special Veg', '(2020-03-07)(08-38-22)Peppy Paneer Pizza.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(283, 166, 74, '7\" Paneer Makhani Pizza', 'Special Veg', '(2020-03-07)(08-39-08)7 Paneer Makhani Pizza (2).jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(284, 166, 74, '8\" Veg Spicy Fusion Pizza', 'Special Veg', '(2020-03-07)(08-39-48)8 Veg Spicy Fusion Pizza.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(285, 166, 74, '7\" Veg Carnival Pizza', 'Special Veg', '(2020-03-07)(08-42-24)carnival.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(286, 166, 74, '12\" Veg Loaded Pizza', 'Special ', '(2020-03-07)(08-44-27)abx.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(287, 167, 75, 'Paneer Makhani', 'Masala Pizza', '(2020-03-07)(09-19-01)Paneer Makhani.jpg', 140, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(288, 167, 75, 'Achari Do Pyaza', 'Masala Pizza', '(2020-03-07)(09-19-57)Achari Do Pyaza.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(289, 167, 75, 'Kadhai Paneer', 'Masala pizza', '(2020-03-07)(09-20-41)Kadhai Paneer.jpg', 170, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(291, 168, 75, 'Margherita', 'Veg Pizza', '(2020-03-07)(09-22-10)Margherita.jpg', 160, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(292, 168, 75, 'Double Cheese Margherita', 'Veg Pizza', '(2020-03-07)(09-22-30)Double Cheese Margherita.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(293, 168, 75, 'Fresh Veggie', 'Veg Pizza', '(2020-03-07)(09-22-52)Fresh Veggie.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(294, 168, 75, 'Farmhouse', 'Veg Pizza', '(2020-03-07)(09-26-37)Farmhouse.jpg', 190, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(295, 168, 75, 'Peppy Paneer', 'Veg Pizza', '(2020-03-07)(09-27-06)Peppy Paneer.jpg', 190, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(296, 168, 75, 'Mexican Green Wave', 'Veg Pizza', '(2020-03-07)(09-27-35)Mexican Green Wave.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(297, 168, 75, 'Veggie Paradise', 'Veg Pizza', '(2020-03-07)(09-27-57)Veggie Paradise.jpg', 200, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(298, 168, 75, 'Deluxe Veggie', 'Veg Pizza', '(2020-03-07)(09-28-31)Deluxe Veggie.jpg', 220, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(299, 168, 75, 'Veg Extravaganza', 'Veg Pizza', '(2020-03-07)(09-29-03)Veg Extravaganza.jpg', 230, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(300, 168, 75, 'Indi Tandoori Paneer', 'Veg Pizza', '(2020-03-07)(09-29-24)Indi Tandoori Paneer.jpg', 230, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(301, 169, 75, 'Veg Loaded', 'Pizza Mania', '(2020-03-07)(09-30-10)Veg Loaded.jpg', 220, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(302, 169, 75, 'Cheesy', 'Pizza Mania', '(2020-03-07)(09-30-38)Cheesy.jpg', 240, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(303, 169, 75, 'Capsicum', 'Pizza mania', '(2020-03-07)(09-34-57)Capsicum.jpg', 230, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(304, 169, 75, 'Onion', 'Pizza Mania', '(2020-03-07)(09-35-41)Onion.jpg', 230, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(305, 169, 75, 'Golden Corn', 'Pizza Mania', '(2020-03-07)(09-36-13)Golden Corn.jpg', 240, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(306, 169, 75, 'Paneer & Onion', 'Pizza Mania', '(2020-03-07)(09-36-34)Paneer & Onion.jpg', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(307, 169, 75, 'Tomato', 'Pizza Mania', '(2020-03-07)(09-37-56)Tomato.jpg', 240, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(308, 170, 75, 'White Pasta Italiano Veg', 'Sides', '(2020-03-07)(09-39-15)White Pasta Italiano Veg.jpg', 230, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(309, 170, 75, 'Garlic Breadsticks', 'Slides', '(2020-03-07)(09-39-35)Garlic Breadsticks.png', 250, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(310, 170, 75, 'Veg Parcel', 'Slides', '(2020-03-07)(09-40-06)Veg Parcel.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(311, 170, 75, 'Stuffed Garlic Breadsticks', 'Slides', '(2020-03-07)(09-40-30)Stuffed Garlic Breadsticks.png', 90, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(312, 170, 75, 'Cheesy Jalapeno Dip', 'Sides', '(2020-03-07)(09-40-59)Cheesy Jalapeno Dip.jpg', 70, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(313, 170, 75, 'Cheesy Dip', 'Sides', '(2020-03-07)(09-41-23)Cheesy Dip.png', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(314, 170, 75, 'Taco Mexicana Veg', 'Sides', '(2020-03-07)(09-41-47)Taco Mexicana Veg.png', 70, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(315, 170, 75, 'Butterscotch Mousse Cake', 'Sides', '(2020-03-07)(09-58-43)Butterscotch Mousse Cake.jpg', 70, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(316, 170, 75, 'Burger Pizza - Classic Veg', 'Sides', '(2020-03-07)(09-59-02)Burger Pizza - Classic Veg.png', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(317, 170, 75, 'Potato Cheese Shots', 'Sides', '(2020-03-07)(09-59-28)Potato Cheese Shots.jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(318, 170, 75, 'Crunchy Strips', 'Sides', '(2020-03-07)(09-59-43)Crunchy Strips.jpg', 180, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(319, 170, 75, 'Crinkle Fries', 'Sides', '(2020-03-07)(10-00-00)Crinkle Fries.jpg', 80, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(320, 170, 75, 'Brownie Fantasy', 'Sides', '(2020-03-07)(10-00-16)Brownie Fantasy.jpg', 130, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(321, 171, 75, 'Pepsi (500ml)', 'Beverages', '(2020-03-07)(10-03-53)Pepsi.jpg', 50, 10, 'Accpted', '2020-03-13 12:01:14', 1),
(322, 171, 75, 'Mirinda (500ml)', 'Beverages', '(2020-03-07)(10-04-17)mirinda.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(323, 171, 75, 'Lipton Ice Tea (250ml)', 'Beverages', '(2020-03-07)(10-04-37)Lipton Ice Tea.jpg', 50, 20, 'Accpted', '2020-03-13 12:01:14', 1),
(337, 127, 50, 'aa', 'aa', '(2020-03-19)(03-35-53)dhosa.jpg', 20, NULL, 'Accpted', '2020-03-18 11:48:40', 1),
(338, 173, 50, 'Dhosa', 'aaa', '(2020-04-12)(12-25-07)(2020-03-17)(09-53-17)16.jpg', 20, NULL, 'Accpted', '2020-04-12 12:25:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(30) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `fk_menu_resid` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `m_name`, `res_id`) VALUES
(127, 'Paper Sada Dhosa', 50),
(128, 'Masala Dhosa', 50),
(129, 'Desserts', 51),
(130, 'Ice cream', 51),
(132, 'Sweet Tooth', 52),
(134, 'Quick Bites', 52),
(135, 'Love For Sandwich', 52),
(137, 'Snacks', 54),
(138, 'Falahari', 54),
(139, 'Pizza And Burger', 54),
(142, 'Sandwich ', 54),
(143, 'Gangour Specials', 54),
(144, 'Thick Shake', 55),
(145, 'Coco', 55),
(146, '51 Rainbow Ice Cream Special', 55),
(147, 'Pastries', 58),
(148, 'Small Gateaux', 58),
(149, 'Cake', 62),
(150, 'Sandwich', 63),
(151, 'Samosa', 63),
(152, 'Main Course', 64),
(153, 'Beverages', 64),
(154, 'South Indian', 64),
(155, 'Quick Bites', 64),
(156, 'Puffs', 69),
(157, 'Pizzas', 73),
(158, 'Quick Bites', 73),
(159, 'Pastas', 73),
(160, 'Beverage Combos', 74),
(161, 'Pops', 74),
(162, 'Burgers', 74),
(163, 'Breads', 74),
(164, 'Classic Veg', 74),
(165, 'Exotic Veg', 74),
(166, 'Special Veg', 74),
(167, 'Masala Pizza', 75),
(168, 'Veg Pizza', 75),
(169, 'Pizza Mania', 75),
(170, 'Sides', 75),
(171, 'Beverages', 75),
(172, 'McSaver Meals', 76),
(173, 'Demo', 50);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_code` varchar(30) NOT NULL,
  `offer_text` text NOT NULL,
  `valid_user` varchar(30) NOT NULL,
  `max_usage` int(11) NOT NULL,
  `discount_type` varchar(30) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `max_discount_amount` int(11) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT NULL,
  `flat_discount_amount` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT '1',
  `expire_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_code` (`offer_code`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `offer_code`, `offer_text`, `valid_user`, `max_usage`, `discount_type`, `min_amount`, `max_discount_amount`, `discount_percentage`, `flat_discount_amount`, `status`, `expire_time`) VALUES
(28, 'WELCOME50', 'Get 50% discount On Your First Order', 'newuser', 1, 'percent', 100, 100, 50, 50, '1', '2020-04-30 01:45:00'),
(30, 'SWIGGYIT', 'Flat 50 Off On Min.Order 200', 'alluser', 1, 'flat', 200, NULL, NULL, 100, '1', '2020-05-10 05:30:00'),
(43, 'AA', 'aas', 'alluser', 1, 'flat', 10, NULL, NULL, 202, '1', '2020-05-01 02:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `orderd_item_details`
--

DROP TABLE IF EXISTS `orderd_item_details`;
CREATE TABLE IF NOT EXISTS `orderd_item_details` (
  `oi_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  PRIMARY KEY (`oi_id`),
  KEY `fk_oid` (`o_id`),
  KEY `fk_order_item_iid` (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderd_item_details`
--

INSERT INTO `orderd_item_details` (`oi_id`, `o_id`, `i_id`, `quantity`, `price`) VALUES
(62, 54, 60, '3', '90'),
(63, 55, 62, '1', '80'),
(64, 56, 60, '1', '90'),
(65, 56, 61, '1', '50'),
(66, 57, 60, '1', '90'),
(67, 60, 59, '2', '95'),
(68, 60, 337, '1', '20'),
(69, 61, 337, '11', '20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) DEFAULT NULL,
  `rozarpay_id` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_oid_payment` (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`p_id`, `o_id`, `rozarpay_id`, `amount`, `status`) VALUES
(8, 54, 'pay_EaKtbZvdfr8FpH', 220, 'refund'),
(9, 55, 'pay_EaLJCGjFK2m0Wp', 80, 'success'),
(10, 56, 'pay_EbD4mZxwmdtKhU', 140, 'success'),
(11, 57, 'pay_EbwyUuGbjzbUVA', 90, 'success'),
(12, 60, 'pay_EdZYG9Upay2Izn', 200, 'success'),
(13, 61, 'pay_EdZhYk89sfKTgZ', 160, 'refunded');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `moblie` varchar(12) NOT NULL,
  `owner_name` varchar(30) DEFAULT NULL,
  `delivery_charge` int(11) NOT NULL,
  `image_name` varchar(100) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `availability` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`res_id`, `name`, `city`, `address`, `email`, `pass`, `moblie`, `owner_name`, `delivery_charge`, `image_name`, `status`, `availability`) VALUES
(50, 'Only Dhosa', 'Surat', 'Sudama Chowk, Mota Varachha', 'rajnavadiya6@gmail.com', '0000', '8141853805', 'fgh', 40, '(2020-03-19)(03-23-55)dhosa.jpg', 'Accpted', 1),
(51, 'Akshar Ice Cream', 'Surat', 'Pedar Road, Mota Varachha | Change Outlet', 'rajnavadiya1@gmail.com', '0000', '8141853805', 'arpit', 0, '(2020-03-19)(03-35-12)(2020-02-26)(12-29-02)icecreame.jpg', 'Accpted', 1),
(52, '	 Shakti - The Sandwich Shop', 'surat', 'Avadh Viceroy, Nr D-Mart, Sarthana', 'shakti@gmail.com', '0000', '1234567899', 'shakti', 0, '(2020-02-27)(08-40-14)1.jpg', 'Accpted', 1),
(53, 'Surendranagar Snacks', 'surat', 'Kapodra, Varachha', 'Surendranagar@gmail.com', '0000', '1234567898', 'suresh', 0, '(2020-02-27)(08-42-18)3.jpg', 'Accpted', 1),
(54, 'Gangour', 'surat', 'Sudama Chowk, Mota Varachha | Change Outlet', 'Gangour@gmail.com', '0000', '1234567897', 'Gangour', 0, '(2020-02-27)(08-43-13)2.jpg', 'Accpted', 1),
(55, '	 51 Rainbow Ice Cream', 'surat', 'Sudama Chowk, Mota Varachha | Change Outlet ', '51Rainbow@gmail.com', '0000', '1234567896', '	 51 Rainbow Ice Cream', 0, '(2020-02-27)(08-44-45)4.jpg', 'Accpted', 1),
(58, 'Monginis', 'surat', 'Sudama Chowk, Mota Varachha | Change Outle', 'Monginis@gmail.com', '0000', '1234567893', 'Monginis', 0, '(2020-02-27)(08-48-51)6.jpg', 'Accpted', 1),
(62, 'Varniraj Live Cake', 'surat', 'Utran Road, Mota Varachha', 'VarnirajLive@gmail.com', '0000', '12345678933', 'Varniraj Live Cake', 0, '(2020-02-27)(09-00-14)11.jpg', 'Accpted', 1),
(63, 'Vandan Food Cafe', 'surat', 'Utran Road, Mota Varachha', 'Vandan@gmail.com', '0000', '1234567894', 'Vandan Food Cafe', 0, '(2020-02-27)(09-01-02)12.jpg', 'Accpted', 1),
(64, 'Jd Restaurant', 'surat', 'Mini Bazar, Varachha', 'JdRestaurant@gmail.com', '0000', '1234567894', 'Jd Restaurant', 0, '(2020-02-27)(09-01-53)13.jpg', 'Accpted', 1),
(69, '	 Patels Puff House', 'surat', 'Vip Chowk, Utran, Mota Varachha', 'PatelsHouse@gmail.com', '0000', '1234567899', '	 Patels Puff House', 0, '(2020-02-27)(09-07-31)18.jpg', 'Accpted', 1),
(73, 'Pizzaholic -The Woodfire Pizza', 'surat', 'Utran, Mota Varachha', 'Pizzaholic@gmail.com', '0000', '5544566112', 'Pizzaholic', 0, '(2020-03-17)(09-53-17)16.jpg', 'Accpted', 1),
(74, 'Laziz Pizza - Platinum Point', 'surat', 'Sudama Chowk, Mota Varachha', 'laziz@gmail.com', '0000', '5566447788', 'Laziz Pizza', 0, '(2020-03-05)(11-48-38)laziz.jpg', 'Accpted', 1),
(75, 'Dominos Pizza', 'Surat', 'Sudama Chowk, Sarthana', 'Domino@gmai.com', '0000', '5566114433', 'Dominos', 0, '(2020-03-07)(09-16-00)Peppy Paneer Pizza.jpg', 'Accpted', 1),
(76, 'McDonalds', 'surat', 'Deepkamal Mall, Sarthana', 'mcd@gmail.com', '0000', '8529631476', 'McDonalds', 0, '(2020-03-07)(10-17-58)mcd.jpg', 'Accpted', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `img_name`) VALUES
(13, '13c.jpg'),
(12, '12b.jpg'),
(11, '1a.jpg'),
(14, '14d.jpg'),
(15, '15e.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `s_admin`
--

DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE IF NOT EXISTS `s_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_admin`
--

INSERT INTO `s_admin` (`id`, `email`, `pass`) VALUES
(1, 'admin@gmail.com', '0000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`o_id`),
  KEY `fk_order_uid` (`u_id`),
  KEY `fk_order_resid` (`r_id`),
  KEY `fk_order_aid` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`o_id`, `u_id`, `r_id`, `a_id`, `order_status`, `subtotal`, `discount`, `grand_total`, `order_date`) VALUES
(54, 1, 51, 9, 'new', 220, 0, 220, '2020-04-29 18:30:00'),
(55, 1, 51, 9, 'new', 80, 0, 80, '2020-04-09 18:30:00'),
(56, 1, 51, 9, 'new', 140, 0, 140, '2020-04-08 18:30:00'),
(57, 1, 51, 9, 'new', 90, 0, 90, '2020-04-06 18:30:00'),
(58, 1, 51, 5, 'new', 100, 0, 100, '2020-04-07 18:30:00'),
(59, 11, 51, 4, 'new', 50, 0, 50, '2020-04-01 18:30:00'),
(60, 1, 50, 9, 'deliverd', 200, 50, 200, '2020-04-12 12:21:22'),
(61, 1, 50, 9, 'rejected', 160, 100, 160, '2020-04-12 12:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `moblie` varchar(12) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `name`, `email`, `moblie`, `pass`) VALUES
(1, 'Ravi Navadiya', 'rajnavadiya6@gmail.com', '8141853805', '0000'),
(2, 'Ravi Navadiya ', 'rajnavadiya1@gmail.com', '9265733964', '0000'),
(3, 'Arpit Golakiya', 'arpitgolakiya97@gmail.com', '9925609468', '0000'),
(4, 'Ankit Maniya', 'ankit@gmail.com', '1234567895', '0000'),
(5, 'Axita Godhani', 'axita@gmail.com', '7874270477', '0000'),
(6, 'dhruvi', 'dhruvi@gmail.com', '8855223366', '0000'),
(8, 'divakar', 'divakar@gmail.com', '9595959595', '0000'),
(9, 'chintu', 'chintu@gmail.com', '4564564563', '0000'),
(10, 'trushar', 'trushar@gmail.com', '9865321520', '0000'),
(11, 'aniket', 'aniket@gmail.com', '8754653215', '0000');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `add_name` varchar(30) NOT NULL,
  `add_line` varchar(500) NOT NULL,
  `landmark` varchar(300) NOT NULL,
  `city` varchar(300) NOT NULL,
  `state` varchar(300) NOT NULL,
  `pincode` varchar(300) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `fk_useradd_uid` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`a_id`, `u_id`, `add_name`, `add_line`, `landmark`, `city`, `state`, `pincode`) VALUES
(2, 3, 'j 104 rivera recedency', 'mota varachha', 'mota varchha', 'surat', 'gujarat', '394101'),
(3, 5, 'j 104 rivera recedency', 'sudamachowk', 'mota varachha', 'surat', 'gujarat', '394101'),
(4, 5, 'anmol 104', 'nana varchha', 'nana varchha', 'surat', 'gujarat', '395006'),
(5, 4, 'Surat (M Corp.) (Part)', 'Surat (M Corp.) (Part)', 'Gujarat', 'Surat (M Corp.) (Part)', 'Gujarat', '394101'),
(6, 8, 'Yogiraj Road', 'Yogiraj Road, Hsisoh', 'yogichowk', 'surat', 'gujarat', '394101'),
(7, 6, 'ashish 1004', 'sarthana', 'jakatnaka', 'surat', 'gujarat', '395006'),
(9, 1, 'B-403,Gokuldham Residency', 'Bhaktinanadan chowk', 'Sudama chowk,mota varachha', 'Surat', 'Gujarat', '394101');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `fk_favorite_resid` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_favorite_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedback_oid` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_item_mid` FOREIGN KEY (`m_id`) REFERENCES `menu` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_resid` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_resid` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderd_item_details`
--
ALTER TABLE `orderd_item_details`
  ADD CONSTRAINT `fk_oid` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_item_iid` FOREIGN KEY (`i_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_oid_payment` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `fk_order_aid` FOREIGN KEY (`a_id`) REFERENCES `user_address` (`a_id`),
  ADD CONSTRAINT `fk_order_resid` FOREIGN KEY (`r_id`) REFERENCES `restaurants` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_useradd_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
