
-- Creando tabla secretaria hija de tabla usuario
CREATE TABLE `secretaria` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_USUARIO` (`id_usuario`);
 
 ALTER TABLE `secretaria`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

  -- Creando tabla medico hija de tabla usuario
CREATE TABLE `medico` (
  `id_usuario` int(11) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `secretaria` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_USUARIO_MEDICO` (`id_usuario`),
  ADD KEY `FK_SECRETARIA` (`secretaria`);
 
 ALTER TABLE `medico`
  ADD CONSTRAINT `FK_USUARIO_MEDICO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `FK_SECRETARIA` FOREIGN KEY (`secretaria`) REFERENCES `secretaria` (`id_usuario`);

-- MOdificar FK de id_medico en MEDICO_OBRA_SOCIAL
ALTER TABLE medico_obra_social DROP CONSTRAINT `FK_MEDICO_TURNO_MEDICO`;
ALTER TABLE `medico_obra_social`
    ADD KEY `FK_MEDICO_TURNO_MEDICO` (`id_medico`);
    ADD CONSTRAINT `FK_MEDICO_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_usuario`);

-- Modificar FK de id_medico en TURNO
ALTER TABLE `turno` DROP CONSTRAINT `FK_TURNO_MEDICO`;
ALTER TABLE `turno`
    ADD KEY `FK_TURNO_MEDICO` (`id_medico`);
    ADD CONSTRAINT `FK_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_usuario`);

ALTER TABLE `turno`
DROP CONSTRAINT `FK_TURNO_MEDICO`;
ALTER TABLE `turno`
ADD CONSTRAINT `FK_TURNO_MEDICO` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_usuario`);

-- volcado de datos de Secretarias en tabla USUARIO
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `tipo`, `user`, `pass`) VALUES
(16, 'Fernanda', 'Callejon', 'S', 'fer123', 'fer123'),
(17, 'Silvia', 'Suller', 'S', 'lasilvi69', 'lasilvi69'),
(18, 'Graciela', 'Camaño', 'S', 'grace4455', 'grace4455');

-- volcado de datos de Secretarias en tabla SECRETARIA
INSERT INTO `secrtetaria` (`id_usuario`) VALUES (16), (17), (18);

-- volcado de datos de Medicos en tabla MEDICO
INSERT INTO `medico` (`id_usuario`, `especialidad`, `secretaria`) VALUES
(1, 'Anatomía Patológica', 16),
(2, 'Cirugía General', 17),
(3, 'Crugía General', 18),
(4, 'Cirugía General', 16),
(5, 'Pediatra', 17),
(6,'Gastronterologo', 18),
(7, 'Medico Mundialista', 16),
(8, 'Obstetra', 17),
(9, 'Cirugía General', 18),
(10, 'Ginecologa', 16),
(11, 'Cardiologia', 17),
(12, 'Obstetra', 18),
(13, 'Ginecologa', 16),
(14, 'Pediatra', 17);

-- Volcado datos Turnos en tabla TURNO
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