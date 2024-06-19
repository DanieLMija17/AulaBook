--	TABLAS

--TABLA USUARIO (ADMIN)
CREATE TABLE USUARIO(
	User_ID serial PRIMARY KEY NOT NULL,
	Nombre varchar(30) NOT NULL,
	Cargo varchar(30) NOT NULL,
	Departamento varchar(30)NOT NULL
)

--TABLA ALUMNO 
CREATE TABLE ALUMNO( 
	Carnet char(11) PRIMARY KEY NOT NULL,
	Nombre varchar(30) NOT NULL,
	Carrera varchar (40) NOT NULL,
	Correo varchar(100) NOT NULL,
	Trimestre boolean NOT NULL
)

--TABLA MODULO
CREATE TABLE MODULO(
	Modulo_ID varchar(20) PRIMARY KEY NOT NULL
)

--TABLA AULA
CREATE TABLE AULA(
	Codigo_aula varchar(15) PRIMARY KEY NOT NULL,
	Modulo_ID varchar(15) NOT NULL,
	Aire bool NOT NULL,
	Video_beam bool NOT NULL,
	Pizarra bool NOT NULL, 
	Computadora bool NOT NULL,
	Pupitres integer NOT NULL, 
	Puntuacion_promedio double NOT NULL, 
	FOREIGN KEY (Modulo_ID) REFERENCES MODULO(Modulo_ID)
)

--TABLA RESERVA
CREATE TABLE RESERVA(
	Num_reserva serial PRIMARY KEY NOT NULL,
	Codigo_aula varchar(15) NOT NULL,
	Carnet char(11) NOT NULL,
	Categoria varchar(30) NOT NULL CHECK(Categoria IN('Clases','Preparaduria','Evento')),
	Descripcion varchar(50) NOT NULL,
	Status varchar(20) NOT NULL CHECK(Status IN ('pendiente', 'aprobado', 'rechazado', 'cancelado')),,
	Puntuacion integer CHECK(Puntuacion IN (1, 2, 3, 4, 5)), 
	Fecha_inicial timestamp NOT NULL,
	Fecha_final timestamp NOT NULL,
	FOREIGN KEY (Codigo_aula) REFERENCES AULA(Codigo_aula),
	FOREIGN KEY (Carnet) REFERENCES ALUMNO(Carnet)
	
)

CREATE UNIQUE INDEX unique_reservation ON RESERVA (Codigo_aula, tstzrange(Fecha_inicial, Fecha_final, '[]'));
	



-- INSERTS

--MODULO

INSERT INTO public.modulo(Modulo_ID)
VALUES
	('A1'),
	('A2');

INSERT INTO public.aula(Nombre_salon, Modulo_ID,Aire,Video_beam,Pizarra,Computadora,Pupitres)
VALUES
	('A1-101','A1',FALSE,FALSE,TRUE,TRUE,TRUE,30),
	('A2-101','A2',FALSE,FALSE,TRUE,TRUE,TRUE,50);

