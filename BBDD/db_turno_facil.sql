-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2022 a las 21:06:27
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.15

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
  `id_usuario` int(11) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `secretaria` int(11) DEFAULT NULL,
  `imagen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_usuario`, `especialidad`, `secretaria`, `imagen`) VALUES
(1, 'Anatomía Patológica', 16, ''),
(2, 'Cirugía General', 17, ''),
(3, 'Crugía General', 18, ''),
(4, 'Cirugía General', 16, ''),
(5, 'Pediatra', 17, ''),
(6, 'Gastronterologo', 18, ''),
(7, 'Medico Mundialista', 16, 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Narig%C3%B3n_Bilardo_1986.jpg'),
(8, 'Obstetra', 17, ''),
(9, 'Cirugía General', 18, ''),
(10, 'Ginecologa', 16, ''),
(11, 'Cardiologia', 17, ''),
(12, 'Obstetra', 18, ''),
(13, 'Ginecologa', 16, ''),
(14, 'Pediatra', 17, '');

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

INSERT INTO `medico` (`id_usuario`, `especialidad`, `secretaria`, `imagen`)
 VALUES ('1', 'Anatomía Patológica', '16', 'https://pregna.com.ar/wp-content/uploads/cache/images/De-Zuniga-Ignacio-v2/De-Zuniga-Ignacio-v2-351193826.jpg'), 
 ('2', 'Cirugía General', '17', 'https://www.nacionrex.com/__export/1612055482391/sites/debate/img/2021/01/30/dramas-coreanos-de-doctores-sinopsis-recomendacion_crop1612052223301.jpg_423682103.jpg'), 
 ('3', 'Crugía General', '18', 'https://img.freepik.com/foto-gratis/doctor-sonriendo-ofreciendo-mano_23-2148075683.jpg?w=2000 '), ('4', 'Cirugía General', '16', 'https://img.freepik.com/foto-gratis/hermosa-joven-doctora-mirando-camara-oficina_1301-7807.jpg?w=2000'), ('5', 'Pediatra', '17', 'https://img.freepik.com/foto-gratis/retrato-medico-varon-mirando-camara-aislada-sobre-fondo-blanco_1157-52206.jpg?w=2000'), ('6', 'Gastronterologo', '18', 'https://www.derechoenzapatillas.com/wp-content/uploads/2017/05/what-doctors-say2.jpg'), ('7', 'Medico Mundialista', '16', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Narig%C3%B3n_Bilardo_1986.jpg'), ('8', 'Obstetra', '17', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStc9LchMju9tRfUMJ0pEFsIqCCcS2qUz0ROQ&usqp=CAU'), ('9', 'Cirugía General', '18', 'https://www.shutterstock.com/image-photo/young-man-doctor-medical-concept-260nw-1893728287.jpg'), ('10', 'Ginecologa', '16', 'https://media.istockphoto.com/id/1342134434/es/foto/el-m%C3%A9dico-atento-escucha-al-paciente.jpg?s=612x612&w=0&k=20&c=67ZMg9XctQ7ZtNWGfa6p975nhHAn8djUSZ2TESAJpTg='), ('11', 'Cardiologia', '17', 'https://img.freepik.com/foto-gratis/doctora-vistiendo-bata-laboratorio-estetoscopio-aislado_1303-29791.jpg?w=2000'), ('12', 'Obstetra', '18', 'https://img.freepik.com/fotos-premium/retrato-atractivo-medico-arabe_21730-4085.jpg?w=2000'), ('13', 'Ginecologo', '16', 'https://img.freepik.com/foto-gratis/doctor-brazos-cruzados-sobre-fondo-blanco_1368-5790.jpg?w=2000'), ('14', 'Pediatra', '17', 'https://img.freepik.com/fotos-premium/doctor-escribiendo-receta_249974-119.jpg')

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
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id_usuario`) VALUES
(16),
(17),
(18);

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
(78, 1, 13, '2023-01-26', '18:20:00', 't'),
(79, 2, 14, '2023-04-13', '17:40:00', 't'),
(80, 1, 15, '2023-01-27', '08:20:00', 'm'),
(81, 1, 2, '2023-03-16', '12:20:00', 'm'),
(82, 2, 3, '2022-12-28', '18:00:00', 't'),
(83, 1, 4, '2023-01-25', '09:00:00', 'm'),
(84, 1, 5, '2023-02-17', '09:00:00', 'm'),
(85, 2, 6, '2023-04-21', '18:00:00', 't'),
(86, 3, 3, '2022-12-14', '12:15:00', 'm'),
(87, 3, 4, '2023-03-09', '10:40:00', 'm'),
(88, 3, 1, '2023-02-16', '12:20:00', 'm'),
(89, 3, 17, '2023-03-09', '18:20:00', 't'),
(90, 4, 17, '2023-03-09', '12:15:00', 't'),
(91, 4, 11, '2022-12-15', '10:40:00', 't'),
(92, 4, 12, '2022-11-24', '13:20:00', ''),
(93, 5, 13, '2023-01-26', '18:20:00', 't'),
(94, 5, 14, '2023-04-13', '17:40:00', 't'),
(95, 5, 15, '2023-01-27', '08:20:00', 'm'),
(96, 6, 2, '2023-03-16', '12:20:00', 'm'),
(97, 6, 3, '2022-12-28', '18:00:00', 't'),
(98, 6, 4, '2023-01-25', '09:00:00', 'm'),
(99, 7, 3, '2022-12-14', '12:15:00', 'm'),
(100, 7, 4, '2023-03-09', '10:40:00', 'm'),
(101, 7, 1, '2023-02-16', '12:20:00', 'm'),
(102, 8, 17, '2023-03-09', '18:20:00', 't'),
(103, 8, 11, '2022-12-15', '12:15:00', 't'),
(104, 8, 12, '2022-11-24', '10:40:00', ''),
(105, 9, 13, '2023-01-26', '18:20:00', 't'),
(106, 9, 14, '2023-04-13', '17:40:00', 't'),
(107, 9, 15, '2023-01-27', '08:20:00', 'm'),
(108, 10, 2, '2023-03-16', '12:20:00', 'm'),
(109, 10, 3, '2022-12-28', '18:00:00', 't'),
(110, 10, 4, '2023-01-25', '09:00:00', 'm'),
(111, 11, 3, '2022-12-14', '12:15:00', 'm'),
(112, 11, 4, '2023-03-09', '10:40:00', 'm'),
(113, 11, 1, '2023-02-16', '12:20:00', 'm'),
(114, 12, 17, '2023-03-09', '18:20:00', 't'),
(115, 12, 11, '2022-12-15', '12:15:00', 't'),
(116, 12, 12, '2022-11-24', '10:40:00', ''),
(117, 13, 13, '2023-01-26', '18:20:00', 't'),
(118, 13, 14, '2023-04-13', '17:40:00', 't'),
(119, 13, 15, '2023-01-27', '08:20:00', 'm'),
(120, 14, 2, '2023-03-16', '12:20:00', 'm'),
(121, 14, 3, '2022-12-28', '18:00:00', 't'),
(122, 14, 4, '2023-01-25', '09:00:00', 'm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` char(1) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `apellido`, `nombre`, `tipo`, `user`, `pass`) VALUES
(1, 'Perez', 'Jackson', 'M', 'perez22', 'perez22'),
(2, 'Gallo', 'Jackson', 'M', 'Gallo22', 'gallo22'),
(3, 'Smith', 'Liam', 'M', 'smith1212', 'smith1212'),
(4, 'Jones', 'Lucas', 'M', 'lucas343', 'lucas343'),
(5, 'Rodríguez', 'Fernando', 'M', 'fernando2321', 'fernando2321'),
(6, 'García', 'Matias', 'M', 'garcia123', 'garcia123'),
(7, 'Bilardo', 'Carlos Salvador', 'M', 'mexico86', 'mexico86'),
(8, 'Pérez', 'Horacio', 'M', 'pagani21', 'pagani21'),
(9, 'Pagani', 'Camilo', 'M', 'Camilo232', 'camilo232'),
(10, 'Martínez', 'Camila', 'M', 'camila233', 'camila233'),
(11, 'Díaz', 'Fernanda', 'M', 'diaz332', 'diaz332'),
(12, 'Romero', 'Lionel', 'M', 'Lionel2332', 'lionel2332'),
(13, 'Cogliatti', 'Tomas', 'M', 'Tomas221', 'Tomas221'),
(14, 'Jones', 'Agustin', 'M', 'agustin656', 'agustin656'),
(16, 'Callejon', 'Fernanda', 'S', 'fer123', 'fer123'),
(17, 'Suller', 'Silvia', 'S', 'lasilvi69', 'lasilvi69'),
(18, 'Camaño', 'Graciela', 'S', 'grace4455', 'grace4455');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_USUARIO_MEDICO` (`id_usuario`),
  ADD KEY `FK_SECRETARIA` (`secretaria`);

--
-- Indices de la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD PRIMARY KEY (`id_medico`,`id_obra_social`),
  ADD KEY `FK_MEDICO_TURNO_OBRA_SOCIAL` (`id_obra_social`),
  ADD KEY `FK_MEDICO_TURNO_MEDICO` (`id_medico`);

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
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_USUARIO` (`id_usuario`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`,`id_medico`,`id_paciente`),
  ADD KEY `FK_TURNO_PACIENTE` (`id_paciente`),
  ADD KEY `FK_TURNO_MEDICO` (`id_medico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_SECRETARIA` FOREIGN KEY (`secretaria`) REFERENCES `secretaria` (`id_usuario`),
  ADD CONSTRAINT `FK_USUARIO_MEDICO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD CONSTRAINT `FK_MEDICO_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_usuario`),
  ADD CONSTRAINT `FK_MEDICO_TURNO_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FK_PACIENTE_OBRA_SOCIAL` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Filtros para la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_usuario`),
  ADD CONSTRAINT `FK_TURNO_PACIENTE` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
