-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2021 a las 17:55:35
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
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id_city` int(11) NOT NULL,
  `city_name` varchar(45) DEFAULT NULL,
  `provinces_id_province` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`id_city`, `city_name`, `provinces_id_province`) VALUES
(1, 'Barcelona', 1),
(2, 'Tarragona', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surnames` varchar(100) NOT NULL,
  `address` varchar(120) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `cities_id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id_customer`, `name`, `surnames`, `address`, `zip_code`, `phone`, `cities_id_city`) VALUES
(1, 'Marcel', 'Soto Molina', 'c/ dsgsdfg 54', '08731', 666555444, 1),
(2, 'juan', 'Gómez Medina', 'c/ asfasdf 66', '08880', 666555333, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surnames` varchar(120) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `roles_id_role` int(11) NOT NULL,
  `store_id_store` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id_employee`, `name`, `surnames`, `nif`, `phone`, `roles_id_role`, `store_id_store`) VALUES
(1, 'Marcel', 'Molina Soto', '45645645M', '900956984', 1, 2),
(2, 'juan', 'Pérez Mendoza', '46464545A', '666999555', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_types_id_order_type` int(11) NOT NULL,
  `total_price` decimal(6,2) DEFAULT NULL,
  `delivery_date_time` datetime DEFAULT NULL,
  `customers_id_customer` int(11) NOT NULL,
  `store_id_store` int(11) NOT NULL,
  `employees_id_employee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id_order`, `data_hora`, `order_types_id_order_type`, `total_price`, `delivery_date_time`, `customers_id_customer`, `store_id_store`, `employees_id_employee`) VALUES
(1, '2021-04-20 15:26:59', 1, '33.99', '2021-04-20 17:26:26', 1, 2, 2),
(2, '2021-04-20 15:29:22', 2, '23.98', '2021-04-21 17:28:40', 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id_order_item` int(11) NOT NULL,
  `orders_id_order` int(11) NOT NULL,
  `products_id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id_order_item`, `orders_id_order`, `products_id_product`) VALUES
(1, 1, 3),
(2, 1, 2),
(3, 2, 1),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_types`
--

CREATE TABLE `order_types` (
  `id_order_type` int(11) NOT NULL,
  `order_type_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `order_types`
--

INSERT INTO `order_types` (`id_order_type`, `order_type_name`) VALUES
(1, 'Delivery'),
(2, 'Pickup');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza_categories`
--

CREATE TABLE `pizza_categories` (
  `id_pizza_category` int(11) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pizza_categories`
--

INSERT INTO `pizza_categories` (`id_pizza_category`, `category_name`) VALUES
(1, 'Masa fina'),
(2, 'Masa gruesa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `description` varchar(120) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `unit_price` decimal(6,2) DEFAULT NULL,
  `product_types_id_product_type` int(11) NOT NULL,
  `pizza_categories_id_pizza_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `description`, `image`, `unit_price`, `product_types_id_product_type`, `pizza_categories_id_pizza_category`) VALUES
(1, 'Pizza 4 quesos', 'Con 5 quesos', '4quesos.jpg', '15.99', 1, 1),
(2, 'Hamburguesa con bacon', 'asdf, asdf asdf', 'asdfdasf.jpg', '10.33', 2, NULL),
(3, 'Cocacola', 'Zero', 'asdfsdaf.jpg', '2.33', 3, NULL),
(4, 'Pizza Diavola', 'Muy picante', 'sdf.jpg', '12.88', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_types`
--

CREATE TABLE `product_types` (
  `id_product_type` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `product_types`
--

INSERT INTO `product_types` (`id_product_type`, `product_name`) VALUES
(1, 'pizzes'),
(2, 'hamburgueses'),
(3, 'begudes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provinces`
--

CREATE TABLE `provinces` (
  `id_province` int(11) NOT NULL,
  `province_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provinces`
--

INSERT INTO `provinces` (`id_province`, `province_name`) VALUES
(1, 'Barcelona'),
(2, 'Tarragona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `rol_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_role`, `rol_name`) VALUES
(1, 'Delivery'),
(2, 'Cook');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store`
--

CREATE TABLE `store` (
  `id_store` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `cities_id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `store`
--

INSERT INTO `store` (`id_store`, `address`, `zip_code`, `cities_id_city`) VALUES
(1, 'werwrwe 44', '08001', 1),
(2, 'wertretertt 66', '07000', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `fk_cities_provinces_idx` (`provinces_id_province`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `fk_customers_cities1_idx` (`cities_id_city`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `fk_employees_roles1_idx` (`roles_id_role`),
  ADD KEY `fk_employees_store1_idx` (`store_id_store`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_order_order_types1_idx` (`order_types_id_order_type`),
  ADD KEY `fk_orders_customers1_idx` (`customers_id_customer`),
  ADD KEY `fk_orders_store1_idx` (`store_id_store`),
  ADD KEY `fk_orders_employees1_idx` (`employees_id_employee`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id_order_item`),
  ADD KEY `fk_oder_items_orders1_idx` (`orders_id_order`),
  ADD KEY `fk_order_items_products1_idx` (`products_id_product`);

--
-- Indices de la tabla `order_types`
--
ALTER TABLE `order_types`
  ADD PRIMARY KEY (`id_order_type`);

--
-- Indices de la tabla `pizza_categories`
--
ALTER TABLE `pizza_categories`
  ADD PRIMARY KEY (`id_pizza_category`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_products_product_types1_idx` (`product_types_id_product_type`),
  ADD KEY `fk_products_pizza_categories1_idx` (`pizza_categories_id_pizza_category`);

--
-- Indices de la tabla `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id_product_type`);

--
-- Indices de la tabla `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id_province`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indices de la tabla `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id_store`),
  ADD KEY `fk_store_cities1_idx` (`cities_id_city`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id_order_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pizza_categories`
--
ALTER TABLE `pizza_categories`
  MODIFY `id_pizza_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id_province` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `store`
--
ALTER TABLE `store`
  MODIFY `id_store` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_cities_provinces` FOREIGN KEY (`provinces_id_province`) REFERENCES `provinces` (`id_province`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_cities1` FOREIGN KEY (`cities_id_city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_roles1` FOREIGN KEY (`roles_id_role`) REFERENCES `roles` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employees_store1` FOREIGN KEY (`store_id_store`) REFERENCES `store` (`id_store`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_order_types1` FOREIGN KEY (`order_types_id_order_type`) REFERENCES `order_types` (`id_order_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customers_id_customer`) REFERENCES `customers` (`id_customer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_employees1` FOREIGN KEY (`employees_id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_store1` FOREIGN KEY (`store_id_store`) REFERENCES `store` (`id_store`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_oder_items_orders1` FOREIGN KEY (`orders_id_order`) REFERENCES `orders` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_items_products1` FOREIGN KEY (`products_id_product`) REFERENCES `products` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_pizza_categories1` FOREIGN KEY (`pizza_categories_id_pizza_category`) REFERENCES `pizza_categories` (`id_pizza_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_product_types1` FOREIGN KEY (`product_types_id_product_type`) REFERENCES `product_types` (`id_product_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `fk_store_cities1` FOREIGN KEY (`cities_id_city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
