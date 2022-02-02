DROP DATABASE IF EXISTS Cine;
Create database Cine;
use Cine;

create table peliculas(
	codigo int auto_increment primary key,
	nombre nvarchar(100),
    calificacionEdad int
);

create table salas(
	codigo int auto_increment primary key,
	nombre nvarchar(100),
    pelicula int,
    foreign key (pelicula) references peliculas(codigo)
);