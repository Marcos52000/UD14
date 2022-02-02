DROP DATABASE IF EXISTS Directores;
Create database Directores;
use Directores;

create table despachos(
	numero int auto_increment primary key,
    capacidad int
);

create table directores(
	DNI int auto_increment primary key,
    nomApels nvarchar(255),
    DNIJefe varchar(8),
    despacho int,
    foreign key(DNIJefe) references directores(DNI),
    foreign key(despacho) references despachos(numero)
);
