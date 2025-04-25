use empresadb;
#drop procedure if exists AgregarEmpleado;
-- delimiter  //
#create procedure  AgregarEmpleado(
#in _nombre varchar(255),
#in _apellido varchar(255),
#in _email varchar(255),
#in _depto_id int
#)
#begin
#	insert into empleados(nombre,apellido,email,depto_id) values (_nombre, _apellido, _email, _depto_id);
    
#end //

#delimiter ;

#call AgregarEmpleado('Armando','Paredes','armando.paredes@gmail.com',4);

select * from empleados;


select * from proyectos;

call AsignarHorasAProyecto(1,1,10);
select * from asignacionesdeproyectos where proyecto_id = 1 and empleado_id = 1;

-- transacciones

DELIMITER //

CREATE PROCEDURE AgregarDepartamento(
IN sp_nombre VARCHAR(255),
IN sp_ubicacion VARCHAR(255),
IN sp_email_jefe VARCHAR(255)
)
BEGIN

	INSERT INTO departamentos (nombre, ubicacion, email_jefe) VALUES (sp_nombre, sp_ubicacion, sp_email_jefe);
    select 'se ha ingresado un departamento correctamente' as mensaje;
END //

DELIMITER ;

CALL AgregarDepartamento('Dpto de T.I.', 'Edificio Central', 'elbossdeTI@gmail.com');

select * from departamentos;

#begin;
#savepoint Prevalidacion;
#insert into asignacionesdeproyectos(proyecto_id, empleado_id, horas_asignadas) values (5,1,10);
#insert into asignacionesdeproyectos(proyecto_id, empleado_id, horas_asignadas) values (5,2,15);
-- aca irian mas inserciones
-- aca iria el codigo para validad el total de horas 
-- si el total de horas se excede, se puede revertir al savepoint
#rollback to Prevalidacion;
#commit;



