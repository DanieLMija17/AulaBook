--	TABLAS

--TABLA USUARIO (ADMIN)
CREATE TABLE USARIO(
	User_ID serial PRIMARY KEY NOT NULL,
	Nombre varchar(30) NOT NULL,
	Cargo varchar(30) NOT NULL,
	Departamento varchar(30)NOT NULL,
);


--TABLA ALUMNO
CREATE TABLE ALUMNO(
	Carnet char(11) PRIMARY KEY NOT NULL,
	Nombre varchar(30) NOT NULL,
	Carrera varchar (40) NOT NULL,
	Correo varchar(100) NOT NULL,
	Trimestre bool NOT NULL
);


--TABLA MODULO
CREATE TABLE MODULO(
	Modulo_ID varchar(20) PRIMARY KEY NOT NULL
);





--TABLA AULA
CREATE TABLE AULA(
	Nombre_salon varchar(15) PRIMARY KEY NOT NULL,
	Modulo_ID varchar(15) NOT NULL,
	Aire bool NOT NULL,
	Video_beam bool NOT NULL,
	Pizarra bool NOT NULL,
	Computadora bool NOT NULL,
	Pupitres integer NOT NULL,
	FOREIGN KEY (Modulo_ID) REFERENCES MODULO(Modulo_ID)
);


--TABLA RESERVA
CREATE TABLE RESERVA(
	Num_reserva serial PRIMARY KEY NOT NULL,
	Nombre_salon varchar(15) NOT NULL,
	Carnet char(11) NOT NULL,
	Categoria varchar(30) NOT NULL CHECK(Categoria IN('Clases','Preparaduria','Evento')),
	Descripcion varchar(50) NOT NULL,
	Status ENUM('pendiente','aprobado','rechazado'),
	FOREIGN KEY (Nombre_salon) REFERENCES AULA(Nombre_salon),
	FOREIGN KEY (Carnet) REFERENCES ALUMNO(Carnet)
	
);