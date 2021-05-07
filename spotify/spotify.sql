-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2021 a las 12:01:57
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

DROP SCHEMA IF EXISTS `spotify`;
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spotify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albums`
--

CREATE TABLE `albums` (
  `id_album` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `artists_id_artist` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `art_cover` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `albums`
--

INSERT INTO `albums` (`id_album`, `title`, `artists_id_artist`, `year`, `art_cover`) VALUES
(1, 'Magical Mistery Tour', 1, 1968, 'sdfgsdfg.jpg'),
(2, 'Yellow Submarine', 1, 1967, 'eyhyt.jpg'),
(3, 'Their Satanic Majesties', 2, 1967, 'dghgh.jpg'),
(4, 'Ok Computer', 3, 1995, 'fhjgfhj.jpg'),
(5, 'Pablo Honey', 3, 1990, 'lkjsdfg.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artists`
--

CREATE TABLE `artists` (
  `id_artist` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `artists`
--

INSERT INTO `artists` (`id_artist`, `name`, `image`) VALUES
(1, 'The Beatles', 'asdfds.jpg'),
(2, 'The Rolling Stones', 'dfghdg.jpg'),
(3, 'Radiohead', 'dhdfgh.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_cards`
--

CREATE TABLE `credit_cards` (
  `id_credit_cards` int(11) NOT NULL,
  `number` varchar(45) NOT NULL,
  `month` int(11) NOT NULL,
  `year` varchar(45) NOT NULL,
  `security_code` varchar(45) NOT NULL,
  `subscriptions_id_subscription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `credit_cards`
--

INSERT INTO `credit_cards` (`id_credit_cards`, `number`, `month`, `year`, `security_code`, `subscriptions_id_subscription`) VALUES
(1, '123456789', 10, '2024', '234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorite_albums`
--

CREATE TABLE `favorite_albums` (
  `id_favorite_album` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL,
  `albums_id_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `favorite_albums`
--

INSERT INTO `favorite_albums` (`id_favorite_album`, `users_id_user`, `albums_id_album`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorite_songs`
--

CREATE TABLE `favorite_songs` (
  `id_favorite_song` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL,
  `songs_id_song` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `favorite_songs`
--

INSERT INTO `favorite_songs` (`id_favorite_song`, `users_id_user`, `songs_id_song`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 4),
(6, 2, 5),
(7, 3, 8),
(8, 3, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `id_gender` int(11) NOT NULL,
  `gender` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`id_gender`, `gender`) VALUES
(1, 'male'),
(2, 'female'),
(3, 'other');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id_payment` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_number` varchar(45) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `subscriptions_id_subscription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id_payment`, `date`, `order_number`, `total`, `subscriptions_id_subscription`) VALUES
(1, '2020-01-01', '123456', '90.90', 1),
(2, '2021-01-01', '123457', '90.90', 1),
(3, '2021-02-02', '123458', '90.90', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_types`
--

CREATE TABLE `payment_types` (
  `id_payment_type` int(11) NOT NULL,
  `payment_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payment_types`
--

INSERT INTO `payment_types` (`id_payment_type`, `payment_type`) VALUES
(1, 'credit card'),
(2, 'paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypals`
--

CREATE TABLE `paypals` (
  `id_paypal` int(11) NOT NULL,
  `paypal_user` varchar(45) NOT NULL,
  `subscriptions_id_subscription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paypals`
--

INSERT INTO `paypals` (`id_paypal`, `paypal_user`, `subscriptions_id_subscription`) VALUES
(1, 'maria@gmai.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlists`
--

CREATE TABLE `playlists` (
  `id_playlist` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `songs_number` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_change` date DEFAULT NULL,
  `playlist_status_id_playlist_statu` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `playlists`
--

INSERT INTO `playlists` (`id_playlist`, `title`, `songs_number`, `creation_date`, `status_change`, `playlist_status_id_playlist_statu`, `users_id_user`) VALUES
(1, '60\'s', 3, '2021-04-22 09:40:18', '0000-00-00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlists_has_songs`
--

CREATE TABLE `playlists_has_songs` (
  `playlists_id_playlist` int(11) NOT NULL,
  `songs_id_song` int(11) NOT NULL,
  `added_by_id_user` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `playlists_has_songs`
--

INSERT INTO `playlists_has_songs` (`playlists_id_playlist`, `songs_id_song`, `added_by_id_user`, `date`) VALUES
(1, 1, 1, '2020-02-02'),
(1, 2, 1, '2020-03-03'),
(1, 4, 2, '2020-05-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_status`
--

CREATE TABLE `playlist_status` (
  `id_playlist_statu` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `playlist_status`
--

INSERT INTO `playlist_status` (`id_playlist_statu`, `status`) VALUES
(1, 'active'),
(2, 'deleted');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `related_artists`
--

CREATE TABLE `related_artists` (
  `id_related_artist` int(11) NOT NULL,
  `artists_id_artist1` int(11) NOT NULL,
  `artists_id_artist2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `related_artists`
--

INSERT INTO `related_artists` (`id_related_artist`, `artists_id_artist1`, `artists_id_artist2`) VALUES
(0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shared`
--

CREATE TABLE `shared` (
  `id_shared` int(11) NOT NULL,
  `playlists_id_playlist` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `shared`
--

INSERT INTO `shared` (`id_shared`, `playlists_id_playlist`, `users_id_user`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songs`
--

CREATE TABLE `songs` (
  `id_song` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` decimal(6,2) NOT NULL,
  `plays` int(11) DEFAULT NULL,
  `albums_id_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`id_song`, `title`, `duration`, `plays`, `albums_id_album`) VALUES
(1, 'Yellow Submarine', '3.60', 111, 2),
(2, 'Hay Bulldog', '5.66', 322, 2),
(3, 'Sea Of Time', '3.33', 98, 2),
(4, 'Citadel', '4.33', 222, 3),
(5, 'Sing This all together', '4.22', 235, 3),
(6, 'Flying', '2.33', 321, 1),
(7, 'The Fool on the Hill', '3.36', 654, 1),
(8, 'Airbag', '6.33', 123, 4),
(9, 'Let Down', '2.32', 222, 4),
(10, 'You', '2.36', 236, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id_subscription` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `renew_date` date NOT NULL,
  `payment_types_id_payment_type` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `subscriptions`
--

INSERT INTO `subscriptions` (`id_subscription`, `start_date`, `renew_date`, `payment_types_id_payment_type`, `users_id_user`) VALUES
(1, '2020-01-01', '2022-01-01', 1, 1),
(2, '2021-02-02', '2023-02-02', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(120) NOT NULL,
  `birth_date` date NOT NULL,
  `user_types_id_user_type` int(11) NOT NULL,
  `genres_id_gender` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `name`, `birth_date`, `user_types_id_user_type`, `genres_id_gender`, `country`, `zip_code`) VALUES
(1, 'marcel@gmail.com', '1234', 'Marcel', '1970-10-05', 2, 1, 'España', '08800'),
(2, 'juan@hotmail.com', '4321', 'Juan', '1980-05-05', 1, 1, 'España', '08001'),
(3, 'maria@gmail.com', '4567', 'María', '1985-06-09', 2, 3, 'España', '08730');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_follow_artists`
--

CREATE TABLE `users_follow_artists` (
  `users_id_user` int(11) NOT NULL,
  `artists_id_artist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_follow_artists`
--

INSERT INTO `users_follow_artists` (`users_id_user`, `artists_id_artist`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_types`
--

CREATE TABLE `user_types` (
  `id_user_type` int(11) NOT NULL,
  `user_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_types`
--

INSERT INTO `user_types` (`id_user_type`, `user_type`) VALUES
(1, 'free'),
(2, 'premium');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `fk_albums_artists1_idx` (`artists_id_artist`);

--
-- Indices de la tabla `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id_artist`);

--
-- Indices de la tabla `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD PRIMARY KEY (`id_credit_cards`),
  ADD KEY `fk_credit_cards_subscriptions1_idx` (`subscriptions_id_subscription`);

--
-- Indices de la tabla `favorite_albums`
--
ALTER TABLE `favorite_albums`
  ADD PRIMARY KEY (`id_favorite_album`),
  ADD KEY `fk_favorite_albums_users1_idx` (`users_id_user`),
  ADD KEY `fk_favorite_albums_albums1_idx` (`albums_id_album`);

--
-- Indices de la tabla `favorite_songs`
--
ALTER TABLE `favorite_songs`
  ADD PRIMARY KEY (`id_favorite_song`),
  ADD KEY `fk_favorite_songs_users1_idx` (`users_id_user`),
  ADD KEY `fk_favorite_songs_songs1_idx` (`songs_id_song`);

--
-- Indices de la tabla `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id_gender`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payment`),
  ADD UNIQUE KEY `order_number_UNIQUE` (`order_number`),
  ADD KEY `fk_payments_subscriptions1_idx` (`subscriptions_id_subscription`);

--
-- Indices de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id_payment_type`);

--
-- Indices de la tabla `paypals`
--
ALTER TABLE `paypals`
  ADD PRIMARY KEY (`id_paypal`),
  ADD KEY `fk_paypals_subscriptions1_idx` (`subscriptions_id_subscription`);

--
-- Indices de la tabla `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id_playlist`),
  ADD KEY `fk_playlists_playlist_status1_idx` (`playlist_status_id_playlist_statu`),
  ADD KEY `fk_playlists_users1_idx` (`users_id_user`);

--
-- Indices de la tabla `playlists_has_songs`
--
ALTER TABLE `playlists_has_songs`
  ADD PRIMARY KEY (`playlists_id_playlist`,`songs_id_song`),
  ADD KEY `fk_playlists_has_songs_songs1_idx` (`songs_id_song`),
  ADD KEY `fk_playlists_has_songs_playlists1_idx` (`playlists_id_playlist`),
  ADD KEY `fk_playlists_has_songs_users1_idx` (`added_by_id_user`);

--
-- Indices de la tabla `playlist_status`
--
ALTER TABLE `playlist_status`
  ADD PRIMARY KEY (`id_playlist_statu`);

--
-- Indices de la tabla `related_artists`
--
ALTER TABLE `related_artists`
  ADD PRIMARY KEY (`id_related_artist`),
  ADD KEY `fk_related_artists_artists1_idx` (`artists_id_artist1`),
  ADD KEY `fk_related_artists_artists2_idx` (`artists_id_artist2`);

--
-- Indices de la tabla `shared`
--
ALTER TABLE `shared`
  ADD PRIMARY KEY (`id_shared`),
  ADD KEY `fk_shareds_playlists1_idx` (`playlists_id_playlist`),
  ADD KEY `fk_shareds_users1_idx` (`users_id_user`);

--
-- Indices de la tabla `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id_song`),
  ADD KEY `fk_songs_albums1_idx` (`albums_id_album`);

--
-- Indices de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id_subscription`),
  ADD KEY `fk_subscriptions_payment_types1_idx` (`payment_types_id_payment_type`),
  ADD KEY `fk_subscriptions_users1_idx` (`users_id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_users_user_types_idx` (`user_types_id_user_type`),
  ADD KEY `fk_users_gender1_idx` (`genres_id_gender`);

--
-- Indices de la tabla `users_follow_artists`
--
ALTER TABLE `users_follow_artists`
  ADD PRIMARY KEY (`users_id_user`,`artists_id_artist`),
  ADD KEY `fk_users_has_artists_artists1_idx` (`artists_id_artist`),
  ADD KEY `fk_users_has_artists_users1_idx` (`users_id_user`);

--
-- Indices de la tabla `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id_user_type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albums`
--
ALTER TABLE `albums`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `artists`
--
ALTER TABLE `artists`
  MODIFY `id_artist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `credit_cards`
--
ALTER TABLE `credit_cards`
  MODIFY `id_credit_cards` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `favorite_albums`
--
ALTER TABLE `favorite_albums`
  MODIFY `id_favorite_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `favorite_songs`
--
ALTER TABLE `favorite_songs`
  MODIFY `id_favorite_song` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id_payment_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `paypals`
--
ALTER TABLE `paypals`
  MODIFY `id_paypal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id_playlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `playlist_status`
--
ALTER TABLE `playlist_status`
  MODIFY `id_playlist_statu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `shared`
--
ALTER TABLE `shared`
  MODIFY `id_shared` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `songs`
--
ALTER TABLE `songs`
  MODIFY `id_song` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id_subscription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `fk_albums_artists1` FOREIGN KEY (`artists_id_artist`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credit_cards`
--
ALTER TABLE `credit_cards`
  ADD CONSTRAINT `fk_credit_cards_subscriptions1` FOREIGN KEY (`subscriptions_id_subscription`) REFERENCES `subscriptions` (`id_subscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `favorite_albums`
--
ALTER TABLE `favorite_albums`
  ADD CONSTRAINT `fk_favorite_albums_albums1` FOREIGN KEY (`albums_id_album`) REFERENCES `albums` (`id_album`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_favorite_albums_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `favorite_songs`
--
ALTER TABLE `favorite_songs`
  ADD CONSTRAINT `fk_favorite_songs_songs1` FOREIGN KEY (`songs_id_song`) REFERENCES `songs` (`id_song`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_favorite_songs_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_subscriptions1` FOREIGN KEY (`subscriptions_id_subscription`) REFERENCES `subscriptions` (`id_subscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paypals`
--
ALTER TABLE `paypals`
  ADD CONSTRAINT `fk_paypals_subscriptions1` FOREIGN KEY (`subscriptions_id_subscription`) REFERENCES `subscriptions` (`id_subscription`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `fk_playlists_playlist_status1` FOREIGN KEY (`playlist_status_id_playlist_statu`) REFERENCES `playlist_status` (`id_playlist_statu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playlists_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `playlists_has_songs`
--
ALTER TABLE `playlists_has_songs`
  ADD CONSTRAINT `fk_playlists_has_songs_playlists1` FOREIGN KEY (`playlists_id_playlist`) REFERENCES `playlists` (`id_playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playlists_has_songs_songs1` FOREIGN KEY (`songs_id_song`) REFERENCES `songs` (`id_song`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playlists_has_songs_users1` FOREIGN KEY (`added_by_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `related_artists`
--
ALTER TABLE `related_artists`
  ADD CONSTRAINT `fk_related_artists_artists1` FOREIGN KEY (`artists_id_artist1`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_related_artists_artists2` FOREIGN KEY (`artists_id_artist2`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `shared`
--
ALTER TABLE `shared`
  ADD CONSTRAINT `fk_shareds_playlists1` FOREIGN KEY (`playlists_id_playlist`) REFERENCES `playlists` (`id_playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_shareds_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `fk_songs_albums1` FOREIGN KEY (`albums_id_album`) REFERENCES `albums` (`id_album`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `fk_subscriptions_payment_types1` FOREIGN KEY (`payment_types_id_payment_type`) REFERENCES `payment_types` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_subscriptions_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_genres1` FOREIGN KEY (`genres_id_gender`) REFERENCES `genders` (`id_gender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_user_types` FOREIGN KEY (`user_types_id_user_type`) REFERENCES `user_types` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users_follow_artists`
--
ALTER TABLE `users_follow_artists`
  ADD CONSTRAINT `fk_users_has_artists_artists1` FOREIGN KEY (`artists_id_artist`) REFERENCES `artists` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_artists_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
