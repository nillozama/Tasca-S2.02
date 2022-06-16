
select nombre from producto;

select nombre, precio from producto;

select * from producto;

select nombre, precio as precio_euros,  precio*1.04 as precio_USD from producto;

select nombre as nom_de_producto, precio as euros,  precio*1.04 as dolars from producto;

select upper (nombre), precio from producto;

select lower (nombre), precio from producto;

select nombre, upper(left(nombre, 2)) as iniciales from fabricante;

select nombre, round(precio) from producto;

select nombre, truncate(precio, 0) from producto;

select fabricante.codigo from fabricante join producto on fabricante.codigo=codigo_fabricante;

select distinct fabricante.codigo from fabricante join producto on fabricante.codigo=codigo_fabricante;

select distinct nombre from fabricante order by nombre asc;

select distinct nombre from fabricante order by nombre desc;

select nombre from producto order by nombre asc, precio desc;

select * from fabricante limit 5;

select * from fabricante limit 2 offset 3;

select nombre, precio from producto order by precio asc limit 1;

select nombre, precio from producto order by precio desc limit 1;

select nombre from producto where codigo_fabricante=2;

select p.nombre, precio, f.nombre from producto p join fabricante f on f.codigo=codigo_fabricante;

select p.nombre, precio, f.nombre from producto p join fabricante f on f.codigo=codigo_fabricante order by f.nombre;

select p.codigo, p.nombre, f.codigo, f.nombre  from producto p join fabricante f on f.codigo=codigo_fabricante;

select p.nombre, precio, f.nombre as nombre_fabricante from producto p join fabricante f on f.codigo=codigo_fabricante where precio=(select min(precio) from producto);

select p.nombre, precio, f.nombre as nombre_fabricante from producto p join fabricante f on f.codigo=codigo_fabricante where precio=(select max(precio) from producto);

select p.nombre from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre='Lenovo';

select p.nombre from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre='Crucial' and precio>200;

select p.nombre from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre='Asus' or f.nombre='Hewlett-Packard' or f.nombre='Seagate';

select p.nombre from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre in ('Asus','Hewlett-Packard', 'Seagate');

select p.nombre, precio from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre like '%e';

select p.nombre, precio from producto p join fabricante f on f.codigo=codigo_fabricante where f.nombre like '%w%';

select p.nombre, precio, f.nombre as nombre_fabricante from producto p join fabricante f on f.codigo=codigo_fabricante where precio>=180 order by precio desc, p.nombre asc;

select distinct f.codigo, f.nombre from fabricante f inner join producto on codigo_fabricante=f.codigo;

select distinct f.codigo, f.nombre, p.nombre from fabricante f left join producto p on codigo_fabricante=f.codigo;

select f.codigo, f.nombre from fabricante f left join producto p on codigo_fabricante=f.codigo where codigo_fabricante is null;

select p.nombre from producto p where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Lenovo');

select * from producto p where precio=(select max(precio) from producto where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Lenovo'));

select p.nombre from producto p where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Lenovo') and precio=(select max(precio) from producto where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Lenovo'));

select p.nombre from producto p where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Hewlett-Packard') and precio=(select min(precio) from producto where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Hewlett-Packard'));

select p.nombre from producto p where precio>=(select max(precio) from producto where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Lenovo'));

select p.nombre from producto p where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Asus') and precio>=(select avg(precio) from producto where codigo_fabricante=(select f.codigo from fabricante f where f.nombre='Asus'));


select nombre, apellido1, apellido2 from persona where tipo='alumno' order by apellido1, apellido2, nombre;

select nombre, apellido1, apellido2 from persona where tipo='profesor' and telefono is null;

select * from persona where tipo='alumno' and fecha_nacimiento like '1999%';

select * from persona where tipo='profesor' and telefono is null and nif like '%K';

select * from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;

select apellido1, apellido2, persona.nombre, tipo, departamento.nombre as departamento from persona, departamento where persona.id= departamento.id and tipo= 'profesor' order by apellido1, apellido2, persona.nombre;

select asignatura.nombre, anyo_inicio, anyo_fin from alumno_se_matricula_asignatura, persona, asignatura, curso_escolar where nif='26902806M' and id_alumno=persona.id and asignatura.id= id_asignatura and id_curso_escolar=curso_escolar.id;

select distinct departamento.nombre as nombre_departamento from departamento inner join profesor on id_departamento=departamento.id  inner join asignatura on asignatura.id_profesor=profesor.id_profesor inner join grado where grado.nombre='Grado en Ingeniería Informática (Plan 2015)';

select distinct concat(nombre, ' ', apellido1) as nombre_alumno from persona p inner join alumno_se_matricula_asignatura a on a.id_alumno=p.id inner join curso_escolar c on c.id=a.id_curso_escolar where anyo_inicio=2018;


select  p.apellido1, p.apellido2, p.nombre, d.nombre as nombre_departamento from persona p left join profesor on  p.id=profesor.id_profesor left join departamento d on d.id=profesor.id_departamento order by d.nombre, p.apellido1, p.apellido2, p.nombre;

select apellido1, apellido2, p.nombre from persona p left join profesor on  p.id=profesor.id_profesor left join departamento d on d.id=profesor.id_departamento where id_departamento is null order by d.nombre, p.apellido1, p.apellido2, p.nombre;

select nombre from departamento left join profesor on departamento.id=id_departamento where id_profesor is null;

select apellido1, apellido2, persona.nombre from persona left join asignatura on persona.id=id_profesor where asignatura.nombre is null order by persona.apellido1, persona.apellido2, persona.nombre;

select asignatura.nombre from asignatura where id_profesor is null order by asignatura.nombre;

select distinct d.nombre from departamento d left join profesor p on d.id=p.id_departamento left join asignatura a on a.id_profesor=p.id_profesor where a.id_profesor is null;


select count(persona.id) as numero_alumnos from persona where tipo='alumno';

select count(persona.id) as numero_alumnos_nacidos_1999 from persona where tipo='alumno' and fecha_nacimiento like '1999%';

select departamento.nombre as nombre_departamento, count(profesor.id_profesor) as numero_profesores from departamento join profesor on departamento.id=id_departamento group by departamento.nombre order by numero_profesores desc;

select departamento.nombre as nombre_departamento, count(profesor.id_profesor) as numero_profesores from departamento left join profesor on departamento.id=id_departamento group by departamento.nombre order by numero_profesores desc;

select grado.nombre as nombre_grado, count(asignatura.id) as numero_asignaturas from grado left join asignatura on grado.id=id_grado group by grado.nombre order by numero_asignaturas desc;

select grado.nombre as nombre_grado, count(asignatura.id) as numero_asignaturas from grado inner join asignatura on grado.id=id_grado group by grado.nombre having count(asignatura.id)>40 order by numero_asignaturas desc;

select grado.nombre as nombre_grado, asignatura.tipo as tipo_asignatura, sum(asignatura.creditos) as total_creditos from grado join asignatura on grado.id=id_grado group by grado.nombre, tipo_asignatura;

select anyo_inicio, count(id_alumno) as numero_alumnos from curso_escolar c join alumno_se_matricula_asignatura on c.id=id_curso_escolar group by id_curso_escolar;

select persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) as nombre_asignatures from persona left join asignatura on id_profesor=persona.id group by persona.id order by nombre_asignatures desc;

select * from persona where fecha_nacimiento=(select max(fecha_nacimiento) from persona where tipo='alumno');

select persona.nombre from persona left join profesor p on persona.id=p.id_profesor left join asignatura a on a.id_profesor=persona.id where a.id_profesor is null and persona.tipo='profesor' order by persona.nombre;







 

 







