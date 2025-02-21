-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2025 a las 03:42:01
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

--
-- Volcado de datos para la tabla `tbrands`
--

INSERT INTO `tbrands` (`id_brand`, `brand_name`) VALUES
(1, 'Asus'),
(2, 'Acer'),
(3, 'Apple'),
(4, 'Dell'),
(5, 'HP'),
(7, 'Lenovo'),
(6, 'LG'),
(8, 'Microsoft'),
(9, 'Samsung'),
(10, 'Sony');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcategories`
--

CREATE TABLE `tcategories` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcategories`
--

INSERT INTO `tcategories` (`id_category`, `category_name`) VALUES
(1, 'Accesorios'),
(2, 'Laptops'),
(3, 'Monitores'),
(4, 'Smartphones'),
(5, 'Tablets');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlocations`
--

CREATE TABLE `tlocations` (
  `id_location` int(11) NOT NULL,
  `location_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tlocations`
--

INSERT INTO `tlocations` (`id_location`, `location_name`) VALUES
(1, 'Almacen Principal'),
(2, 'Bodega Externa'),
(3, 'Sucursal Norte'),
(4, 'Sucursal Sur'),
(5, 'Tienda Central');

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
  `active` tinyint(4) NOT NULL DEFAULT 1
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
-- Volcado de datos para la tabla `tstates`
--

INSERT INTO `tstates` (`id_state`, `state_name`) VALUES
(1, 'Abierto pero sin usar'),
(2, 'Exposicion'),
(3, 'Nuevo'),
(4, 'Reacondicionado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbrands`
--
ALTER TABLE `tbrands`
  ADD PRIMARY KEY (`id_brand`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indices de la tabla `tcategories`
--
ALTER TABLE `tcategories`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indices de la tabla `tlocations`
--
ALTER TABLE `tlocations`
  ADD PRIMARY KEY (`id_location`),
  ADD UNIQUE KEY `location_name` (`location_name`);

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
  ADD PRIMARY KEY (`id_state`),
  ADD UNIQUE KEY `state_name` (`state_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbrands`
--
ALTER TABLE `tbrands`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tcategories`
--
ALTER TABLE `tcategories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tlocations`
--
ALTER TABLE `tlocations`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tproducts`
--
ALTER TABLE `tproducts`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tstates`
--
ALTER TABLE `tstates`
  MODIFY `id_state` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tproducts`
--
ALTER TABLE `tproducts`
  ADD CONSTRAINT `tproducts_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `tbrands` (`id_brand`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `tcategories` (`id_category`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `tstates` (`id_state`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tproducts_ibfk_4` FOREIGN KEY (`id_location`) REFERENCES `tlocations` (`id_location`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
