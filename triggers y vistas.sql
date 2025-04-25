CREATE VIEW VistaEmpleadosTecnologia AS
SELECT nombre,apellido,email from Empleados WHERE depto_id = 2;

select * from VistaEmpleadosTecnologia;

-- vista materializada, para consultas mas extensas

#CREATE MATERIALIZED VIEW VistaEmpleadosProyecto AS
SELECT e.nombre, p.nombre as proyecto from empleados as e
join asignacionesdeproyectos as a on e.empleado_id = a.empleado_id
JOIN proyectos as p on a.proyecto_id = p.proyecto_id;

#arreglar logempleado

alter table logempleado add column fecha_registro datetime ;
alter table logempleado change column nombre_empleado empleado_id int;

-- trigger

DELIMITER $$
CREATE TRIGGER RegistrarNuevoEmpleadoLog 
AFTER INSERT ON Empleados
for each row
BEGIN
	INSERT INTO logempleado (empleado_id, fecha_registro) values (new.empleado_id, now());
END$$

DELIMITER ;

INSERT INTO empleados (nombre, apellido, email) values ('Juan','Perez','juan.perez@example.com');
INSERT INTO empleados (nombre, apellido, email) values ('Juan','Robles','juan.robles@example.com');
select * from logempleado;


select * from proyectos;

create view VistaEmpleadosProyectos as
select e.nombre as Nombre_Empleado , e.apellido as Apellido_Empleado, p.nombre as Nombre_Proyecto from empleados as e 
join asignacionesdeproyectos as a on e.empleado_id = a.empleado_id
join proyectos as p on a.proyecto_id = p.proyecto_id;

select * from vistaempleadosProyectos;