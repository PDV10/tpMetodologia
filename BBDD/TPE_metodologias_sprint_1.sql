-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-11-06 18:28:34.18

-- tables
-- Table: MEDICO
CREATE TABLE MEDICO (
    id_medico int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    especialidad varchar(50) NOT NULL,
    user varchar(50) NOT NULL,
    pass varchar(254) NOT NULL,
    CONSTRAINT PK_MEDICO PRIMARY KEY (id_medico)
);

-- Table: MEDICO_OBRA_SOCIAL
CREATE TABLE MEDICO_OBRA_SOCIAL (
    id_medico int NOT NULL,
    id_obra_social int NOT NULL,
    en_servicio bool NOT NULL,
    tarifa float(6,2) NOT NULL,
    CONSTRAINT PK_MEDICO_OBRA_SOCIAL PRIMARY KEY (id_medico,id_obra_social)
);

-- Table: OBRA_SOCIAL
CREATE TABLE OBRA_SOCIAL (
    id_obra_social int NOT NULL,
    nombre varchar(30) NOT NULL,
    tipo varchar(30) NOT NULL,
    organizacion varchar(30) NOT NULL,
    CONSTRAINT PK_OBRA_SOCIAL PRIMARY KEY (id_obra_social)
);

-- Table: PACIENTE
CREATE TABLE PACIENTE (
    id_paciente int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    direccion varchar(50) NOT NULL,
    telefono int NOT NULL,
    email varchar(50) NOT NULL,
    id_obra_social int NOT NULL,
    nro_afiliado int NOT NULL,
    pass varchar(255) NOT NULL,
    CONSTRAINT PK_PACIENTE PRIMARY KEY (id_paciente)
);

-- Table: TURNO
CREATE TABLE TURNO (
    id_turno int NOT NULL,
    id_medico int NOT NULL,
    id_paciente int NOT NULL,
    dia date NOT NULL,
    hora time NOT NULL,
    tipo_turno char(1) NOT NULL,
    CONSTRAINT PK_TURNO PRIMARY KEY (id_turno,id_medico,id_paciente)
);

-- foreign keys
-- Reference: FK_MEDICO_TURNO_MEDICO (table: MEDICO_OBRA_SOCIAL)
ALTER TABLE MEDICO_OBRA_SOCIAL ADD CONSTRAINT FK_MEDICO_TURNO_MEDICO FOREIGN KEY FK_MEDICO_TURNO_MEDICO (id_medico)
    REFERENCES MEDICO (id_medico);

-- Reference: FK_MEDICO_TURNO_OBRA_SOCIAL (table: MEDICO_OBRA_SOCIAL)
ALTER TABLE MEDICO_OBRA_SOCIAL ADD CONSTRAINT FK_MEDICO_TURNO_OBRA_SOCIAL FOREIGN KEY FK_MEDICO_TURNO_OBRA_SOCIAL (id_obra_social)
    REFERENCES OBRA_SOCIAL (id_obra_social);

-- Reference: FK_PACIENTE_OBRA_SOCIAL (table: PACIENTE)
ALTER TABLE PACIENTE ADD CONSTRAINT FK_PACIENTE_OBRA_SOCIAL FOREIGN KEY FK_PACIENTE_OBRA_SOCIAL (id_obra_social)
    REFERENCES OBRA_SOCIAL (id_obra_social);

-- Reference: FK_TURNO_MEDICO (table: TURNO)
ALTER TABLE TURNO ADD CONSTRAINT FK_TURNO_MEDICO FOREIGN KEY FK_TURNO_MEDICO (id_medico)
    REFERENCES MEDICO (id_medico);

-- Reference: FK_TURNO_PACIENTE (table: TURNO)
ALTER TABLE TURNO ADD CONSTRAINT FK_TURNO_PACIENTE FOREIGN KEY FK_TURNO_PACIENTE (id_paciente)
    REFERENCES PACIENTE (id_paciente);

-- End of file.

