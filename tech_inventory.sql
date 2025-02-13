-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2025 a las 20:32:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tech_inventory`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbrands`
--

CREATE TABLE `tbrands` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcategorys`
--

CREATE TABLE `tcategorys` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlocations`
--

CREATE TABLE `tlocations` (
  `id_location` int(11) NOT NULL,
  `location_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproducts`
--

CREATE TABLE `tproducts` (
  `id_product` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `id_category` int(11) NOT NULL,
  `original_price` double NOT NULL,
  `discount_price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `warranty` int(11) NOT NULL,
  `last_updated` date NOT NULL,
  `activate` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tstates`
--

CREATE TABLE `tstates` (
  `id_state` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbrands`
--
ALTER TABLE `tbrands`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `tcategorys`
--
ALTER TABLE `tcategorys`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `tlocations`
--
ALTER TABLE `tlocations`
  ADD PRIMARY KEY (`id_location`);

--
-- Indices de la tabla `tproducts`
--
ALTER TABLE `tproducts`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_brand` (`id_brand`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_state` (`id_state`),
  ADD KEY `id_location` (`id_location`);

--
-- Indices de la tabla `tstates`
--
ALTER TABLE `tstates`
  ADD PRIMARY KEY (`id_state`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tproducts`
--
ALTER TABLE `tproducts`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tproducts`
--
ALTER TABLE `tproducts`
  ADD CONSTRAINT `tproducts_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `tbrands` (`id_brand`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `tcategorys` (`id_category`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `tstates` (`id_state`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_4` FOREIGN KEY (`id_location`) REFERENCES `tlocations` (`id_location`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
