-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado tendrá que estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1 AS primer_apellido, apellido2 AS segundo_apellido, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Devuelve el listado de los alumnos que nacieron en 1999.
SELECT *
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4. Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF acaba en K.
SELECT *
FROM profesor
LEFT JOIN persona ON profesor.id_profesor = persona.id
WHERE persona.telefono IS NULL AND persona.nif LIKE '%K';

-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Devuelve un listado de los profesores/as junto con el nombre del departamento al cual están vinculados. El listado tiene que devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, p.nombre, d.nombre AS nombre_departamento
FROM profesor
LEFT JOIN persona p ON profesor.id_profesor = p.id
LEFT JOIN departamento d ON profesor.id_departamento = d.id
ORDER BY primer_apellido, segundo_apellido, nombre;

-- 7. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM alumno_se_matricula_asignatura asa
JOIN persona p ON asa.id_alumno = p.id
JOIN asignatura a ON asa.id_asignatura = a.id
JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';

-- 8. Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Pla 2015).
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a ON p.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Ingeniería Informática' AND g.nombre = '2015';


-- 9. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT p.*
FROM persona p
JOIN alumno_se_matricula_asignatura asa ON p.id = asa.id_alumno
JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 AND p.tipo = 'alumno';

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también tiene que mostrar aquellos profesores/as que no tienen ningún departamento asociado. El listado tiene que devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT d.nombre AS nombre_departamento, p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, p.nombre
FROM profesor
LEFT JOIN persona p ON profesor.id_profesor = p.id
LEFT JOIN departamento d ON profesor.id_departamento = d.id
ORDER BY nombre_departamento, primer_apellido, segundo_apellido, p.nombre;

-- 2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT p.*
FROM persona p
LEFT JOIN profesor ON p.id = profesor.id_profesor
WHERE profesor.id_profesor IS NULL AND p.tipo = 'profesor';

-- 3. Devuelve un listado con los departamentos que no tienen profesores/as asociados.
SELECT d.*
FROM departamento d
LEFT JOIN profesor ON d.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL;

-- 4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT p.*
FROM profesor p
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT a.*
FROM asignatura a
LEFT JOIN profesor p ON a.id_profesor = p.id_profesor
WHERE p.id_profesor IS NULL;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.*
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

-- Consultas resumen:

-- 1. Devuelve el número total de alumnos que hay.
SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';

-- 2. Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS alumnos_1999
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3. Calcula cuántos profesores/as hay en cada departamento. El resultado solo tiene que mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en este departamento. El resultado solo tiene que incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS num_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY num_profesores DESC;

-- 4. Devuelve un listado con todos los departamentos y el número de profesores/se que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores/as asociados. Estos departamentos también tienen que aparecer en el listado.
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS num_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado tendrá que estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS num_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY num_asignaturas DESC;

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS num_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING num_asignaturas > 40
ORDER BY num_asignaturas DESC;

-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado tiene que tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de este tipo.
SELECT g.nombre AS nombre_grado, a.tipo, SUM(a.creditos) AS total_creditos
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo;

-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT ce.anyo_inicio, COUNT(asa.id_alumno) AS num_alumnos_matriculados
FROM curso_escolar ce
LEFT JOIN alumno_se_matricula_asignatura asa ON ce.id = asa.id_curso_escolar
GROUP BY ce.anyo_inicio;

-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado tiene que tener en cuenta aquellos profesores/se que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS num_asignaturas_impartidas
FROM profesor p
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
LEFT JOIN persona pe ON p.id_profesor = pe.id
GROUP BY p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2
ORDER BY num_asignaturas_impartidas DESC;


-- 10. Devuelve todos los datos del alumno/a más joven.
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento ASC
LIMIT 1;

-- 11. Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT p.*
FROM profesor p
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE p.id_departamento IS NOT NULL AND a.id_profesor IS NULL;


-- Consultas adicionales

-- 1. Listar todos los alumnos junto con sus asignaturas matriculadas:
SELECT p.nombre, p.apellido1, p.apellido2, a.nombre AS asignatura
FROM persona p
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno
JOIN asignatura a ON ama.id_asignatura = a.id;

