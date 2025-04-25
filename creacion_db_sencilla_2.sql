CREATE DATABASE empresadb;
use empresadb;

create table departamentos(
	depto_id int auto_increment primary key,
    nombre varchar(255) not null,
    ubicacion varchar(255)
);

create table empleados(
	empleado_id int auto_increment primary key,
    nombre varchar(255),
    apellido varchar(255),
    email varchar(255),
    depto_id int,
    foreign key (depto_id) references departamentos(depto_id)
    on delete set null
);

create table proyectos(
	proyecto_id int auto_increment primary key,
    nombre varchar(255) not null,
    descripcion text,
    fecha_inicio date,
    fecha_fin date
);

create table asignacionesdeproyectos(
	asignacion_id int auto_increment primary key,
    proyecto_id int,
    empleado_id int,
    horas_asignadas int not null,
    foreign key (proyecto_id) references proyectos(proyecto_id),
    foreign key (empleado_id) references empleados(empleado_id)
);

create table logempleado(
nombre_empleado varchar(255)
);

alter table departamentos add column email_jefe varchar(255);

#drop table if exists asignacionesdeproyectos;

insert into departamentos (nombre, ubicacion) values
('Recursos Humanos', 'Edificio B'),
('Marketing', 'Edificio Central'),
('Ventas', 'Edificio C'),
('Finanzas','Edificio A'),
('Operaciones', 'Edificio C'),
('Investigacion y desarrollo', 'Edificio Central'),
('Innovacion', 'Edificio Innovacion'),
('Soporte Cliente', 'Edificio C'),
('Desarrollo de Producto','Edificio D'),
('Control de Calidad', 'Edificio E'),
('Logistica', 'Edificio E');

select * from departamentos;



