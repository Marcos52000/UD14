DROP DATABASE IF EXISTS GrandesAlmacenes;
Create database GrandesAlmacenes;
use GrandesAlmacenes;

DROP TABLE if exists cajeros;
create table cajeros (
	codigo int auto_increment primary key,
    nomApels nvarchar(255)
);

DROP TABLE if exists productos;
create table productos (
	codigo int auto_increment primary key,
    nombre nvarchar(100),
    precio int
);
DROP TABLE if exists maquinasRegistradoras;
create table maquinasRegistradoras (
	codigo int auto_increment primary key,
    precio int
);

DROP TABLE if exists venta;
create table venta (
    cajero int,
    maquina int,
    producto int,
    primary key(cajero,maquina,producto),
	foreign key (cajero) references cajeros(codigo),
    foreign key (maquina) references maquinasRegistradoras(codigo),
    foreign key (producto) references productos(codigo)
);