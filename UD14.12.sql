CREATE DATABASE IF NOT EXISTS Escuela;
use Escuela;

create table if not exists Profesores(
	DNI varchar(8) primary key,
    nombre nvarchar(100) unique,
    apellido1 nvarchar(100),
    apellido2 nvarchar(100),
    direccion nvarchar(255),
    titulo nvarchar(255),
    gana int not null
);

CREATE TABLE if not exists Cursos (
	idcurso int primary key auto_increment,
	nombrecurso nvarchar(255) unique,
    DNIprofesor varchar(8),
    max_alumnos int,
    fehca_inicio date,
    fecha_fin date,
    num_horas int not null,
    foreign key (DNIprofesor) references Profesores(DNI)
);

create table if not exists Alumnos (
	DNI varchar(8) primary key,
    nombre nvarchar(100),
    apellido1 nvarchar(100),
    apellido2 nvarchar(100),
    direccion nvarchar(255),
    sexo char(1),
    fecha_nacimiento date,
    curso int not null,
    foreign key (curso) references Cursos(idcurso)
);