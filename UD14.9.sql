DROP DATABASE IF EXISTS Cientificos;
Create database Cientificos;
use Cientificos;

create table cientificos ( 
	DNI varchar(8) primary key,
    nomApels nvarchar(255)
);
create table proyecto ( 
	id char(4) primary key,
    nombre nvarchar(255),
    horas int
);

create table asignado_a(
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY (cientifico, proyecto),
    foreign key (cientifico) references cientificos(DNI),
    foreign key (proyecto) references proyecto(id)
);
