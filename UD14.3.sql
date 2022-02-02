Create database TiendaInformatica;
use TiendaInformatica;
Create table Fabricantes(
	id int auto_increment primary key,
    nombre varchar(100) 
);

create table Articulos(
	id int auto_increment primary key,
	nombre varchar(100),
	precio int,
	fabricante int,
	foreign key(fabricante) references Fabricantes(id)
);