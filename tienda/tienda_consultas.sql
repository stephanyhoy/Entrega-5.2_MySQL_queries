-- consultas:
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio * 0.88 AS euros, precio AS dolares FROM producto;


-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'nombre de producto', precio * 0.88 AS euros, precio AS dolares FROM producto;


-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;


-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;


-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;


-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM producto;


-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;


-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT DISTINCT codigo_fabricante FROM producto;


-- 12. Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;


-- 13. Lista los nombres de los fabricantes ordenados de manera ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;


-- 14. Lista los nombres de los fabricantes ordenados de manera descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;


-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y, en segundo lugar, por el precio de manera descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;


-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;


-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se tiene que incluir en la respuesta.
SELECT * FROM fabricante LIMIT 3, 2;


-- 18. Lista el nombre y el precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LÍMITE). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;


-- 19. Lista el nombre y el precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LÍMITE). NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;


-- 20. Lista el nombre de todos los productos del fabricante el código de fabricante del cual es igual a 2.
SELECT producto.nombre AS 'Nombre del Producto'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 2;


-- 21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;


-- 22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;


-- 23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo AS 'Código del Producto', producto.nombre AS 'Nombre del Producto', producto.codigo_fabricante AS 'Código del Fabricante', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;


-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;


-- 25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;


-- 26. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';


-- 27. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;


-- 28. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';


-- 29. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');


-- 30. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes el nombre de los cuales acabe por la vocal e.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';


-- 31. Devuelve un listado con el nombre y el precio de todos los productos el nombre de fabricante de los cuales contenga el carácter w en su nombre.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';


-- 32. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio', fabricante.nombre AS 'Nombre del Fabricante'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;


-- 33. Devuelve un listado con el código y el nombre de fabricante, solo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.codigo AS 'Código del Fabricante', fabricante.nombre AS 'Nombre del Fabricante'
FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante;


-- 34. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado tendrá que mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.codigo AS 'Código del Fabricante', fabricante.nombre AS 'Nombre del Fabricante', COUNT(producto.codigo) AS 'Cantidad de Productos'
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo, fabricante.nombre;


-- 35. Devuelve un listado donde solo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.codigo AS 'Código del Fabricante', fabricante.nombre AS 'Nombre del Fabricante'
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;


-- 36. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio'
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';


-- 37. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);


-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre AS 'Nombre del Producto'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo'
ORDER BY producto.precio DESC
LIMIT 1;


-- 39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre AS 'Nombre del Producto'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;


-- 40. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);


-- 41. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT producto.nombre AS 'Nombre del Producto', producto.precio AS 'Precio'
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
AND producto.precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Asus'
    )
);