-- 2. Contar el número de alumnos por año de nacimiento:
SELECT YEAR(fecha_nacimiento) AS año_nacimiento, COUNT(*) AS num_alumnos
FROM persona
WHERE tipo = 'alumno'
GROUP BY YEAR(fecha_nacimiento);

-- 3. Listar los profesores que imparten asignaturas optativas:
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.tipo = 'optativa';

-- 4. Mostrar el número total de créditos por grado:
SELECT g.nombre AS grado, SUM(a.creditos) AS total_creditos
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre;

-- 5. Listar los departamentos que no tienen ningún profesor asociado:
SELECT d.nombre AS departamento
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id_profesor IS NULL;

-- 6. Listar los profesores que no han dado de alta su número de teléfono:
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL;

-- 7. Mostrar los alumnos que nacieron en un año específico:
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 8. Listar los profesores y sus respectivos departamentos, incluyendo aquellos sin departamento asignado:
SELECT p.nombre, p.apellido1, p.apellido2, IFNULL(d.nombre, 'Sin departamento') AS departamento
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN departamento d ON pr.id_departamento = d.id;


-- 9. Contar el número de asignaturas que imparten los profesores, incluyendo aquellos que no imparten ninguna:
SELECT p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas_impartidas
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
GROUP BY p.nombre, p.apellido1, p.apellido2
ORDER BY num_asignaturas_impartidas DESC;


-- 10. Listar los grados y el número de asignaturas obligatorias nque tienen:
SELECT g.nombre AS grado, COUNT(*) AS num_asignaturas_obligatorias
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
WHERE a.tipo = 'obligatoria'
GROUP BY g.nombre;

-- 11. Listar los alumnos que se han matriculado en asignaturas durante un curso escolar específico:
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE YEAR(ce.anyo_inicio) = 2014 OR YEAR(ce.anyo_fin) = 2015;


-- 12. Mostrar el nombre de los grados y el número total de créditos que contienen todas sus asignaturas:
SELECT g.nombre AS nombre_grado, SUM(a.creditos) AS total_creditos
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre;

-- 13. Listar los departamentos que tienen al menos un profesor y ordenarlos por nombre del departamento:
SELECT d.nombre AS nombre_departamento, COUNT(pr.id_profesor) AS num_profesores
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
GROUP BY d.nombre
HAVING COUNT(pr.id_profesor) > 0
ORDER BY nombre_departamento;

-- 14. Contar el número de asignaturas que se imparten en cada cuatrimestre:
SELECT cuatrimestre, COUNT(*) AS num_asignaturas
FROM asignatura
GROUP BY cuatrimestre;

-- 15. Mostrar el nombre y apellido de los alumnos que no tienen un número de teléfono registrado:
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 16. nombre y apellidos de los alumnos matriculados en alguna asignatura
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno;

-- 17. especificar la asignatura junto con el nombre y apellidos de los alumnos matriculados en ella:
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, a.nombre AS asignatura
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
JOIN asignatura a ON am.id_asignatura = a.id;

-- 18. Listar los nombres de los profesores y el nombre de los departamentos a los que están vinculados, mostrando también aquellos profesores que no tienen departamento asociado:
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, IFNULL(d.nombre, 'Sin departamento') AS nombre_departamento
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN departamento d ON pr.id_departamento = d.id;

-- 19. Mostrar el nombre de los alumnos y el número de asignaturas en las que están matriculados, ordenado de mayor a menor por el número de asignaturas:
SELECT p.nombre, p.apellido1, p.apellido2, COUNT(am.id_asignatura) AS num_asignaturas_matriculadas
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
GROUP BY p.id
ORDER BY num_asignaturas_matriculadas DESC;


-- 20. Listar el nombre de las asignaturas, el nombre de los profesores que las imparten y el nombre de los grados a los que están asociadas:
SELECT a.nombre AS asignatura, CONCAT(p.nombre, ' ', p.apellido1, ' ', p.apellido2) AS profesor, g.nombre AS grado
FROM asignatura a
LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor
LEFT JOIN persona p ON pr.id_profesor = p.id
LEFT JOIN grado g ON a.id_grado = g.id;

