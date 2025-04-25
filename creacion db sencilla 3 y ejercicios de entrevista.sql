-- creacion base de datos sistema de reservas de hotel

create database hoteldb;
use hoteldb;
create table clientes(
cliente_id int(11) auto_increment primary key,
nombre varchar(255) not null,
apellido varchar(255) not null,
telefono varchar(255)
);

create table habitaciones(
habitacion_id int(11) auto_increment primary key,
tipo varchar(255),
camas int,
piso int,
camarote tinyint(1),
ocupada tinyint(1)
);

create table reservas(
reserva_id int(11) primary key auto_increment primary key,
cliente_id int(11),
habitacion_id int(11),
dias_reservados int(3),
ubicacion varchar(255),
foreign key (cliente_id) references clientes(cliente_id),
foreign key (habitacion_id) references habitaciones(habitacion_id)
);

use empresadb;
select e.nombre as 'Nombre Empleado', e.apellido as 'Apellido Empleado', p.nombre as 'Nombre Proyecto', a.horas_asignadas as 'Horas Asignadas' 
from empleados as e join asignacionesdeproyectos as a on e.empleado_id = a.empleado_id 
join proyectos as p on a.proyecto_id = p.proyecto_id 
order by e.nombre, e.apellido, a.horas_asignadas desc;

select d.nombre as 'Nombre Departamento', sum(a.horas_asignadas) as 'Total Horas Asignadas' from empleados as e
join asignacionesdeproyectos as a on a.empleado_id = e.empleado_id join departamentos as d on e.depto_id = d.depto_id 
group by d.depto_id order by sum(a.horas_asignadas) desc;

select e.nombre as 'Nombre', e.apellido as 'Apellido', sum(a.horas_asignadas) as 'Total Horas trabajadas', rank() over(partition by e.depto_id order by sum(a.horas_asignadas) desc) as 'Ranking Departamental' from empleados as e join asignacionesdeproyectos as a on e.empleado_id = a.empleado_id group by e.empleado_id, e.nombre, e.apellido, e.depto_id order by e.depto_id, 'Ranking Departamental';