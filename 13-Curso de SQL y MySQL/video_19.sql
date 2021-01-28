-- ¿Qué nacionalidades hay?
SELECT DISTINCT `nationality` AS `nationality`
FROM authors
WHERE nationality IS NOT NULL;

-- ¿Cuantos escritores hay de cada nacionalidad?

-- - Incluido sin nacionalidad
SELECT `nationality`, COUNT(1) AS `num_of_writters`
FROM authors
GROUP BY nationality
ORDER BY 2 DESC;
-- - Sólo los que tengan nacionalidad
SELECT `nationality`, COUNT(1) AS `num_of_writters`
FROM authors
WHERE nationality IS NOT NULL
GROUP BY nationality
ORDER BY 2 DESC;

-- ¿Cuantos libros hay de cada nacionalidad?
SELECT a.nationality, COUNT(b.book_id)
FROM authors AS a
RIGHT JOIN books AS b
    on a.author_id = b.author_id
GROUP BY a.nationality
ORDER BY 2 DESC ;

-- ¿Cuál es el promedio/desviación estándar del precio de libros?
SELECT AVG(price) AS `average`, STD(price) AS `stantard_desviation` FROM books;


-- ¿Cuál es el promedio/desviación estándar de la cantidad de autores por nacionalidad?
SELECT nationality
FROM authors
GROUP BY nationality;

-- ¿Cuál es el precio máximo y mínimo de un libro?
SELECT MAX(price) AS `max_price`, MIN(price) AS `min_price` FROM books;

-- ¿Cómo quedaría el reporte de préstamos?