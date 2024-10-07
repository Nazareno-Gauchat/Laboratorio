-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-09-2024 a las 14:15:48
-- Versión del servidor: 8.0.35
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c2660463_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras`
--

CREATE TABLE `computadoras` (
  `id_computadora` int NOT NULL,
  `rack` enum('CONIG','LENOVO','CA','') COLLATE utf8mb4_general_ci NOT NULL,
  `numero` int NOT NULL,
  `estado` enum('disponible','reservado','en uso','') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `computadoras`
--

INSERT INTO `computadoras` (`id_computadora`, `rack`, `numero`, `estado`) VALUES
(1, 'CONIG', 1, 'disponible'),
(2, 'CONIG', 2, 'disponible'),
(3, 'CONIG', 3, 'disponible'),
(4, 'CONIG', 4, 'disponible'),
(5, 'CONIG', 5, 'disponible'),
(6, 'CONIG', 6, 'disponible'),
(7, 'CONIG', 7, 'disponible'),
(8, 'CONIG', 8, 'disponible'),
(9, 'CONIG', 9, 'disponible'),
(10, 'CONIG', 10, 'disponible'),
(11, 'CONIG', 11, 'disponible'),
(12, 'CONIG', 12, 'disponible'),
(13, 'CONIG', 13, 'disponible'),
(14, 'CONIG', 14, 'en uso'),
(15, 'CONIG', 15, 'disponible'),
(16, 'CONIG', 16, 'disponible'),
(17, 'CONIG', 17, 'disponible'),
(18, 'CONIG', 18, 'disponible'),
(19, 'CONIG', 19, 'disponible'),
(20, 'CONIG', 20, 'disponible'),
(21, 'CONIG', 21, 'disponible'),
(22, 'CONIG', 22, 'disponible'),
(23, 'CONIG', 23, 'disponible'),
(24, 'CONIG', 24, 'disponible'),
(25, 'CONIG', 25, 'disponible'),
(26, 'CONIG', 26, 'disponible'),
(27, 'CONIG', 27, 'disponible'),
(28, 'CONIG', 28, 'disponible'),
(29, 'CONIG', 29, 'disponible'),
(30, 'CONIG', 30, 'disponible'),
(31, 'LENOVO', 1, 'en uso'),
(32, 'LENOVO', 2, 'disponible'),
(33, 'LENOVO', 3, 'disponible'),
(34, 'LENOVO', 4, 'disponible'),
(35, 'LENOVO', 5, 'disponible'),
(36, 'LENOVO', 6, 'disponible'),
(37, 'LENOVO', 7, 'disponible'),
(38, 'LENOVO', 8, 'disponible'),
(39, 'LENOVO', 9, 'disponible'),
(40, 'LENOVO', 10, 'disponible'),
(41, 'LENOVO', 11, 'disponible'),
(42, 'LENOVO', 12, 'disponible'),
(43, 'LENOVO', 13, 'disponible'),
(44, 'LENOVO', 14, 'disponible'),
(45, 'LENOVO', 15, 'disponible'),
(46, 'LENOVO', 16, 'disponible'),
(47, 'LENOVO', 17, 'en uso'),
(48, 'LENOVO', 18, 'en uso'),
(49, 'LENOVO', 19, 'disponible'),
(50, 'LENOVO', 20, 'disponible'),
(51, 'LENOVO', 21, 'disponible'),
(52, 'LENOVO', 22, 'en uso'),
(53, 'LENOVO', 23, 'disponible'),
(54, 'LENOVO', 24, 'disponible'),
(55, 'LENOVO', 25, 'disponible'),
(56, 'LENOVO', 26, 'disponible'),
(57, 'LENOVO', 27, 'disponible'),
(58, 'LENOVO', 28, 'disponible'),
(59, 'LENOVO', 29, 'disponible'),
(60, 'LENOVO', 30, 'disponible'),
(61, 'LENOVO', 31, 'en uso'),
(62, 'LENOVO', 32, 'disponible'),
(63, 'LENOVO', 33, 'disponible'),
(64, 'LENOVO', 34, 'disponible'),
(65, 'LENOVO', 35, 'disponible'),
(66, 'LENOVO', 36, 'disponible'),
(67, 'LENOVO', 37, 'disponible'),
(68, 'LENOVO', 38, 'disponible'),
(69, 'LENOVO', 39, 'en uso'),
(70, 'LENOVO', 40, 'disponible'),
(71, 'LENOVO', 41, 'disponible'),
(72, 'LENOVO', 42, 'disponible'),
(73, 'LENOVO', 43, 'disponible'),
(74, 'LENOVO', 44, 'disponible'),
(75, 'LENOVO', 45, 'disponible'),
(76, 'LENOVO', 46, 'en uso'),
(77, 'LENOVO', 47, 'disponible'),
(78, 'LENOVO', 48, 'disponible'),
(79, 'LENOVO', 49, 'disponible'),
(80, 'LENOVO', 50, 'disponible'),
(81, 'CA', 1, 'disponible'),
(82, 'CA', 2, 'disponible'),
(83, 'CA', 3, 'disponible'),
(84, 'CA', 4, 'disponible'),
(85, 'CA', 5, 'disponible'),
(86, 'CA', 6, 'disponible'),
(87, 'CA', 7, 'disponible'),
(88, 'CA', 8, 'disponible'),
(89, 'CA', 9, 'disponible'),
(90, 'CA', 10, 'disponible'),
(91, 'CA', 11, 'disponible'),
(92, 'CA', 12, 'disponible'),
(93, 'CA', 13, 'disponible'),
(94, 'CA', 14, 'disponible'),
(95, 'CA', 15, 'disponible'),
(96, 'CA', 16, 'disponible'),
(97, 'CA', 17, 'disponible'),
(98, 'CA', 18, 'disponible'),
(99, 'CA', 19, 'disponible'),
(100, 'CA', 20, 'disponible'),
(101, 'CA', 21, 'disponible'),
(102, 'CA', 22, 'disponible'),
(103, 'CA', 23, 'disponible'),
(104, 'CA', 24, 'disponible'),
(105, 'CA', 25, 'disponible'),
(106, 'CA', 26, 'disponible'),
(107, 'CA', 27, 'disponible'),
(108, 'CA', 28, 'disponible'),
(109, 'CA', 29, 'disponible'),
(110, 'CA', 30, 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id_docente` int NOT NULL,
  `nombre_docente` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id_docente`, `nombre_docente`) VALUES
(3, 'CORAZZA, RICARDO RAFAEL'),
(4, 'CUBERLI, CONSTANZA'),
(5, 'CHIANALINO, MARIA SILVIA'),
(6, 'DÁVILA, IVANNA YANINA'),
(7, 'DONDO, GABRIELA SUSANA'),
(8, 'DRUETTA, JOSE ALBERTO'),
(9, 'DUMYCZ, SHEYLA'),
(10, 'ESPASANDIN, TRINIDAD'),
(11, 'FOGEL, CAROLINA ELIZABETH'),
(12, 'FRANCIA, FEDERICO MATIAS'),
(13, 'GATTI, ANDRES LEOPOLDO'),
(14, 'GIELCZUK, CANDELA DEL VALLE'),
(15, 'GIORDANO, OSCAR ALBERTO'),
(16, 'GIRARDI, IRENE'),
(17, 'GRAMOY, ELIZABETH'),
(18, 'HERNANDEZ, NATALIA LORENA'),
(19, 'HUEGES, FLAVIA DANIELA'),
(20, 'LITWIN, PAMELA ANDREA'),
(21, 'LIVA, ANABELLA'),
(22, 'LOPEZ, CLAUDIA MABEL'),
(23, 'MANACORDA, ANTONELLA IVANA'),
(24, 'MANSILLA, ANALIA GUADALUPE'),
(25, 'MANSILLA, MAILÉN PAOLA'),
(26, 'MANSUR, GASTÓN'),
(27, 'MARCIANO, JULIO'),
(28, 'MELANO, GUIDO NICOLAS'),
(29, 'MENARDI, ROXANA CINTHIA'),
(30, 'MOLINA, ANTONELA ALEJANDRA'),
(31, 'MOLINA, CANDELA SOLEDAD'),
(32, 'MOSCA, ANABEL CARLA'),
(33, 'MOSCA, LORENA ANDREA'),
(34, 'NAVARRO, MARIA EUGENIA'),
(35, 'NONINO, JOAQUIN'),
(36, 'NUÑEZ, ANA ELISA'),
(37, 'OLMOS, NICOLAS ELISEO'),
(38, 'ORTIZ, CLAUDIA NORMA'),
(39, 'ORTIZ, FRANCO'),
(40, 'PESARESI, NATALI SOLEDAD'),
(41, 'PICAT, FRANCO JULIAN'),
(42, 'PIGNATTA, FIAMMA'),
(43, 'QUINTEROS, ALEJANDRO CARLOS'),
(44, 'RICCA, EZEQUIEL OSVALDO'),
(45, 'RIVOIRA, CAROLINA RITA'),
(46, 'ROSSOTTO, FIORELLA MARÍA'),
(47, 'SECCHI, LAURA SOLEDAD'),
(48, 'SEPERTINO, ROMINA MAGALI'),
(49, 'SUAREZ, MIRNA ALEJANDRA'),
(50, 'VALDEMARÍN, LUCAS ANDRÉS'),
(51, 'VOCOS, LEANDRO ELÍAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` int NOT NULL,
  `id_computadora` int NOT NULL,
  `id_reserva` int NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_movimiento` enum('reserva','devolucion') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `id_computadora`, `id_reserva`, `fecha_movimiento`, `tipo_movimiento`) VALUES
(280, 30, 145, '2024-08-28 15:09:14', 'reserva'),
(281, 50, 146, '2024-08-28 15:09:17', 'reserva'),
(282, 2, 147, '2024-08-28 18:11:07', 'reserva'),
(283, 4, 148, '2024-08-28 18:11:09', 'reserva'),
(284, 30, 145, '2024-08-28 18:11:17', 'devolucion'),
(285, 6, 149, '2024-08-28 18:22:47', 'reserva'),
(286, 57, 150, '2024-08-28 18:22:48', 'reserva'),
(287, 1, 151, '2024-08-29 12:44:24', 'reserva'),
(288, 6, 149, '2024-08-29 12:44:37', 'devolucion'),
(289, 57, 150, '2024-09-02 17:29:48', 'devolucion'),
(290, 2, 147, '2024-09-02 17:29:49', 'devolucion'),
(291, 4, 148, '2024-09-02 17:29:50', 'devolucion'),
(292, 50, 146, '2024-09-02 17:29:51', 'devolucion'),
(293, 1, 151, '2024-09-02 17:29:52', 'devolucion'),
(294, 54, 152, '2024-09-02 17:30:24', 'reserva'),
(295, 57, 153, '2024-09-02 17:30:26', 'reserva'),
(296, 54, 152, '2024-09-02 17:30:32', 'devolucion'),
(297, 57, 153, '2024-09-02 17:30:34', 'devolucion'),
(298, 1, 154, '2024-09-02 17:31:09', 'reserva'),
(299, 1, 154, '2024-09-02 17:31:15', 'devolucion'),
(300, 1, 155, '2024-09-02 17:32:11', 'reserva'),
(301, 9, 156, '2024-09-02 17:32:15', 'reserva'),
(302, 1, 155, '2024-09-02 17:32:22', 'devolucion'),
(303, 9, 156, '2024-09-02 17:32:23', 'devolucion'),
(304, 74, 157, '2024-09-03 17:24:52', 'reserva'),
(305, 2, 158, '2024-09-03 17:39:50', 'reserva'),
(306, 3, 159, '2024-09-03 17:39:52', 'reserva'),
(307, 2, 158, '2024-09-03 17:39:56', 'devolucion'),
(308, 3, 159, '2024-09-03 17:39:58', 'devolucion'),
(309, 74, 157, '2024-09-03 17:40:00', 'devolucion'),
(310, 44, 160, '2024-09-03 17:52:31', 'reserva'),
(311, 44, 161, '2024-09-03 17:52:32', 'reserva'),
(312, 44, 162, '2024-09-03 17:52:33', 'reserva'),
(313, 44, 163, '2024-09-03 17:52:33', 'reserva'),
(314, 44, 164, '2024-09-03 17:52:33', 'reserva'),
(315, 44, 165, '2024-09-03 17:52:33', 'reserva'),
(316, 44, 166, '2024-09-03 17:52:34', 'reserva'),
(317, 44, 167, '2024-09-03 17:52:44', 'reserva'),
(318, 44, 168, '2024-09-03 17:52:44', 'reserva'),
(319, 44, 169, '2024-09-03 17:52:45', 'reserva'),
(320, 44, 170, '2024-09-03 17:52:46', 'reserva'),
(321, 44, 171, '2024-09-03 17:53:09', 'reserva'),
(322, 44, 172, '2024-09-03 17:53:19', 'reserva'),
(323, 44, 160, '2024-09-03 17:54:37', 'devolucion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL,
  `id_docente` int NOT NULL,
  `curso` enum('1A','1B','2A','2B','3A','3B','4A','4B','5A','5B','6A','6B','7A','7B') COLLATE utf8mb4_general_ci NOT NULL,
  `id_computadora` int NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_reserva` enum('activa','finalizada') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_docente`, `curso`, `id_computadora`, `fecha_reserva`, `estado_reserva`) VALUES
(145, 37, '5B', 30, '2024-08-28 15:09:14', 'finalizada'),
(146, 37, '5B', 50, '2024-08-28 15:09:17', 'finalizada'),
(147, 32, '3B', 2, '2024-08-28 18:11:07', 'finalizada'),
(148, 32, '3B', 4, '2024-08-28 18:11:09', 'finalizada'),
(149, 3, '1A', 6, '2024-08-28 18:22:47', 'finalizada'),
(150, 3, '1A', 57, '2024-08-28 18:22:48', 'finalizada'),
(151, 11, '7A', 1, '2024-08-29 12:44:24', 'finalizada'),
(152, 37, '7B', 54, '2024-09-02 17:30:24', 'finalizada'),
(153, 37, '7B', 57, '2024-09-02 17:30:26', 'finalizada'),
(154, 37, '7B', 1, '2024-09-02 17:31:09', 'finalizada'),
(155, 3, '1A', 1, '2024-09-02 17:32:11', 'finalizada'),
(156, 3, '1A', 9, '2024-09-02 17:32:15', 'finalizada'),
(157, 3, '1A', 74, '2024-09-03 17:24:52', 'finalizada'),
(158, 24, '1A', 2, '2024-09-03 17:39:50', 'finalizada'),
(159, 24, '1A', 3, '2024-09-03 17:39:52', 'finalizada'),
(160, 5, '5A', 44, '2024-09-03 17:52:31', 'finalizada'),
(161, 5, '5A', 44, '2024-09-03 17:52:32', 'activa'),
(162, 5, '5A', 44, '2024-09-03 17:52:33', 'activa'),
(163, 5, '5A', 44, '2024-09-03 17:52:33', 'activa'),
(164, 5, '5A', 44, '2024-09-03 17:52:33', 'activa'),
(165, 5, '5A', 44, '2024-09-03 17:52:33', 'activa'),
(166, 5, '5A', 44, '2024-09-03 17:52:34', 'activa'),
(167, 5, '5A', 44, '2024-09-03 17:52:44', 'activa'),
(168, 5, '5A', 44, '2024-09-03 17:52:44', 'activa'),
(169, 5, '5A', 44, '2024-09-03 17:52:45', 'activa'),
(170, 5, '5A', 44, '2024-09-03 17:52:46', 'activa'),
(171, 5, '5A', 44, '2024-09-03 17:53:09', 'activa'),
(172, 5, '5A', 44, '2024-09-03 17:53:19', 'activa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD PRIMARY KEY (`id_computadora`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id_docente`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_computadora` (`id_computadora`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_docente` (`id_docente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  MODIFY `id_computadora` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id_docente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_computadora`) REFERENCES `computadoras` (`id_computadora`) ON DELETE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
