# Base de datos Tienda

Tenemos las tablas producto y fabricante, cada una con los siguientes campos:

- producto (codigo, número, precio, codigo_fabricante)
- fabricante (codigo, número)
  El campo 'codigo_fabricante' de la entidad producto se relaciona con el campo 'código' de la entidad fabricante.

  Por favor, efectúa las siguientes consultas:

1. Lista el nombre de todos los productos que hay en la tabla producto.
2. Lista los nombres y los precios de todos los productos de la tabla producto.
3. Lista todas las columnas de la tabla producto.
4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
11. Lista el código de los fabricantes que tienen productos en la tabla producto.
12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
13. Lista los nombres de los fabricantes ordenados de manera ascendente.
14. Lista los nombres de los fabricantes ordenados de manera descendente.
15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y, en segundo lugar, por el precio de manera descendente.
16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se tiene que incluir en la respuesta.
18. Lista el nombre y el precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LÍMITE). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
19. Lista el nombre y el precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LÍMITE). NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
20. Lista el nombre de todos los productos del fabricante el código de fabricante del cual es igual a 2.
21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
26. Devuelve una lista de todos los productos del fabricante Lenovo.
    27.Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
27. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
28. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
29. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes el nombre de los cuales acabe por la vocal e.
30. Devuelve un listado con el nombre y el precio de todos los productos el nombre de fabricante de los cuales contenga el carácter w en su nombre.
31. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
32. Devuelve un listado con el código y el nombre de fabricante, solo de aquellos fabricantes que tienen productos asociados en la base de datos.
33. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado tendrá que mostrar también aquellos fabricantes que no tienen productos asociados.
34. Devuelve un listado donde solo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
35. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
36. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
37. Lista el nombre del producto más caro del fabricante Lenovo.
38. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
39. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
40. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

# Base de datos Universidad

Por favor, descarga la base de datos del fichero schema_universidad.sql, visualiza el diagrama E-R en un editor y efectúa las siguientes consultas:

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los/las alumnos. El listado tendrá que estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
3. Devuelve el listado de los alumnos que nacieron en 1999.
4. Devuelve el listado de profesores/se que no han dado de alta su número de teléfono en la base de datos y además su NIF acaba en K.
5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
6. Devuelve un listado de los profesores/se junto con el nombre del departamento al cual están vinculados. El listado tiene que devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
7. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
8. Devuelve un listado con el nombre de todos los departamentos que tienen profesores/se que imparten alguna asignatura en el Grado en Ingeniería Informática (Pla 2015).
9. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también tiene que mostrar aquellos profesores/se que no tienen ningún departamento asociado. El listado tiene que devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
3. Devuelve un listado con los departamentos que no tienen profesores/se asociados.
4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
5. Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

Consultas resumen:

1. Devuelve el número total de alumnos que hay.
2. Calcula cuántos alumnos nacieron en 1999.
3. Calcula cuántos profesores/as hay en cada departamento. El resultado solo tiene que mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en este departamento. El resultado solo tiene que incluir los departamentos que tienen profesores/se asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/se.
4. Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores/as asociados. Estos departamentos también tienen que aparecer en el listado.
5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado tendrá que estar ordenado de mayor a menor por el número de asignaturas.
6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado tiene que tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de este tipo.
8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado tiene que tener en cuenta aquellos profesores/se que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
10. Devuelve todos los datos del alumno/a más joven.
11. Devuelve un listado con los profesores/se que tienen un departamento asociado y que no imparten ninguna asignatura.
# Entrega-5.2_MySQL_queries
