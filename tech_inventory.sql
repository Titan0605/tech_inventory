-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2025 at 07:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tproduct`
--

CREATE TABLE `tproduct` (
  `id` int(11) NOT NULL,
  `sku` varchar(40) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `brand` varchar(40) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `original_price` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `guarantee` int(11) DEFAULT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tproduct`
--
ALTER TABLE `tproduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tproduct`
--
ALTER TABLE `tproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
