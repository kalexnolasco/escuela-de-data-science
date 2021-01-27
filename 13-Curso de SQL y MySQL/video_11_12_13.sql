SHOW TABLES;
/*
+----------------------------+
| Tables_in_platzi_operation |
+----------------------------+
| authors                    |
| books                      |
| clients                    |
| operations                 |
+----------------------------+
4 rows in set (0.000 sec)
*/
DESC authors;
/*
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| author_id   | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100)     | NO   |     | NULL    |                |
| nationality | varchar(3)       | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
3 rows in set (0.001 sec)
*/
DESC  books;
/*
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| book_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| author_id   | int(10) unsigned | YES  |     | NULL    |                |
| title       | varchar(100)     | NO   |     | NULL    |                |
| year        | int(10) unsigned | NO   |     | 1900    |                |
| language    | varchar(2)       | NO   |     | es      |                |
| cover_url   | varchar(500)     | YES  |     | NULL    |                |
| price       | double(6,2)      | NO   |     | 10.00   |                |
| sellable    | tinyint(1)       | YES  |     | 1       |                |
| copies      | int(11)          | NO   |     | 1       |                |
| description | text             | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
10 rows in set (0.001 sec)
*/
DESC  clients;
/*
+------------+--------------------+------+-----+---------------------+-------------------------------+
| Field      | Type               | Null | Key | Default             | Extra                         |
+------------+--------------------+------+-----+---------------------+-------------------------------+
| client_id  | int(10) unsigned   | NO   | PRI | NULL                | auto_increment                |
| name       | varchar(50)        | NO   |     | NULL                |                               |
| email      | varchar(100)       | NO   | UNI | NULL                |                               |
| birthdate  | datetime           | YES  |     | NULL                |                               |
| gender     | enum('M','F','ND') | NO   |     | NULL                |                               |
| active     | tinyint(1)         | NO   |     | 1                   |                               |
| created_at | timestamp          | NO   |     | current_timestamp() |                               |
| updated_at | timestamp          | NO   |     | current_timestamp() | on update current_timestamp() |
+------------+--------------------+------+-----+---------------------+-------------------------------+
8 rows in set (0.001 sec)
  */
# Comando INSERT
## La recomendada
INSERT INTO authors(`author_id`, `name`, `nationality`)
VALUES(NULL, 'Juan Rulfo', 'MEX');
## También se puede ingresar algunas columnas
INSERT INTO authors(`name`, `nationality`)
VALUES('Gabriel García Márquez', 'COL');
## Opción válida pero no se recomienda
INSERT INTO authors VALUES(NULL, 'Juan Gabriel Vasquez', 'COL');
# Mostrar los inserst
SELECT * FROM authors;
/*
+-----------+----------------------+-------------+
| author_id | name                 | nationality |
+-----------+----------------------+-------------+
|         1 | Juan Rulfo           | MEX         |
|         2 | Gabriel Garc Mrquez  | COL         |
|         3 | Juan Gabriel Vasquez | COL         |
+-----------+----------------------+-------------+
3 rows in set (0.000 sec)
*/
# inserción múltiple (de 50 en 50 es un número mágico,*recomendado*)
INSERT INTO authors(`name`, `nationality`)
VALUES('Julio Cortázar', 'ARG'),
       ('Isabel Allende', 'CHI'),
       ('Octavio Paz', 'MEX'),
       ('Juan Carlos Onetti', 'URU');
# insertar un id definido
INSERT INTO authors (`author_id`, `name`)
VALUES(16, 'PABLO NERUDA');
# Mostrar todos los inserts
SELECT * FROM authors;
/*
+-----------+----------------------+-------------+
| author_id | name                 | nationality |
+-----------+----------------------+-------------+
|         1 | Juan Rulfo           | MEX         |
|         2 | Gabriel Garc Mrquez  | COL         |
|         3 | Juan Gabriel Vasquez | COL         |
|         4 | Julio Cortzar        | ARG         |
|         5 | Isabel Allende       | CHI         |
|         6 | Octavio Paz          | MEX         |
|         7 | Juan Carlos Onetti   | URU         |
|        16 | PABLO NERUDA         | NULL        |
+-----------+----------------------+-------------+
8 rows in set (0.000 sec)
*/
# Insertando en la tabla clientes
INSERT INTO `clients`(`client_id`, `name`, `email`, `birthdate`, `gender`, `active`) VALUES
	(1,'Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),
	(2,'Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1),
	(3,'Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1),
	(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);
/*
Query OK, 4 rows affected (0.001 sec)
Records: 4  Duplicates: 0  Warnings: 0
*/
# Mostar datos del cliente con id 4
SELECT * FROM clients WHERE client_id=4;
/*
+-----------+---------------+------------------------------+---------------------+--------+--------+---------------------+---------------------+
| client_id | name          | email                        | birthdate           | gender | active | created_at          | updated_at          |
+-----------+---------------+------------------------------+---------------------+--------+--------+---------------------+---------------------+
|         4 | Pedro Sanchez | Pedro.78522059J@random.names | 1992-01-31 00:00:00 | M      |      1 | 2021-01-27 08:51:40 | 2021-01-27 08:51:40 |
+-----------+---------------+------------------------------+---------------------+--------+--------+---------------------+---------------------+
1 row in set (0.000 sec)
*/
# OJITO de forma mas legible, de forma columnar
SELECT * FROM clients WHERE client_id=4\G
/*
*************************** 1. row ***************************
 client_id: 4
      name: Pedro Sanchez
     email: Pedro.78522059J@random.names
 birthdate: 1992-01-31 00:00:00
    gender: M
    active: 1
created_at: 2021-01-27 08:51:40
updated_at: 2021-01-27 08:51:40
1 row in set (0.000 sec)
*/
##### NUNCA UTILIZARRRRRRRR --> ON DUPLICATE KEY IGNORE ALL
INSERT INTO `clients`(`name`, `email`, `birthdate`, `gender`, `active`)
VALUES('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
ON DUPLICATE KEY UPDATE active=VALUES(active);
# Veamos como se actualiza el campo `active`
SELECT * FROM clients WHERE client_id=4\G
/*
*************************** 1. row ***************************
 client_id: 4
      name: Pedro Sanchez
     email: Pedro.78522059J@random.names
 birthdate: 1992-01-31 00:00:00
    gender: M
    active: 0
created_at: 2021-01-27 08:51:40
updated_at: 2021-01-27 09:02:05
1 row in set (0.000 sec)
*/
# Insert con select anidadas
INSERT INTO `books` (`title`, `author_id`)
VALUES ('El laberinto de la Soledad', 6);
INSERT INTO `books` (`title`, `author_id`, `year`)
VALUES ('Vuelta al laberinto de la Soledad',
        (SELECT `author_id` FROM `authors` WHERE `name`='Octavio Paz'),
        1960);