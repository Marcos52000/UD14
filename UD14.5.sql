DROP DATABASE IF EXISTS Almacenes;
Create database Almacenes;
use Almacenes;

create table Almacenes(
	codigo int auto_increment primary key,
	lugar nvarchar(100),
    capacidad int
);

create table Cajas(
	numReferencia char primary key,
    contenido nvarchar(100),
    valor int,
    almacen int,
    foreign key (almacen) references Almacenes(codigo)
);