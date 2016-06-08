-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2016 at 11:39 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dailyshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `billingaddress`
--

CREATE TABLE IF NOT EXISTS `billingaddress` (
  `billingAddressId` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billingaddress`
--

INSERT INTO `billingaddress` (`billingAddressId`, `address`, `city`, `country`, `state`, `fullName`, `zipCode`, `customer_customerId`, `phoneNumber`) VALUES
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cartId` int(11) NOT NULL,
  `grandTotal` double NOT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `grandTotal`, `customerId`) VALUES
(4, 223.95999999999998, 3),
(62, 10.99, 61);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE IF NOT EXISTS `cartitem` (
  `carItemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPriceDouble` double NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryId` int(11) NOT NULL,
  `mainCategoryName` varchar(255) DEFAULT NULL,
  `subCategoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `mainCategoryName`, `subCategoryName`) VALUES
(47, 'Women', 'Jeans'),
(48, 'Women', 'Shirtdress'),
(53, 'Men', 'T-shirt'),
(54, 'Men', 'Trousers'),
(56, 'Men', 'Shoes'),
(57, 'Women', 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerId` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `authority`, `customerName`, `enabled`, `password`, `username`, `billingAddressId`, `cartId`, `shippingAddressId`) VALUES
(3, 'ROLE_ADMIN', 'admin', b'1', 'admin', 'admin', 2, 4, 1),
(61, 'ROLE_USER', 'John', b'1', '123', '1@gmail.com', 60, 62, 59);

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE IF NOT EXISTS `customerorder` (
  `customerOrderId` int(11) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerorder`
--

INSERT INTO `customerorder` (`customerOrderId`, `billingAddressId`, `cartId`, `customerId`, `shippingAddressId`) VALUES
(82, 2, 4, 3, 1),
(87, 2, 4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(114),
(114),
(114),
(114),
(114),
(114),
(114);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productId` int(11) NOT NULL,
  `productCategory` varchar(255) DEFAULT NULL,
  `productCondition` varchar(255) DEFAULT NULL,
  `productDescription` text,
  `productName` varchar(255) NOT NULL,
  `productPrice` double NOT NULL,
  `productSummary` varchar(255) DEFAULT NULL,
  `productTag` varchar(255) DEFAULT NULL,
  `unitInStock` int(11) NOT NULL,
  `productSubCategory` varchar(255) DEFAULT NULL,
  `productDate` date DEFAULT NULL,
  `productViews` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productCategory`, `productCondition`, `productDescription`, `productName`, `productPrice`, `productSummary`, `productTag`, `unitInStock`, `productSubCategory`, `productDate`, `productViews`) VALUES
(26, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Levi''s 710 Super Skinny Jeans', 50, 'Levi''s 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.', 'Levi''s', 10, 'Jeans', '2016-05-01', 16),
(27, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Style & Co. Tummy-Control Bootcut Jeans', 28.99, 'Sport sleek modern denim in Style&co.''s bootcut jeans featuring a flattering rinse wash and tummy-control design.', 'Tummy-Control', 5, 'Jeans', '2016-05-10', 8),
(28, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Celebrity Pink Juniors'' Skinny Jeans, Colored Wash', 24.99, 'Favorite skinny jeans from Celebrity Pink Jeans, updated with a summer-ready color!', 'Colored Wash', 0, 'Jeans', '2016-03-16', 4),
(29, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', ' RACHEL Rachel Roy Three-Quarter-Sleeve Shirtdress', 82.99, 'With a flowing fit and trend-right three-quarter sleeves this Rachel Rachel Roy shirtdress is a chic addition to your collection.', '', 5, 'Shirtdress', '2016-05-22', 37),
(30, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'BCX Juniors'' Lace-Trim Belted Shirtdress', 34.99, 'A no-fuss look for 9 to 5, BCX''s refreshed shirtdress is styled with roll-tab sleeves, a braided faux-leather belt and crochet trim at the back and shoulders.', 'BCX', 50, 'Shirtdress', '2016-05-07', 1),
(31, 'Women', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Tommy Hilfiger Polka-Dot Chambray Shirtdress', 46.99, 'Hit all the right style marks in Tommy Hilfiger''s polka-dot button-down shirt dress.', '', 2, 'Shirtdress', '2016-05-05', 33),
(33, 'Men', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Alfani Slim Fitted V-Neck T-Shirt', 10.99, 'The perfect silhouette teams with a super-soft look and feel, taking Alfani slim V-neck tee way beyond basic.', 'Alfani', 55, 'T-shirt', '2016-05-04', 36),
(34, 'Men', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Nike Men''s Pro Cool Fitted Dri-FIT Shirt', 22.4, 'Move without restriction in Nike''s Pro Cool shirt, cut with Dri-FIT and mesh fabrics to help you stay dry and cool so your performance remains at its peak.', 'Nike', 77, 'T-shirt', '2016-04-21', 4),
(35, 'Men', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Nike Men''s Dri-Fit 2.0 T-Shirt', 19.99, 'The Nike Dri-FIT Version 2.0 Men''s T-Shirt offers an athletic look and comfortable fit with a famous logo on a sweat-wicking cotton blend.', 'Nike', 1, 'T-shirt', '2016-04-25', 0),
(36, 'Men', 'new', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Levi''s Men''s 511 Slim-Fit Stretch Hybrid Trousers', 58.99, 'These Levi''s 511 trousers are cut from stretch, lightweight twill cotton fabric in a slim-fit silhouette with a slightly tapered leg for cool style and a flattering fit.', 'Levi''s', 66, 'Trousers', '2016-04-08', 2),
(37, 'Men', 'new', 'TO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or APO/FPO addresses. Restricted items include aerosols, pressurized spray cans and alcohol-based products (hairspray, nail polish, nail polish remover, shaving cream, etc.). Due to air transport restrictions and regulations, these items are required by the U.S. Department of Transportation to be shipped by Standard Ground Shipping only. These restricted items are not eligible for Premium or Overnight Shipping. TO GET FREE RETURNS: You can return merchandise by mail or in store for a full refund, which will be credited on your original tender. Free Returns exclude gift cards, food, gourmet gifts, lamps, wall art, mirrors, furniture, mattresses & area rugs. Does not apply to international orders. Gift returns or orders with different shipping & billing informationâ??or if you paid with a Gift Cardâ??are refunded on an Easy Exchange Card, which you can use for future online or in-store purchases.', 'Volcom Men''s Vorta Slim Straight-Fit Twill Trousers', 29.99, 'Pair these slim straight fit twill trousers from Volcom with a button-down for a casual yet polished work or weekend look.', 'Volcom', 12, 'Trousers', '2016-05-10', 26),
(38, 'Men', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'GUESS Slim-Straight-Fit Denim First Take Trouser', 57.99, 'Pair these slim-straight fit denim trousers from GUESS with a button-down for a casual yet polished work or weekend look.', 'Guess', 32, 'Trousers', '2016-03-16', 12),
(39, 'Women', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Women''s ZPrint Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Women''s Reebok ZPrint Running Sneakers take your running to comfortable new heights. ', 'Reebok', 133, 'Shoes', '2016-05-03', 29),
(40, 'Women', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Women''s ZPrint Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Women''s Reebok ZPrint Running Sneakers take your running to comfortable new heights.', 'Reebok', 332, 'Shoes', '2016-05-02', 2),
(41, 'Men', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Men''s ZPrint Run Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Men''s Reebok ZPrint Running Sneakers take your running to comfortable new heights.', 'Reebok', 23, 'Shoes', '2016-05-05', 0),
(42, 'Men', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'adidas Men''s Solar Boost Running Sneakers', 99.99, 'Boost your run in the advanced adidas Men''s Solar Boost Running Sneakers. Featuring a braided mesh upper that offers an iridescent look, these running sneakers have style for miles.', 'adidas', 32, 'Shoes', '2016-05-06', 0),
(43, 'Men', 'new', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'adidas Men''s Rocket Boost Running Sneakers', 119.99, 'You can always use a little boost in your run. Lace up the adidas Men''s Rocket Boost running sneakers for a smooth ride that will leave you hungry for more miles. ', 'adidas', 111, 'Shoes', '2016-05-07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `productcomment`
--

CREATE TABLE IF NOT EXISTS `productcomment` (
  `commentId` int(11) NOT NULL,
  `commentCotents` text NOT NULL,
  `commentStarts` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `commentCustomerName` varchar(255) DEFAULT NULL,
  `commentDate` date DEFAULT NULL,
  `commentCustomerEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productcomment`
--

INSERT INTO `productcomment` (`commentId`, `commentCotents`, `commentStarts`, `productId`, `commentCustomerName`, `commentDate`, `commentCustomerEmail`) VALUES
(76, 'test', 5, NULL, 'admin', '2016-05-06', 'admin'),
(77, 'test', 4, 27, 'admin', '2016-05-06', 'admin'),
(78, 'test', 4, 38, 'admin', '2016-05-06', 'admin'),
(79, 'DO NOT BUY THIS! ', 1, 36, 'admin', '2016-05-06', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `shippingaddress`
--

CREATE TABLE IF NOT EXISTS `shippingaddress` (
  `shippingAddressId` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  `fullName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippingaddress`
--

INSERT INTO `shippingaddress` (`shippingAddressId`, `city`, `country`, `state`, `address`, `zipCode`, `customer_customerId`, `fullName`, `phoneNumber`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
(59, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `sliderId` int(11) NOT NULL,
  `sliderDescription` varchar(255) DEFAULT NULL,
  `sliderLink` varchar(255) NOT NULL,
  `sliderTitle` varchar(255) NOT NULL,
  `sliderUpperData` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`sliderId`, `sliderDescription`, `sliderLink`, `sliderTitle`, `sliderUpperData`) VALUES
(66, 'veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, ', 'women', 'Women-Clothing', 'SAVE UP TO 50% OFF'),
(67, 'quae repudiandae quod nulla porro quidem, itaque quis quaerat!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis', 'men', 'Men Clothing', 'SAVE UP TO 70% OFF'),
(68, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!', 'all', 'All Products', 'SAVE UP TO 30% OFF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billingaddress`
--
ALTER TABLE `billingaddress`
  ADD PRIMARY KEY (`billingAddressId`),
  ADD KEY `FKpjkgrjcnqw9odxnqd4e1xsucf` (`customer_customerId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `FK4frngji4r1ftbjor2abkba6aj` (`customerId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`carItemId`),
  ADD KEY `FK1ddqmbytuin6giodgt7m8ele5` (`cartId`),
  ADD KEY `FKfm2xpv0aksxnpoucoywb41f86` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `FKr5wi61lg58im15h4mwys66f2f` (`billingAddressId`),
  ADD KEY `FK3b3ceu4yod31t25x3t678f1q` (`cartId`),
  ADD KEY `FK20d1ujcacjjnd89s8quarc9np` (`shippingAddressId`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`customerOrderId`),
  ADD KEY `FKku97yur4wvma4y6fj46i9nyky` (`billingAddressId`),
  ADD KEY `FKssw7c3idfgxi4fj4q4h7twfhl` (`cartId`),
  ADD KEY `FKjutwak32e8hyld5y545y5o0ff` (`customerId`),
  ADD KEY `FKpyvagleec73uwpe30b7bsdyw4` (`shippingAddressId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `productcomment`
--
ALTER TABLE `productcomment`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `FKrfkg51ccpqf5qesvabpw5g7e8` (`productId`);

--
-- Indexes for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD PRIMARY KEY (`shippingAddressId`),
  ADD KEY `FKc4u1omk2x9yvph8k41jip07tn` (`customer_customerId`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`sliderId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billingaddress`
--
ALTER TABLE `billingaddress`
  ADD CONSTRAINT `FKpjkgrjcnqw9odxnqd4e1xsucf` FOREIGN KEY (`customer_customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK4frngji4r1ftbjor2abkba6aj` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FK1ddqmbytuin6giodgt7m8ele5` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FKfm2xpv0aksxnpoucoywb41f86` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK20d1ujcacjjnd89s8quarc9np` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FK3b3ceu4yod31t25x3t678f1q` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `FKr5wi61lg58im15h4mwys66f2f` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`);

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `FKjutwak32e8hyld5y545y5o0ff` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `FKku97yur4wvma4y6fj46i9nyky` FOREIGN KEY (`billingAddressId`) REFERENCES `billingaddress` (`billingAddressId`),
  ADD CONSTRAINT `FKpyvagleec73uwpe30b7bsdyw4` FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingaddress` (`shippingAddressId`),
  ADD CONSTRAINT `FKssw7c3idfgxi4fj4q4h7twfhl` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`);

--
-- Constraints for table `productcomment`
--
ALTER TABLE `productcomment`
  ADD CONSTRAINT `FKrfkg51ccpqf5qesvabpw5g7e8` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);

--
-- Constraints for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD CONSTRAINT `FKc4u1omk2x9yvph8k41jip07tn` FOREIGN KEY (`customer_customerId`) REFERENCES `customer` (`customerId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
