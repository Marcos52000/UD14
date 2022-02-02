DROP DATABASE IF EXISTS Empleados;
Create database Empleados;
use Empleados;
Create table Departamentos(
	id int auto_increment primary key,
        nombre nvarchar(100),
        presupuesto int
);
Create table Empleados(
	id int auto_increment primary key,
    nombre nvarchar(100),
    apellidos nvarchar(255),
    departamento int,
    foreign key (departamento) references Departamentos(id)
);