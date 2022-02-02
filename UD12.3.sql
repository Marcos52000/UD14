DROP DATABASE IF EXISTS Comunidades;
Create database Comunidades;
use Comunidades;
Create table Comunidad_Autonoma(
	idComunidad int(10) auto_increment,
    nombre varchar(20),
    superficie int(20),
    poblacion int (20),
    primary key(idComunidad)
);

Create table Localidad(
	idLocalidad int (10) auto_increment,
    nombre varchar(20),
    cp int(20),
    poblacion int (20),
    primary key(idLocalidad)
);
Create table poblacion(
	cp int(20) not null,
    nombre varchar(20),
    poblacion int (20),
    superficie int(20),
    primary key(cp)
);
create table pertenece(
id int auto_increment primary key,
idComunidad int(10) not null,
idLocalidad int(10) not null,
cp int(20) not null,
foreign key(idComunidad) REFERENCES Comunidad_Autonoma(idComunidad),
foreign key(idLocalidad) REFERENCES Localidad(idLocalidad),
foreign key(cp) REFERENCES poblacion(cp)
);


INSERT into Localidad (nombre, cp, poblacion) VALUES 
	('Barcelona', 01, 5000000),
    ('Tarragona', 02, 2000000),
    ('Pontevedra', 03, 500000),
    ('Madrid', 04, 8000000),
	('Zaragoza', 05, 1000000);
    
INSERT into Comunidad_Autonoma (nombre, superficie, poblacion) VALUES 
	('Cataluña', 32.108, 7500000),
    ('Aragon', 47.720, 1300000),
    ('Galicia', 29.575  , 2700000),
    ('Madrid', 8.030 , 6600000),
	('Andalucia', 87.268, 8400000);
    
INSERT into poblacion (cp, nombre, superficie, poblacion) VALUES 
	(08,'Barcelona', 102, 1660314),
    (43,'El Vendrell', 36, 37000),
    (36,'Vigo', 109  , 480000),
    (28, 'Madrid', 603, 3500000),
	(50,'Zaragoza', 973, 666000);
    
INSERT into pertenece (idComunidad, idLocalidad, cp) VALUES 
	(1, 1, 08),
    (1, 2, 43),
    (5, 2, 50),
    (3, 3, 36);
    
select * from Localidad;
select * from Comunidad_Autonoma;
select * from poblacion;
select * from pertenece;