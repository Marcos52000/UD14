create DATABASE estaciones;
use estaciones;
create TABLE Estacion (
    identificador int not null ,
    latitud int not null,
    longitud int not null,
    altitud int not null,
    primary key(identificador)
);
create TABLE Muestra (
    identificadorEstacion int not null ,
    fecha date,
    temperatura_minima int,
    temperatura_maxima int,
    precipitaciones int,
    humedad_minima int,
    humedad_maxima int,
    velocidad_vineto_minima varchar(20),
    velocidad_vineto_maxima varchar(20),
    foreign key(identificadorEstacion) REFERENCES Estacion(identificador)
);




