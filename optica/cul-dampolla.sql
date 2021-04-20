-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2021 a las 11:52:42
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul-dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adreça` varchar(200) DEFAULT NULL,
  `telefon` varchar(9) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_registre` date DEFAULT NULL,
  `clients_id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `adreça`, `telefon`, `email`, `data_registre`, `clients_id_client`) VALUES
(4, 'Juan Perez', 'c/ ffff 44 Barcelona', '666666666', 'juan@ddd.cc', '2021-04-07', NULL),
(5, 'Tom Hall', 'c/ erts 55 Madrid', '677677677', 'tom@fff.com', '2021-04-08', NULL),
(6, 'Maxi Soto', 'c/ asdf 44 Madrid', '666999666', 'maxi@fff.cc', '2021-04-01', 4),
(7, 'María Molina', 'c/ awef 55 Barcelona', '666333222', 'maria@fff.com', '2021-04-03', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comandes`
--

CREATE TABLE `comandes` (
  `id_comanda` int(11) NOT NULL,
  `data` date NOT NULL,
  `preu` decimal(6,2) NOT NULL,
  `ulleres_id_ulleres` int(11) NOT NULL,
  `empleats_id_empleat` int(11) NOT NULL,
  `clients_id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comandes`
--

INSERT INTO `comandes` (`id_comanda`, `data`, `preu`, `ulleres_id_ulleres`, `empleats_id_empleat`, `clients_id_client`) VALUES
(1, '2021-04-06', '222.00', 2, 1, 4),
(2, '2021-04-01', '99.99', 4, 1, 5),
(3, '2021-04-06', '122.66', 1, 3, 7),
(4, '2021-04-15', '99.99', 5, 4, 6),
(5, '2021-04-15', '100.90', 6, 3, 7),
(6, '2021-04-15', '111.00', 3, 4, 6),
(7, '2021-04-09', '122.66', 5, 2, 6),
(8, '2021-04-12', '122.33', 5, 3, 6),
(9, '2021-04-09', '222.00', 3, 3, 6),
(10, '2021-04-09', '122.33', 2, 3, 7),
(11, '2021-04-09', '500.33', 4, 3, 6),
(12, '2021-04-01', '122.33', 5, 3, 5),
(13, '2021-03-02', '100.00', 2, 3, 5),
(14, '2021-03-02', '111.33', 4, 3, 5),
(15, '2021-03-18', '500.33', 1, 4, 4),
(16, '0000-00-00', '122.33', 2, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom`) VALUES
(1, 'Jose Herrera'),
(2, 'Rafael Sanchez'),
(3, 'Manuel Fernández'),
(4, 'Marcos Vergara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidors` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pis` varchar(11) DEFAULT NULL,
  `porta` varchar(4) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  `país` varchar(45) DEFAULT NULL,
  `telefon` varchar(9) NOT NULL,
  `fax` varchar(9) NOT NULL,
  `nif` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_proveidors`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `país`, `telefon`, `fax`, `nif`) VALUES
(2, 'Maxióptica', 'wert', 44, 'bajo', '1', 'Barcelona', '08000', 'España', '666777555', '666777444', '45645456M'),
(3, 'Optisuper', 'agd', 33, '1', NULL, 'Barcelona', '08000', 'España', '666999888', '666999777', '45678932V'),
(4, 'Optical', 'wert', 55, 'Local', NULL, 'Barcelona', '08000', 'España', '666555222', '666333222', '23423443L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_muntura`
--

CREATE TABLE `tipus_muntura` (
  `id_tipus_muntura` int(11) NOT NULL,
  `tipus` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipus_muntura`
--

INSERT INTO `tipus_muntura` (`id_tipus_muntura`, `tipus`) VALUES
(1, 'flotant'),
(2, 'pasta '),
(3, 'metàl·lica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `graduacio_esq` decimal(6,2) DEFAULT NULL,
  `graduacio_dre` decimal(6,2) DEFAULT NULL,
  `color_ muntura` varchar(45) DEFAULT NULL,
  `color_vidre_esq` varchar(45) DEFAULT NULL,
  `color_vidre_dre` varchar(45) DEFAULT NULL,
  `preu` decimal(6,2) DEFAULT NULL,
  `proveidors_id_proveidors` int(11) NOT NULL,
  `tipus_muntura_id_tipus_muntura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `graduacio_esq`, `graduacio_dre`, `color_ muntura`, `color_vidre_esq`, `color_vidre_dre`, `preu`, `proveidors_id_proveidors`, `tipus_muntura_id_tipus_muntura`) VALUES
(1, 'qwery', '1.00', '1.00', 'rojo', 'verde', 'verde', '222.00', 2, 1),
(2, 'coco', '1.75', '1.75', 'verde', 'amarillo', 'amarillo', '100.90', 4, 2),
(3, 'Vip', '2.50', '2.50', 'azul', 'azul', 'azul', '122.66', 3, 2),
(4, 'Bop', '2.00', '2.50', 'gris', 'rojo', 'verde', '333.66', 4, 3),
(5, 'Rut', '1.00', '2.00', 'rojo', 'amarillo', 'amarillo', '500.33', 3, 1),
(6, 'Vap', '1.20', '1.30', 'Verde', 'azul', 'azul', '99.99', 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `fk_clients_clients1_idx` (`clients_id_client`);

--
-- Indices de la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `fk_comandes_ulleres1_idx` (`ulleres_id_ulleres`),
  ADD KEY `fk_comandes_empleats1_idx` (`empleats_id_empleat`),
  ADD KEY `fk_comandes_clients1_idx` (`clients_id_client`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidors`);

--
-- Indices de la tabla `tipus_muntura`
--
ALTER TABLE `tipus_muntura`
  ADD PRIMARY KEY (`id_tipus_muntura`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `fk_ulleres_proveidors_idx` (`proveidors_id_proveidors`),
  ADD KEY `fk_ulleres_tipus_muntura_idx` (`tipus_muntura_id_tipus_muntura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comandes`
--
ALTER TABLE `comandes`
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipus_muntura`
--
ALTER TABLE `tipus_muntura`
  MODIFY `id_tipus_muntura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_clients1` FOREIGN KEY (`clients_id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comandes`
--
ALTER TABLE `comandes`
  ADD CONSTRAINT `fk_comandes_clients1` FOREIGN KEY (`clients_id_client`) REFERENCES `clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comandes_empleats1` FOREIGN KEY (`empleats_id_empleat`) REFERENCES `empleats` (`id_empleat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comandes_ulleres1` FOREIGN KEY (`ulleres_id_ulleres`) REFERENCES `ulleres` (`id_ulleres`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `fk_ulleres_proveidors` FOREIGN KEY (`proveidors_id_proveidors`) REFERENCES `proveidors` (`id_proveidors`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ulleres_tipus_muntura` FOREIGN KEY (`tipus_muntura_id_tipus_muntura`) REFERENCES `tipus_muntura` (`id_tipus_muntura`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
