DROP DATABASE IF EXISTS Investigadores;
Create database Investigadores;
use Investigadores;

drop table if exists facultad;
create table facultad (
	codigo int auto_increment primary key,
    nombre nvarchar(100)
);

drop table if exists investigadores;
create table investigadores (
	dni varchar(8) primary key,
    nomApels nvarchar(255),
    facultad int,
    foreign key (facultad) references facultad(codigo)
);

drop table if exists equipos;
create table equipos (
	numSerie char(8) primary key,
    nombre nvarchar(100),
    facultad int,
    foreign key (facultad) references facultad(codigo)
);

drop table if exists reserva;
create table reserva (
	dni varchar(8),
    numSerie char(8),
    comienzo datetime,
    fin datetime,
    foreign key (dni) references investigadores(dni),
    foreign key (numSerie) references equipos(numSerie)
);


