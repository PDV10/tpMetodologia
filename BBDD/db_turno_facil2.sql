-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2022 a las 16:08:55
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_turno_facil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `nombre`, `apellido`, `especialidad`, `user`, `pass`) VALUES
(1, 'Perez', 'Jackson', 'Anatomía Patológica', 'perez22', 'perez22'),
(2, 'Gallo', 'Jackson', 'Cirugía General', 'Gallo22', 'gallo22'),
(3, 'Smith', 'Liam', 'Cirugía General', 'smith1212', 'smith1212'),
(4, 'Jones', 'Lucas', 'Cirugía General', 'lucas343', 'lucas343'),
(5, 'Rodríguez', 'Fernando', 'Pediatra', 'fernando2321', 'fernando2321'),
(6, 'García', 'Matias', 'Gastronterologo', 'garcia123', 'garcia123'),
(7, 'Bilardo', 'Carlos Salvador', 'Medico Mundialista', 'mexico86', 'mexico86'),
(8, 'Pérez', 'Horacio', 'Obstetra', 'pagani21', 'pagani21'),
(9, 'Pagani', 'Camilo', 'Cirugía General', 'Camilo232', 'camilo232'),
(10, 'Martínez', 'Camila', 'Ginecologa', 'camila233', 'camila233'),
(11, 'Díaz', 'Fernanda', 'Cardiologia', 'diaz332', 'diaz332'),
(12, 'Romero', 'Lionel', 'Obstetra', 'Lionel2332', 'lionel2332'),
(13, 'Cogliatti', 'Tomas', 'Ginecologa', 'Tomas221', 'Tomas221'),
(14, 'Jones', 'Agustin', 'Pediatra', 'agustin656', 'agustin656');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_obra_social`
--

CREATE TABLE `medico_obra_social` (
  `id_medico` int(11) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `en_servicio` tinyint(1) NOT NULL,
  `tarifa` float(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico_obra_social`
--

