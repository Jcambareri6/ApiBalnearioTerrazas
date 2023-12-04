-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 14:35:55
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `balneario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `medioDeContacto` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_Cliente`, `nombre`, `apellido`, `dni`, `telefono`, `localidad`, `email`, `medioDeContacto`, `tipo`) VALUES
(1, 'Joaquin', 'cambareri', '44046999', '02262580775', 'Ciudad Autónoma de Buenos Aires (CABA)', 'joaquin.cambareri@eest3necochea.edu.ar', 'telefno', 'sombrilla'),
(2, 'franco', 'ruaben', '', '2262507123', 'tandil', 'franco@', '2272333', 'carpa'),
(4, 'RUSO', 'ANGLADETTE', '', '2262489833', 'Pringles', 'ruso02@gmail', 'email', 'carpa'),
(5, 'abril', 'Cambareri', '', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(6, 'abril', 'Cambareri', '', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(7, 'abril', 'Cambareri', '44046999', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(8, 'miguel', 'cabodevila', '5392134', '2262445677', 'Tandil', 'Miguel@gmail', 'Telefono', 'sombrilla'),
(10, 'miguel angel', 'cabodevila', '5392134', '02262580775', 'Ciudad Autónoma de Buenos Aires (CABA)', 'liliagarre@gmail.com', 'gmail', 'sombrilla'),
(11, 'miguel angel', 'cabodevila', '5392134', '02262580775', 'Ciudad Autónoma de Buenos Aires (CABA)', 'liliagarre@gmail.com', 'gmail', 'sombrilla'),
(12, 'roberto', 'cambareri', '44046999', '444', 'Necochea - Quequén', 'joaquin.cambareri@eest3necochea.edu.ar', '4', 'sombrilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `id_factura` int(11) NOT NULL,
  `NRO_PAGO` int(11) NOT NULL,
  `pago` int(11) NOT NULL,
  `restan` int(11) NOT NULL,
  `medioDePago` varchar(45) NOT NULL,
  `id_Facturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`id_factura`, `NRO_PAGO`, `pago`, `restan`, `medioDePago`, `id_Facturas`) VALUES
(1, 1, 2000, 4, 'EFECTIVO', 4),
(2, 1, 2000, 4, 'EFECTIVO', 4),
(3, 1, 2000, 4, 'EFECTIVO', 4),
(4, 1, 2000, 4, 'EFECTIVO', 5),
(5, 1, 2000, 4, 'EFECTIVO', 5),
(6, 1, 2000, 4, 'EFECTIVO', 4),
(7, 1, 2000, 4, 'EFECTIVO', 4),
(8, 1, 2000, 4, 'EFECTIVO', 5),
(9, 1, 2000, 4, 'EFECTIVO', 5),
(10, 1, 2000, 4, 'EFECTIVO', 5),
(11, 1, 8000, 4, 'EFECTIVO', 5),
(12, 1, 2000, 4, 'EFECTIVO', 5),
(13, 1, 8000, 4, 'EFECTIVO', 5),
(14, 1, 8000, 4, 'EFECTIVO', 5),
(15, 1, 2000, 4, 'EFECTIVO', 5),
(16, 1, 2000, 4, 'EFECTIVO', 5),
(17, 1, 2000, 4, 'EFECTIVO', 5),
(18, 1, 2000, 4, 'EFECTIVO', 5),
(19, 1, 2000, 4, 'EFECTIVO', 5),
(20, 1, 8000, 4, 'EFECTIVO', 5),
(21, 1, 8000, 4, 'EFECTIVO', 5),
(24, 1, 8000, 4, 'EFECTIVO', 5),
(25, 1, 2000, 4, 'EFECTIVO', 5),
(26, 1, 2000, 4, 'EFECTIVO', 5),
(27, 1, 2000, 4, 'EFECTIVO', 5),
(28, 1, 3000, 4, 'EFECTIVO', 5),
(29, 1, 3000, 4, 'EFECTIVO', 5),
(30, 1, 7000, 4, 'EFECTIVO', 5),
(31, 1, 7000, 4, 'EFECTIVO', 5),
(32, 1, 3000, 4, 'EFECTIVO', 5),
(33, 1, 3000, 4, 'EFECTIVO', 5),
(34, 1, 3000, 4, 'EFECTIVO', 5),
(35, 1, 3000, 4, 'EFECTIVO', 5),
(36, 1, 3000, 4, 'EFECTIVO', 5),
(37, 1, 3000, 4, 'EFECTIVO', 5),
(38, 1, 4000, 4, 'EFECTIVO', 5),
(39, 1, 4000, 4, 'EFECTIVO', 5),
(40, 1, 6000, 4, 'EFECTIVO', 5),
(41, 1, 6000, 4, 'EFECTIVO', 5),
(42, 1, 6000, 4, 'EFECTIVO', 5),
(43, 1, 6000, 4, 'EFECTIVO', 5),
(44, 1, 4000, 4, 'EFECTIVO', 5),
(45, 1, 4000, 4, 'EFECTIVO', 5),
(46, 1, 6000, 4, 'EFECTIVO', 5),
(47, 1, 4000, 4, 'EFECTIVO', 5),
(48, 1, 6000, 4, 'EFECTIVO', 5),
(49, 1, 6000, 4, 'EFECTIVO', 5),
(50, 1, 6000, 4, 'EFECTIVO', 5),
(51, 1, 4000, 4, 'EFECTIVO', 5),
(52, 1, 5000, 4, 'EFECTIVO', 5),
(53, 1, 5000, 4, 'EFECTIVO', 5),
(54, 1, 5000, 4, 'EFECTIVO', 5),
(55, 1, 5000, 4, 'EFECTIVO', 5),
(56, 1, 5000, 4, 'EFECTIVO', 5),
(57, 1, 5000, 4, 'EFECTIVO', 5),
(58, 1, 5000, 4, 'EFECTIVO', 5),
(59, 1, 5000, 4, 'EFECTIVO', 5),
(60, 1, 5000, 4, 'EFECTIVO', 5),
(61, 1, 2000, 4, 'EFECTIVO', 4),
(62, 1, 2000, 4, 'EFECTIVO', 6),
(63, 1, 2000, 4, 'EFECTIVO', 6),
(64, 1, 2000, 4, 'EFECTIVO', 6),
(68, 1, 2000, 4, 'EFECTIVO', 4),
(69, 1, 6000, 4, 'EFECTIVO', 4),
(70, 1, 30000, 4, 'EFECTIVO', 4),
(71, 1, 26000, 4, 'EFECTIVO', 4),
(72, 1, 260000, 4, 'EFECTIVO', 4),
(73, 1, 30000, 4, 'EFECTIVO', 4),
(74, 1, 30000, 4, 'EFECTIVO', 5),
(75, 1, 30000, 4, 'EFECTIVO', 6),
(76, 1, 30000, 4, 'EFECTIVO', 4),
(77, 1, 260000, 4, 'EFECTIVO', 4),
(78, 1, 260000, 4, 'EFECTIVO', 6),
(79, 1, 260000, 4, 'EFECTIVO', 5),
(80, 1, 10, 4, 'EFECTIVO', 5),
(81, 1, 10000, 4, 'EFECTIVO', 5),
(82, 1, 1, 4, 'EFECTIVO', 5),
(83, 1, 10000, 4, 'EFECTIVO', 5),
(84, 1, 10000, 4, 'EFECTIVO', 5),
(85, 1, 10000, 4, 'EFECTIVO', 5),
(86, 1, 10000, 4, 'EFECTIVO', 5),
(87, 1, 10000, 4, 'EFECTIVO', 5),
(88, 1, 10000, 4, 'EFECTIVO', 5),
(89, 1, 10000, 4, 'EFECTIVO', 5),
(90, 1, 2000, 4, 'EFECTIVO', 4),
(91, 1, 2000, 4, 'EFECTIVO', 4),
(92, 1, 280000, 4, 'EFECTIVO', 4),
(93, 1, 10000, 4, 'EFECTIVO', 4),
(94, 1, 10000, 4, 'EFECTIVO', 4),
(95, 1, 270000, 4, 'EFECTIVO', 4),
(96, 1, 20000, 4, 'EFECTIVO', 4),
(97, 1, 20000, 4, 'EFECTIVO', 4),
(98, 1, 20000, 4, 'EFECTIVO', 4),
(99, 1, 20000, 4, 'EFECTIVO', 5),
(100, 1, 270000, 4, 'EFECTIVO', 5),
(101, 1, 290000, 4, 'EFECTIVO', 5),
(102, 1, 20000, 4, 'EFECTIVO', 5),
(103, 1, 270000, 4, 'EFECTIVO', 5),
(104, 1, 2000, 4, 'EFECTIVO', 5),
(105, 1, 2000, 4, 'EFECTIVO', 5),
(106, 1, 2000, 4, 'EFECTIVO', 5),
(107, 1, 268000, 4, 'EFECTIVO', 5),
(108, 1, 268000, 4, 'EFECTIVO', 5),
(109, 1, 2000, 4, 'EFECTIVO', 5),
(110, 1, 2000, 4, 'EFECTIVO', 5),
(111, 1, 268000, 4, 'EFECTIVO', 5),
(112, 1, 268000, 4, 'EFECTIVO', 5),
(113, 1, 2000, 4, 'EFECTIVO', 5),
(114, 1, 2000, 4, 'EFECTIVO', 5),
(115, 1, 268000, 4, 'EFECTIVO', 5),
(116, 1, 268000, 4, 'EFECTIVO', 5),
(117, 1, 2000, 4, 'EFECTIVO', 5),
(118, 1, 2000, 4, 'EFECTIVO', 5),
(119, 1, 2000, 4, 'EFECTIVO', 5),
(120, 1, 268000, 4, 'EFECTIVO', 5),
(121, 1, 268000, 4, 'EFECTIVO', 5),
(122, 1, 2000, 4, 'EFECTIVO', 5),
(123, 1, 2000, 4, 'EFECTIVO', 4),
(124, 1, 288000, 4, 'EFECTIVO', 4),
(125, 1, 288000, 4, 'EFECTIVO', 4),
(126, 1, 2000, 4, 'EFECTIVO', 4),
(127, 1, 2000, 4, 'EFECTIVO', 4),
(128, 1, 288000, 4, 'EFECTIVO', 4),
(129, 1, 2000, 4, 'EFECTIVO', 4),
(130, 1, 2000, 4, 'EFECTIVO', 4),
(131, 1, 288000, 4, 'EFECTIVO', 4),
(132, 1, 288000, 4, 'EFECTIVO', 4),
(133, 1, 2000, 4, 'EFECTIVO', 4),
(134, 1, 2000, 4, 'EFECTIVO', 4),
(135, 1, 288000, 4, 'EFECTIVO', 4),
(136, 1, 2000, 4, 'EFECTIVO', 4),
(137, 1, 2000, 4, 'EFECTIVO', 4),
(138, 1, 2000, 4, 'EFECTIVO', 4),
(139, 1, 2000, 4, 'EFECTIVO', 4),
(140, 1, 2000, 4, 'EFECTIVO', 4),
(141, 1, 2000, 4, 'EFECTIVO', 4),
(142, 1, 2000, 4, 'EFECTIVO', 4),
(143, 1, 2000, 4, 'EFECTIVO', 5),
(144, 1, 12000, 4, 'EFECTIVO', 4),
(145, 1, 12000, 4, 'EFECTIVO', 5),
(146, 1, 12000, 4, 'EFECTIVO', 4),
(147, 1, 10000, 4, 'EFECTIVO', 4),
(148, 1, 10000, 4, 'EFECTIVO', 4),
(149, 1, 10000, 4, 'EFECTIVO', 4),
(150, 1, 10000, 4, 'EFECTIVO', 4),
(151, 1, 20000, 4, 'EFECTIVO', 4),
(152, 1, 20000, 4, 'EFECTIVO', 4),
(153, 1, 30000, 4, 'EFECTIVO', 4),
(154, 1, 20000, 4, 'EFECTIVO', 4),
(155, 1, 20000, 4, 'EFECTIVO', 4),
(156, 1, 20000, 4, 'EFECTIVO', 4),
(157, 1, 20000, 4, 'EFECTIVO', 4),
(158, 1, 20000, 4, 'EFECTIVO', 4),
(159, 1, 20000, 4, 'EFECTIVO', 4),
(160, 1, 20000, 4, 'EFECTIVO', 4),
(161, 1, 20000, 4, 'EFECTIVO', 4),
(162, 1, 20000, 4, 'EFECTIVO', 4),
(163, 1, 20000, 4, 'EFECTIVO', 4),
(164, 1, 20000, 4, 'EFECTIVO', 5),
(165, 1, 20000, 4, 'EFECTIVO', 6),
(167, 1, 20000, 4, 'EFECTIVO', 4),
(168, 1, 20000, 4, 'EFECTIVO', 5),
(169, 1, 6000, 4, 'EFECTIVO', 5),
(170, 1, 46000, 4, 'EFECTIVO', 5),
(171, 1, 46000, 4, 'EFECTIVO', 5),
(172, 1, 30000, 4, 'EFECTIVO', 5),
(173, 1, 60000, 4, 'EFECTIVO', 5),
(174, 1, 30000, 4, 'EFECTIVO', 5),
(175, 1, 30000, 4, 'EFECTIVO', 4),
(176, 1, 30000, 4, 'EFECTIVO', 4),
(177, 1, 30000, 4, 'EFECTIVO', 4),
(178, 1, 30000, 4, 'EFECTIVO', 4),
(179, 1, 60000, 4, 'EFECTIVO', 4),
(180, 1, 10000, 4, 'EFECTIVO', 4),
(181, 1, 10000, 4, 'EFECTIVO', 4),
(182, 1, 10000, 4, 'EFECTIVO', 4),
(183, 1, 2000, 4, 'EFECTIVO', 4),
(184, 1, 2000, 4, 'EFECTIVO', 4),
(185, 1, 1, 4, 'EFECTIVO', 4),
(186, 1, 1, 4, 'EFECTIVO', 4),
(187, 1, 1, 4, 'EFECTIVO', 4),
(188, 1, 1, 4, 'EFECTIVO', 4),
(189, 1, 1, 4, 'EFECTIVO', 4),
(190, 1, 1, 4, 'EFECTIVO', 4),
(191, 1, 1, 4, 'EFECTIVO', 4),
(192, 1, 2000, 4, 'EFECTIVO', 4),
(193, 1, 2000, 4, 'EFECTIVO', 4),
(194, 1, 2000, 4, 'EFECTIVO', 4),
(195, 1, 2000, 4, 'EFECTIVO', 4),
(196, 1, 2000, 4, 'EFECTIVO', 4),
(197, 1, 2998000, 4, 'EFECTIVO', 4),
(198, 1, 3000000, 4, 'EFECTIVO', 4),
(199, 1, 1, 4, 'EFECTIVO', 4),
(200, 1, 1, 4, 'EFECTIVO', 4),
(201, 1, 3000, 4, 'EFECTIVO', 4),
(202, 1, 3000, 4, 'EFECTIVO', 4),
(203, 1, 3000, 4, 'EFECTIVO', 4),
(204, 1, 3000, 4, 'EFECTIVO', 4),
(205, 1, 3000, 4, 'EFECTIVO', 4),
(206, 1, 3000, 4, 'EFECTIVO', 4),
(207, 1, 3000, 4, 'EFECTIVO', 4),
(208, 1, 3000, 4, 'EFECTIVO', 4),
(209, 1, 3000, 4, 'EFECTIVO', 4),
(210, 1, 3000, 4, 'EFECTIVO', 4),
(211, 1, 6000, 4, 'EFECTIVO', 4),
(212, 1, 6000, 4, 'EFECTIVO', 4),
(213, 1, 6000, 4, 'EFECTIVO', 4),
(214, 1, 6000, 4, 'EFECTIVO', 4),
(215, 1, 6000, 4, 'EFECTIVO', 4),
(216, 1, 6000, 4, 'EFECTIVO', 4),
(217, 1, 7000, 4, 'EFECTIVO', 4),
(218, 1, 7000, 4, 'EFECTIVO', 4),
(219, 1, 7000, 4, 'EFECTIVO', 4),
(220, 1, 7000, 4, 'EFECTIVO', 4),
(221, 1, 7000, 4, 'EFECTIVO', 4),
(222, 1, 8000, 4, 'EFECTIVO', 4),
(223, 1, 8000, -8000, 'EFECTIVO', 4),
(224, 1, 8000, -8000, 'EFECTIVO', 4),
(225, 1, 1, 2999999, 'EFECTIVO', 4),
(226, 1, 2999999, 1, 'EFECTIVO', 4),
(227, 1, 2999999, 1, 'EFECTIVO', 4),
(228, 1, 1, 2999999, 'EFECTIVO', 4),
(229, 1, 1, 2999999, 'EFECTIVO', 4),
(230, 1, 1, 2999999, 'EFECTIVO', 4),
(231, 1, 1, 2999999, 'EFECTIVO', 4),
(232, 1, 20000, 2980000, 'EFECTIVO', 4),
(233, 1, 20000, 2980000, 'EFECTIVO', 4),
(234, 1, 2980000, 20000, 'EFECTIVO', 4),
(235, 1, 2980000, 20000, 'EFECTIVO', 4),
(236, 1, 2980000, 20000, 'EFECTIVO', 4),
(237, 1, 2980000, 20000, 'EFECTIVO', 4),
(238, 1, 2980000, 20000, 'EFECTIVO', 4),
(239, 1, 2980000, 20000, 'EFECTIVO', 4),
(240, 1, 2980000, 20000, 'EFECTIVO', 4),
(241, 1, 2000, 2998000, 'EFECTIVO', 4),
(242, 1, 2000, 2996000, 'EFECTIVO', 4),
(243, 1, 4000, 2992000, 'EFECTIVO', 4),
(244, 1, 2992000, 0, 'EFECTIVO', 4),
(245, 1, 1, -1, 'EFECTIVO', 4),
(246, 1, 1, 299999, 'EFECTIVO', 5),
(247, 1, 29999, 270000, 'EFECTIVO', 5),
(248, 1, 2000, 268000, 'EFECTIVO', 5),
(249, 1, 8000, 260000, 'EFECTIVO', 5),
(250, 1, 260000, 0, 'EFECTIVO', 5),
(251, 1, 1, -1, 'EFECTIVO', 5),
(252, 1, 1, -2, 'EFECTIVO', 5),
(253, 1, 1, -3, 'EFECTIVO', 5),
(254, 1, 20000, 270000, 'EFECTIVO', 5),
(255, 1, 240000, 30000, 'EFECTIVO', 5),
(256, 1, 30000, 0, 'EFECTIVO', 5),
(257, 1, 30000, 20000, 'EFECTIVO', 4),
(258, 1, 30000, 2970000, 'EFECTIVO', 6),
(259, 1, 1000, 2969000, 'EFECTIVO', 6),
(260, 1, 2000, 18000, 'EFECTIVO', 4),
(261, 1, 2000, 18000, 'EFECTIVO', 4),
(262, 1, 2000, 198000, 'efectivo', 4),
(263, 2, 1200, 196800, 'efectivo', 4),
(264, 5, 20000, 230000, 'efectivo', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id_estacionamiento` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estacionamiento`
--

INSERT INTO `estacionamiento` (`id_estacionamiento`, `numero`, `libre`, `tipo`) VALUES
(1, 12, 1, 'Sombra'),
(2, 2, 0, ''),
(3, 1, 1, ''),
(4, 1, 0, ''),
(5, 1, 0, ''),
(6, 1, 1, ''),
(7, 1, 0, ''),
(8, 1, 1, ''),
(9, 25, 1, 'Sol'),
(10, 25, 0, 'Sol'),
(11, 25, 0, 'sombra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadia`
--

CREATE TABLE `estadia` (
  `Id_estadia` int(11) NOT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `idEstacionamiento` int(11) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `en_curso` tinyint(1) DEFAULT 0,
  `finalizo` tinyint(1) DEFAULT 0,
  `id_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadia`
--

INSERT INTO `estadia` (`Id_estadia`, `id_unidad`, `idEstacionamiento`, `fechaInicio`, `FechaFin`, `en_curso`, `finalizo`, `id_Cliente`) VALUES
(11, NULL, NULL, '0022-01-12', '4221-03-12', 0, 0, 1),
(55, 4, 3, '2023-11-18', '0000-00-00', 0, 1, 6),
(58, 9, 3, '2023-11-22', '2023-11-22', 0, 1, 1),
(59, 8, NULL, '2023-11-08', '2023-09-09', 0, 1, 6),
(60, 2, 5, '2023-11-08', '2023-11-09', 0, 1, 1),
(61, 11, 10, '2023-11-18', '2023-09-22', 0, 1, 1),
(63, 4, NULL, '2023-12-04', '2023-12-12', 1, 0, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `idEstadia` int(11) NOT NULL,
  `total` float NOT NULL,
  `precioXdia` float NOT NULL,
  `concepto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `idEstadia`, `total`, `precioXdia`, `concepto`) VALUES
(4, 55, 7, 3000, ''),
(5, 55, 0, 1200, ''),
(6, 55, 2969000, 1200, ''),
(7, 55, 2002, 1, ''),
(8, 55, 2002, 1, ''),
(9, 55, 2002, 1, ''),
(10, 55, 200000, 20000, ''),
(11, 55, 2002, 1, ''),
(12, 11, 250000, 1200, ''),
(13, 59, 230000, 1200, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes`
--

CREATE TABLE `integrantes` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `apellido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadsombra`
--

CREATE TABLE `unidadsombra` (
  `id_unidad` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadsombra`
--

INSERT INTO `unidadsombra` (`id_unidad`, `tipo`, `numero`, `libre`) VALUES
(1, 'SOMB', 0, 1),
(2, 'carpa', 2, 0),
(3, 'sombrilla', 3, 0),
(4, 'carpa', 4, 0),
(5, 'carpa', 5, 1),
(6, 'carpa', 5, 1),
(7, 'carpa', 5, 1),
(8, 'carpa', 5, 1),
(9, 'carpa', 1, 0),
(10, 'sombrilla', 5, 1),
(11, 'sombrilla', 5, 1),
(12, 'sombrilla', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_User` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_User`, `username`, `password`) VALUES
(2, 'jcambareri6', '$2y$10$hYzDk8cL0MzBb6xZ0SpKwuRs1oHnOsa4LUVSPgPWsGceX8IZtrNkW');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `idFacturaFK` (`id_Facturas`);

--
-- Indices de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD PRIMARY KEY (`id_estacionamiento`);

--
-- Indices de la tabla `estadia`
--
ALTER TABLE `estadia`
  ADD PRIMARY KEY (`Id_estadia`),
  ADD KEY `fk_idCliente` (`id_Cliente`),
  ADD KEY `fk_idUnidad` (`id_unidad`),
  ADD KEY `fk_IdEstacionamiento_estadia` (`idEstacionamiento`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFacturas`),
  ADD KEY `fk_idEstadia` (`idEstadia`);

--
-- Indices de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_User`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `id_estacionamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `estadia`
--
ALTER TABLE `estadia`
  MODIFY `Id_estadia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `idFacturaFK` FOREIGN KEY (`id_Facturas`) REFERENCES `facturas` (`idFacturas`);

--
-- Filtros para la tabla `estadia`
--
ALTER TABLE `estadia`
  ADD CONSTRAINT `fk_IdEstacionamiento_estadia` FOREIGN KEY (`idEstacionamiento`) REFERENCES `estacionamiento` (`id_estacionamiento`),
  ADD CONSTRAINT `fk_idCliente` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`),
  ADD CONSTRAINT `fk_idUnidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidadsombra` (`id_unidad`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_idEstadia` FOREIGN KEY (`idEstadia`) REFERENCES `estadia` (`Id_estadia`);

--
-- Filtros para la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD CONSTRAINT `fk_integrantes` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
