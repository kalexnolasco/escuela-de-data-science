-- Listar los autores con ID entre 1 y 5
SELECT * FROM authors WHERE author_id>0 AND author_id<=5;
SELECT * FROM authors WHERE author_id BETWEEN 1 AND 5;

-- Listar los libros con author_id entre 1  y 5
SELECT `book_id`, `author_id`, `title` FROM books WHERE author_id BETWEEN 1 AND 5;

-- Listar nombre y titulo de libros mediante el JOIN de las tablas books y authors
SELECT b.book_id, a.author_id, a.name, b.title
FROM books AS b
INNER JOIN authors AS a
    on b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5;


INSERT INTO transactions (`transaction_id`,`book_id`,`client_id`,`type`,`finished`)
VALUES(1,12,34,'sell',1),
(2,54,87,'lend',0),
(3,3,14,'sell',1),
(4,1,54,'sell',1),
(5,12,81,'lend',1),
(6,12,81,'return',1),
(7,87,29,'sell',1);

--
SELECT * FROM transactions;
SELECT c.name, b.title, t.type
FROM transactions AS t
INNER JOIN books b
    on t.book_id = b.book_id
INNER JOIN clients c
    on t.client_id = c.client_id
WHERE c.gender='F' AND t.type='sell';

SELECT c.name, b.title, t.type
FROM transactions AS t
INNER JOIN books b
    on t.book_id = b.book_id
INNER JOIN clients c
    on t.client_id = c.client_id
WHERE c.gender='M' AND t.type IN ('sell', 'lend');

-- Ordenar por autor (ORDER BY) por default es ASC
SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
LEFT JOIN books b
    on a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;
/*
+-----------+--------------------+-------------+---------------------------------------+
| author_id | name               | nationality | title                                 |
+-----------+--------------------+-------------+---------------------------------------+
|         5 | Juan Rulfo         | MEX         | El llano en llamas                    |
|         4 | Chuck Palahniuk    | USA         | NULL                                  |
|         3 | Arthur Conan Doyle | GBR         | The - Vol II Complete Sherlock Holmes |
|         3 | Arthur Conan Doyle | GBR         | Estudio en escarlata                  |
|         3 | Arthur Conan Doyle | GBR         | The - Vol I Complete Sherlock Holmes  |
|         2 | Freddy Vega        | COL         | NULL                                  |
|         1 | Sam Altman         | USA         | The Startup Playbook                  |
|         1 | Sam Altman         | USA         | The Startup Playbook                  |
+-----------+--------------------+-------------+---------------------------------------+
8 rows in set (0.001 sec)
*/
SELECT a.name, a.nationality, COUNT(b.book_id) AS `number_of_books`
FROM authors AS a
LEFT JOIN books b
    on a.author_id = b.author_id
GROUP BY a.author_id
ORDER BY a.author_id DESC;