INSERT INTO `medico_obra_social` (`id_medico`, `id_obra_social`, `en_servicio`, `tarifa`) VALUES
(1, 1, 1, 1000.00),
(2, 1, 1, 1000.00),
(2, 2, 1, 1000.00),
(3, 4, 1, 1300.00),
(3, 15, 1, 1000.00),
(4, 1, 1, 1000.00),
(5, 12, 1, 1500.00),
(6, 15, 1, 1000.00),
(7, 8, 1, 1000.00),
(7, 12, 1, 1500.00),
(8, 2, 1, 1000.00),
(8, 14, 1, 2000.00),
(9, 11, 1, 1500.00),
(9, 12, 1, 1000.00),
(10, 6, 1, 1000.00),
(11, 12, 1, 1000.00),
(12, 1, 1, 2000.00),
(13, 5, 1, 1000.00),
(14, 7, 1, 2000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_social`
--

CREATE TABLE `obra_social` (
  `id_obra_social` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `organizacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `obra_social`
--

INSERT INTO `obra_social` (`id_obra_social`, `nombre`, `tipo`, `organizacion`) VALUES
(1, 'Medife', 'privada', 'Unicef'),
(2, 'Ioma', 'estatal', 'Unicef'),
(3, 'Femeba', 'estatal', 'Jubilados'),
(4, 'Iosfa', 'estatal', 'Fuerzas Armadas'),
(5, 'Oschoca', 'estatal', 'Camioneros'),
(6, 'Osmedica', 'estatal', 'Medicos'),
(7, 'Galeno', 'Privada', 'GalenoConsulting'),
(8, 'Swiss Medical', 'privada', 'Swiss Medical Group'),
(9, 'Osfe', 'estatal', 'Ferroviarios'),
(10, 'Simeco', 'privada', 'Medicos'),
(11, 'Osseg', 'estatal', 'Seguros'),
(12, 'Osprera', 'estatal', 'Rural'),
(13, 'Ospm', 'estatal', 'Personal Maritimo'),
(14, 'Osplad', 'estatal', 'Docentes'),
(15, 'Osecac', 'estatal', 'Comercio'),
(16, 'Ospe', 'privada', 'Industria Petrolera'),
(17, 'Bancarios', 'estatal', 'Bancos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `nro_afiliado` int(11) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `id_obra_social`, `nro_afiliado`, `pass`) VALUES
(1, 'Pablo', 'Giménez', 'Savedra 2244', 223223, 'Pablogd@gmail.com', 1, 23234243, 'Giménez43424234'),
(2, 'Matias', 'Vázquez', 'Urquiza 5432', 228423232, 'Vázquez@gmail.com', 4, 21324124, 'Vázquez34353'),
(3, 'Ramon', 'Garcia', 'Balcarce 2321', 228423212, 'Garcia2321@gmail.com', 8, 6363636, 'Garcia6363636'),
(4, 'Carlos', 'Perez', 'Aramburu 2433 ', 2284343, 'Perezksdj@gmail.com', 15, 4321213, 'Perez4321213'),
(5, 'Mario', 'Giacomasso', 'Peña 4369', 228437485, 'Marioooo@hotmail.com', 15, 321323, 'Giacomasso321323'),
(6, 'Marcos', 'Arzamendia', 'Azopardo 2232', 228422422, 'mAdds@gmial.com', 4, 412131, 'Arzamendia412131'),
(7, 'Alejandro ', 'Perera', 'Colon 2321', 32423423, 'perera@gmail.com', 17, 3223131, 'Perera3223131'),
(8, 'Federico', 'Storm', 'Necochea 5323', 53233242, 'Federico231@hotmail.com', 14, 23124, 'Federico2321'),
(9, 'Josefina', 'Vazques', 'Junin 2341', 2322786, 'jos231@hotmail.com', 16, 35431, '232278621Junin '),
(10, 'Alberto ', 'Dougblas ', 'Rivadavia 3000 ', 22835422, 'Dougblas@yahoo.com', 15, 0, 'Dougblas12312 '),
(11, 'Micaela', 'Gutiérrez', 'Alsina 3340', 22849878, '21Mica@gmail.com', 7, 432423423, 'Mica432423423'),
(12, 'Guadalupe', 'Pereyra', 'Alsina 2323', 228424521, 'pereyra@gmail.com', 13, 0, 'Pereyra2312412'),
(13, 'Martina', 'Perez', 'Buchardo 762', 228498321, 'Martina2@gmail.com', 14, 847328, 'Buchardo12324'),
(14, 'Marcos', 'Rojo', 'Moron 3400', 2284567, 'MarcosRojo@yahoo.com', 6, 464345, 'Marcos464345'),
(15, 'Lionel Andres', 'Messi', 'Ciufatelli 2145', 21451245, 'lioElmejorDelmundo@gmail.com', 13, 1111111111, 'mejorquetodos10qatar2022'),
(16, 'Santiago', 'Reyes', 'Cerrito 4222', 228472662, 'santtirelcrack@gmail.com', 6, 0, 'santi20r3r'),
(17, 'Diego Armando', 'Maradona', 'Azopardo 762', 22224, 'Maradonaeldiegote@gmail.com', 15, 0, 'Maradonaeldiegote10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `tipo_turno` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `id_medico`, `id_paciente`, `dia`, `hora`, `tipo_turno`) VALUES
(72, 1, 3, '2022-12-14', '12:15:00', 'm'),
(73, 1, 4, '2023-03-09', '10:40:00', 'm'),
(74, 2, 1, '2023-02-16', '12:20:00', 'm'),
(75, 2, 17, '2023-03-09', '18:20:00', 't'),
(76, 1, 11, '2022-12-15', '18:20:00', 't'),
(77, 2, 12, '2022-11-24', '18:20:00', ''),
(78, 1, 13, '2023-01-26', '18:20:00', 't'),
(79, 2, 14, '2023-04-13', '17:40:00', 't'),
(80, 1, 15, '2023-01-27', '08:20:00', 'm'),
(81, 1, 2, '2023-03-16', '12:20:00', 'm'),
(82, 2, 3, '2022-12-28', '18:00:00', 't'),
(83, 1, 4, '2023-01-25', '09:00:00', 'm'),
(84, 1, 5, '2023-02-17', '09:00:00', 'm'),
(85, 2, 6, '2023-04-21', '18:00:00', 't');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD PRIMARY KEY (`id_medico`,`id_obra_social`),
  ADD KEY `FK_MEDICO_TURNO_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  ADD PRIMARY KEY (`id_obra_social`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `FK_PACIENTE_OBRA_SOCIAL` (`id_obra_social`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`,`id_medico`,`id_paciente`),
  ADD KEY `FK_TURNO_MEDICO` (`id_medico`),
  ADD KEY `FK_TURNO_PACIENTE` (`id_paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  MODIFY `id_obra_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD CONSTRAINT `FK_MEDICO_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `FK_MEDICO_TURNO_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FK_PACIENTE_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `FK_TURNO_PACIENTE` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
