-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 26-11-2020 a las 01:44:54
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rego2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depuracion_c`
--

DROP TABLE IF EXISTS `depuracion_c`;
CREATE TABLE IF NOT EXISTS `depuracion_c` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `depuracion` varchar(90) NOT NULL,
  `vt_orina` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `cod_compra` int(11) NOT NULL AUTO_INCREMENT,
  `cod_reactivo` int(11) NOT NULL,
  `cod_proveedor` int(11) NOT NULL,
  `marca` varchar(90) NOT NULL,
  `f_v` date NOT NULL,
  `volumen` decimal(10,0) NOT NULL,
  `precio_compra` decimal(10,0) NOT NULL,
  `observaciones` varchar(100) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_compra`),
  KEY `cod_reactivo` (`cod_reactivo`),
  KEY `cod_proveedor` (`cod_proveedor`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`cod_compra`, `cod_reactivo`, `cod_proveedor`, `marca`, `f_v`, `volumen`, `precio_compra`, `observaciones`, `usuario`, `fecha_ingreso`) VALUES
(8, 24, 2, 'WINNER', '0000-00-00', '10', '700000', 's/obs', 1, '2020-07-04 05:32:45'),
(9, 24, 2, 'WINNER', '0000-00-00', '10', '700000', 's/obs', 1, '2020-07-04 05:36:41'),
(10, 24, 2, 'WINNER', '0000-00-00', '10', '700000', 's/obs', 1, '2020-07-04 05:37:47'),
(11, 24, 2, 'WINNER', '0000-00-00', '10', '700000', 's/obs', 1, '2020-07-04 05:38:33'),
(12, 24, 2, 'WINNER', '0000-00-00', '10', '700000', 's/obs', 1, '2020-07-04 05:40:59'),
(13, 1, 1, 'WINNER', '2021-06-06', '1000', '700000', '', 1, '2020-07-06 08:29:48'),
(14, 5, 1, 'winner', '2020-10-10', '50', '300', 'nada', 1, '2020-10-10 19:33:27'),
(15, 5, 1, 'winner', '2020-10-10', '500', '300', 'nada', 1, '2020-10-10 19:39:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `nro_factura` int(11) NOT NULL,
  `cod_examen` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `nro_factura` (`nro_factura`),
  KEY `cod_examen` (`cod_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`correlativo`, `nro_factura`, `cod_examen`, `precio`) VALUES
(1, 130, 19, '4620000.00'),
(2, 131, 1, '700000.00'),
(3, 131, 2, '540000.00'),
(4, 132, 4, '200000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
CREATE TABLE IF NOT EXISTS `detalle_orden` (
  `cod_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `cod_examen` int(11) NOT NULL,
  PRIMARY KEY (`cod_detalle`),
  KEY `cod_orden` (`cod_orden`),
  KEY `cod_examen` (`cod_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalle_orden`
--

INSERT INTO `detalle_orden` (`cod_detalle`, `cod_orden`, `cod_examen`) VALUES
(21, 120, 1),
(22, 120, 20),
(23, 119, 19),
(26, 122, 1),
(46, 126, 21),
(60, 134, 19),
(61, 135, 1),
(62, 135, 2),
(63, 136, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

DROP TABLE IF EXISTS `examen`;
CREATE TABLE IF NOT EXISTS `examen` (
  `cod_examen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `type` enum('1','2','','') NOT NULL,
  PRIMARY KEY (`cod_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`cod_examen`, `nombre`, `precio`, `type`) VALUES
(1, 'Hematología', '700000.00', '1'),
(2, 'Orina', '540000.00', '1'),
(3, 'Heces', '500000.00', '1'),
(4, 'VDRL', '200000.00', '1'),
(5, 'HIV', '300000.00', '1'),
(6, 'Exudado Faringeo', '200000.00', '1'),
(7, 'Prueba de embarazo', '300000.00', '1'),
(8, 'Relación Calcio/Ácido úrico/Creatinina', '200000.00', '1'),
(9, 'Depuración Creatinina', '200000.00', '1'),
(10, 'Ra Test', '200000.00', '1'),
(11, 'Glicemia', '180000.00', '1'),
(12, 'Urea', '180000.00', '1'),
(13, 'Creatinina', '180000.00', '1'),
(14, 'Colesterol', '200000.00', '1'),
(15, 'Trigliceridos', '300000.00', '1'),
(16, 'Ácido úrico', '200000.00', '1'),
(17, 'Calcio', '200000.00', '1'),
(18, 'HDL', '200000.00', '1'),
(19, 'Perfil 20', '4620000.00', '2'),
(20, 'Perfil Lipídico', '1925000.00', '2'),
(21, 'Perfil Pre-Operatorio', '5005000.00', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `nro_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_paciente` int(11) NOT NULL,
  `cod_orden` int(90) NOT NULL,
  `total_factura` decimal(10,0) NOT NULL,
  `status` enum('1','2','','') NOT NULL,
  PRIMARY KEY (`nro_factura`),
  KEY `cod_paciente` (`cod_paciente`),
  KEY `cod_orden` (`cod_orden`),
  KEY `cod_orden_2` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`nro_factura`, `fecha`, `cod_paciente`, `cod_orden`, `total_factura`, `status`) VALUES
(130, '2020-11-25 08:13:48', 120, 134, '4620000', '1'),
(131, '2020-11-25 08:14:07', 121, 135, '1240000', '1'),
(132, '2020-11-25 08:14:27', 123, 136, '200000', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
CREATE TABLE IF NOT EXISTS `forma_pago` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `nro_factura` int(20) NOT NULL,
  `efectivo` varchar(90) NOT NULL,
  `tarjeta` varchar(90) NOT NULL,
  `pago_movil` int(11) NOT NULL,
  `transferencia` int(11) NOT NULL,
  `exonerado` int(11) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `nro_factura` (`nro_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `heces`
--

DROP TABLE IF EXISTS `heces`;
CREATE TABLE IF NOT EXISTS `heces` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `aspecto` varchar(90) NOT NULL,
  `color` varchar(90) NOT NULL,
  `olor` varchar(90) NOT NULL,
  `consistencia` varchar(90) NOT NULL,
  `reaccion` varchar(90) NOT NULL,
  `moco` varchar(90) NOT NULL,
  `sangre` varchar(90) NOT NULL,
  `azucares_reductores` varchar(90) NOT NULL,
  `sangre_oculta` varchar(90) NOT NULL,
  `ex_microscopico` text NOT NULL,
  `metodos` enum('solucion salina kato','solucion salina lugol','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hematologia`
--

DROP TABLE IF EXISTS `hematologia`;
CREATE TABLE IF NOT EXISTS `hematologia` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `hemoglobina` varchar(90) NOT NULL,
  `hematocritos` varchar(90) NOT NULL,
  `chcm` varchar(90) NOT NULL,
  `leucocitos` varchar(90) NOT NULL,
  `reticulocitos` varchar(90) NOT NULL,
  `plaquetas` varchar(90) NOT NULL,
  `vsg` varchar(90) NOT NULL,
  `grupo_s` varchar(90) NOT NULL,
  `factor_rh` varchar(90) NOT NULL,
  `tiempo_sangria` varchar(90) NOT NULL,
  `tiempo_coagulacion` varchar(90) NOT NULL,
  `anisocitosis` varchar(90) NOT NULL,
  `microcitos` varchar(90) NOT NULL,
  `poiquilocitosis` varchar(90) NOT NULL,
  `hipocromia` varchar(90) NOT NULL,
  `seg_neutrofilo` varchar(90) NOT NULL,
  `linfocitos` varchar(90) NOT NULL,
  `eosinofilos` varchar(90) NOT NULL,
  `basofilos` varchar(90) NOT NULL,
  `monocitos` varchar(90) NOT NULL,
  `cayados` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_reactivo`
--

DROP TABLE IF EXISTS `inv_reactivo`;
CREATE TABLE IF NOT EXISTS `inv_reactivo` (
  `cod_inv` int(11) NOT NULL AUTO_INCREMENT,
  `cod_reactivo` int(11) NOT NULL,
  `vol_actual` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cod_inv`),
  KEY `cod_reactivo` (`cod_reactivo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inv_reactivo`
--

INSERT INTO `inv_reactivo` (`cod_inv`, `cod_reactivo`, `vol_actual`) VALUES
(1, 5, '411.50'),
(2, 2, '485.60'),
(4, 6, '856.00'),
(5, 4, '981.00'),
(6, 8, '222.50'),
(7, 7, '494.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelaneos`
--

DROP TABLE IF EXISTS `miscelaneos`;
CREATE TABLE IF NOT EXISTS `miscelaneos` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `muestra` varchar(90) NOT NULL,
  `examen` enum('vdrl','hiv','exudado faringeo','prueba de embarazo','ra test') NOT NULL,
  `resultado` text NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE IF NOT EXISTS `orden` (
  `cod_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `fecha_orden` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imp_diag` varchar(90) NOT NULL,
  `nro_factura` int(11) DEFAULT NULL,
  `req_fact` enum('Si','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sintomas` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`cod_orden`),
  KEY `id_paciente` (`id_paciente`),
  KEY `nro_factura` (`nro_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`cod_orden`, `id_paciente`, `fecha_orden`, `imp_diag`, `nro_factura`, `req_fact`, `sintomas`) VALUES
(119, 142, '2020-11-20 05:17:56', 'naaa', NULL, 'No', 'fooooo'),
(120, 121, '2020-11-20 05:40:50', '', NULL, 'No', ''),
(122, 121, '2020-11-21 22:31:28', '', NULL, 'No', ''),
(126, 122, '2020-11-21 22:56:54', '', NULL, 'No', ''),
(134, 120, '2020-11-25 08:13:48', '', 130, 'Si', ''),
(135, 121, '2020-11-25 08:14:07', '', 131, 'Si', ''),
(136, 123, '2020-11-25 08:14:27', '', 132, 'Si', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orina`
--

DROP TABLE IF EXISTS `orina`;
CREATE TABLE IF NOT EXISTS `orina` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `aspecto` varchar(11) NOT NULL,
  `reaccion` varchar(11) NOT NULL,
  `color` varchar(90) NOT NULL,
  `olor` varchar(90) NOT NULL,
  `densidad` int(11) NOT NULL,
  `ph` varchar(90) NOT NULL,
  `proteinas` varchar(90) NOT NULL,
  `glucosa` varchar(90) NOT NULL,
  `cetona` varchar(90) NOT NULL,
  `bilirrubina` varchar(90) NOT NULL,
  `urobilinogeno` varchar(90) NOT NULL,
  `hemoglobina` varchar(90) NOT NULL,
  `nitrito` varchar(90) NOT NULL,
  `pig_biliares` varchar(90) NOT NULL,
  `leucocitos` varchar(90) NOT NULL,
  `hematies` varchar(90) NOT NULL,
  `celulas_e` varchar(90) NOT NULL,
  `piocitos` varchar(90) NOT NULL,
  `bacterias` varchar(90) NOT NULL,
  `cristales` varchar(90) NOT NULL,
  `mucina` varchar(90) NOT NULL,
  `otros_elementos` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `edad` int(2) NOT NULL,
  `ci` varchar(11) NOT NULL,
  `tlf` varchar(90) NOT NULL,
  `direccion` varchar(90) NOT NULL,
  `usuario` int(20) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `edad`, `ci`, `tlf`, `direccion`, `usuario`) VALUES
(120, 'Tahiris Requena', 54, '8943397', '0414-9583567', 'San mateo - aragua', 1),
(121, 'Isis Tovar', 21, '26834873', '0426-1378597', 'San mateo', 1),
(122, 'Elaine Galindez', 20, '27865312', '', 'Consejo - La victoria', 1),
(123, 'Jineth Requena', 48, '9695719', '0414-3449251', 'Maracay', 1),
(142, 'Alguien en la', 21, '666777', '0412000000', 'maracay', 1),
(143, 'Edgar Tovar', 58, '8524180', '04124540343', 'san mateo', 1),
(144, 'Yusmila Requena', 48, '9948948', '04243384048', 'maracay', 1),
(145, '', 0, '', '', '', 1),
(146, 'Alguien en la', 66, '969571', '0412000000', 'maracay', 1),
(147, 'Keyna Perez', 28, '21238300', '04244615158', 'guacara, el saman', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_orden`
--

DROP TABLE IF EXISTS `pago_orden`;
CREATE TABLE IF NOT EXISTS `pago_orden` (
  `correlativo` int(90) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(90) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pago_orden`
--

INSERT INTO `pago_orden` (`correlativo`, `cod_orden`, `monto_total`) VALUES
(10, 119, '4620000.00'),
(11, 120, '2625000.00'),
(13, 122, '700000.00'),
(17, 126, '5005000.00'),
(25, 134, '4620000.00'),
(26, 135, '1240000.00'),
(27, 136, '200000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `cod_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_prov` varchar(90) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `rif` varchar(90) NOT NULL,
  `correo_prov` varchar(90) NOT NULL,
  `fax` varchar(90) NOT NULL,
  `tlf_prov` varchar(30) NOT NULL,
  `direccion_prov` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`cod_proveedor`, `nombre_prov`, `razon_social`, `rif`, `correo_prov`, `fax`, `tlf_prov`, `direccion_prov`) VALUES
(1, 'Sr. Rafael', 'Inter Medical del Centro.CA.', 'J-40238596-0', 'distintermedical@gmail.com', '', '0414-1491834', 'Centro profesional aragua Piso 1, Of. 111, urb. la arboleda Maracay'),
(2, 'Sra. Mercedes', 'Distribuidora Ir del centro, C.A.', 'J-56435786-0', 'irdelcentro@gmail.com', '', '0416-3120509', 'centro, maracay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quimica`
--

DROP TABLE IF EXISTS `quimica`;
CREATE TABLE IF NOT EXISTS `quimica` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `glicemia` varchar(90) NOT NULL,
  `urea` varchar(90) NOT NULL,
  `creatinina` varchar(90) NOT NULL,
  `colesterol` varchar(90) NOT NULL,
  `trigliceridos` varchar(90) NOT NULL,
  `acido_u` varchar(90) NOT NULL,
  `calcio` varchar(90) NOT NULL,
  `hdl` decimal(11,1) NOT NULL,
  `ldl` decimal(11,1) NOT NULL,
  `vldl` decimal(11,1) NOT NULL,
  `observaciones` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reactivo`
--

DROP TABLE IF EXISTS `reactivo`;
CREATE TABLE IF NOT EXISTS `reactivo` (
  `cod_reactivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `stockmin` decimal(11,0) NOT NULL,
  `stockmax` decimal(11,0) NOT NULL,
  `und_medida` enum('volumen','unidad','','') NOT NULL,
  PRIMARY KEY (`cod_reactivo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reactivo`
--

INSERT INTO `reactivo` (`cod_reactivo`, `nombre`, `stockmin`, `stockmax`, `und_medida`) VALUES
(1, 'Ácido Sulfosalicílico', '500', '2000', 'volumen'),
(2, 'Oxalato de Amonio', '500', '2000', 'volumen'),
(3, 'Líquido de Turk', '500', '2000', 'volumen'),
(4, 'Metanol', '500', '2000', 'volumen'),
(5, 'Cianometa de Hemoglobina', '500', '2000', 'volumen'),
(6, 'Colorante de Gienza', '500', '2000', 'volumen'),
(7, 'Azul de Metileno', '500', '2000', 'volumen'),
(8, 'Benedic', '500', '2000', 'volumen'),
(9, 'Solución salina', '250', '500', 'volumen'),
(10, 'Solución lugol', '500', '2000', 'volumen'),
(11, 'Solución Kato', '100', '250', 'volumen'),
(12, 'Violeta de Gensiana', '500', '2000', 'volumen'),
(13, 'Safranina', '500', '2000', 'volumen'),
(14, 'Glicemia', '30', '100', 'volumen'),
(15, 'Urea', '30', '100', 'volumen'),
(16, 'Colesterol', '30', '100', 'volumen'),
(17, 'Trigliceridos', '30', '100', 'volumen'),
(18, 'Creatinina', '30', '100', 'volumen'),
(19, 'Ácido úrico', '30', '100', 'volumen'),
(20, 'HDL', '30', '100', 'volumen'),
(21, 'Ra Test', '20', '100', 'unidad'),
(22, 'VDRL', '50', '300', 'unidad'),
(23, 'HIV', '20', '50', 'unidad'),
(24, 'Prueba de Embarazo', '6', '20', 'unidad'),
(25, 'Microhematocrito', '100', '500', 'unidad'),
(26, 'Calcio', '30', '100', 'volumen'),
(28, 'Factor RH', '30', '100', 'volumen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_cac`
--

DROP TABLE IF EXISTS `relacion_cac`;
CREATE TABLE IF NOT EXISTS `relacion_cac` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_orden` int(11) NOT NULL,
  `calcio_creatinina` varchar(90) NOT NULL,
  `calcio_orina` varchar(90) NOT NULL,
  `creatinina_orina` varchar(90) NOT NULL,
  `acidou_orina` varchar(90) NOT NULL,
  `acidou_creatinina` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_orden` (`cod_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(4) NOT NULL AUTO_INCREMENT,
  `rol` varchar(90) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `correo` varchar(90) NOT NULL,
  `usuario` varchar(90) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `rol` int(4) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `usuario`, `clave`, `rol`) VALUES
(1, 'Lic. Tahiris', 'tahirisjr@gmail.com', 'RegoLS', '1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `val_normales`
--

DROP TABLE IF EXISTS `val_normales`;
CREATE TABLE IF NOT EXISTS `val_normales` (
  `correlativo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_examen` int(11) NOT NULL,
  `val_normal` varchar(90) NOT NULL,
  PRIMARY KEY (`correlativo`),
  KEY `cod_examen` (`cod_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `val_normales`
--

INSERT INTO `val_normales` (`correlativo`, `cod_examen`, `val_normal`) VALUES
(1, 11, '70-110'),
(2, 12, '7-18'),
(3, 13, '0,6-1,4'),
(4, 14, '120-200'),
(5, 15, '36-165'),
(6, 16, '2,8-7,5'),
(7, 18, '33-75');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `depuracion_c`
--
ALTER TABLE `depuracion_c`
  ADD CONSTRAINT `depuracion_c_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compra_ibfk_3` FOREIGN KEY (`cod_reactivo`) REFERENCES `reactivo` (`cod_reactivo`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`cod_examen`) REFERENCES `examen` (`cod_examen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`nro_factura`) REFERENCES `factura` (`nro_factura`);

--
-- Filtros para la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`cod_examen`) REFERENCES `examen` (`cod_examen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cod_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD CONSTRAINT `forma_pago_ibfk_1` FOREIGN KEY (`nro_factura`) REFERENCES `factura` (`nro_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `heces`
--
ALTER TABLE `heces`
  ADD CONSTRAINT `heces_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hematologia`
--
ALTER TABLE `hematologia`
  ADD CONSTRAINT `hematologia_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inv_reactivo`
--
ALTER TABLE `inv_reactivo`
  ADD CONSTRAINT `inv_reactivo_ibfk_1` FOREIGN KEY (`cod_reactivo`) REFERENCES `reactivo` (`cod_reactivo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
  ADD CONSTRAINT `miscelaneos_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`nro_factura`) REFERENCES `factura` (`nro_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orina`
--
ALTER TABLE `orina`
  ADD CONSTRAINT `orina_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago_orden`
--
ALTER TABLE `pago_orden`
  ADD CONSTRAINT `pago_orden_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `quimica`
--
ALTER TABLE `quimica`
  ADD CONSTRAINT `quimica_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relacion_cac`
--
ALTER TABLE `relacion_cac`
  ADD CONSTRAINT `relacion_cac_ibfk_1` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `val_normales`
--
ALTER TABLE `val_normales`
  ADD CONSTRAINT `val_normales_ibfk_1` FOREIGN KEY (`cod_examen`) REFERENCES `examen` (`cod_examen`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
