# Creación de la base de datos
CREATE DATABASE platzi_operation;
/*
Query OK, 1 row affected (0.000 sec)
*/
# Genera warning pero el resultado es "QUERY OK"
CREATE DATABASE IF NOT EXISTS platzi_operation;
/*
Query OK, 0 rows affected, 1 warning (0.000 sec)
*/
# Para observar los warnings
SHOW WARNINGS;
/*
+-------+------+-----------------------------------------------------------+
| Level | Code | Message                                                   |
+-------+------+-----------------------------------------------------------+
| Note  | 1007 | Can't create database 'platzi_operation'; database exists |
+-------+------+-----------------------------------------------------------+
1 row in set (0.000 sec)
*/
# Genera un error, ya que existe la bases de datos el resultado es "ERROR 1007 (HY000): Can't create database 'platzi_operation'; database exists"
CREATE DATABASE platzi_operation;
/*
ERROR 1007 (HY000): Can't create database 'platzi_operation'; database exists
*/
# Para observar todas las bases de datos que existen
SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| platzi_operation   |
+--------------------+
4 rows in set (0.000 sec)
*/
# Utilizar la base de datos(el puntero)
USE platzi_operation;
/*
Database changed
*/
# Observar las tablas que existe en la base de datos
SHOW TABLES;
/*
Empty set (0.000 sec)
*/
# LIBRERÍA
## tabla libros
CREATE TABLE IF NOT EXISTS books (
    `book_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `author_id` INTEGER UNSIGNED,
    `title` VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    `language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    `cover_url` VARCHAR(500),
    `price` DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    `sellable` TINYINT(1) DEFAULT 1,
    `copies` INTEGER NOT NULL DEFAULT 1,
    `description` TEXT
);
/*
Query OK, 0 rows affected (0.004 sec)
*/
## tabla autores
CREATE TABLE IF NOT EXISTS  authors (
    `author_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `nationality` VARCHAR(3)
);
/*
Query OK, 0 rows affected (0.004 sec)
*/

# Chequear las tablas que tenemos
SHOW TABLES;
/*
+----------------------------+
| Tables_in_platzi_operation |
+----------------------------+
| authors                    |
| books                      |
+----------------------------+
2 rows in set (0.000 sec)
*/

# Borrar la tabla. CUIDADO!!!!!! con DROP!!!!!!!
DROP TABLE books;
/*
Query OK, 0 rows affected (0.002 sec)
*/
# Comando para tener información de una tabla DESC=DESCRIBE
DESCRIBE books;
DESC books;
DESCRIBE authors;
DESC authors;
/*
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| author_id   | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100)     | NO   |     | NULL    |                |
| nationality | varchar(3)       | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+
*/
# Mostrar mas información sobre una tabla
SHOW FULL COLUMNS  FROM books;
/*
+-------------+------------------+-------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| Field       | Type             | Collation         | Null | Key | Default | Extra          | Privileges                      | Comment            |
+-------------+------------------+-------------------+------+-----+---------+----------------+---------------------------------+--------------------+
| book_id     | int(10) unsigned | NULL              | NO   | PRI | NULL    | auto_increment | select,insert,update,references |                    |
| author_id   | int(10) unsigned | NULL              | YES  |     | NULL    |                | select,insert,update,references |                    |
| title       | varchar(100)     | latin1_swedish_ci | NO   |     | NULL    |                | select,insert,update,references |                    |
| year        | int(10) unsigned | NULL              | NO   |     | 1900    |                | select,insert,update,references |                    |
| language    | varchar(2)       | latin1_swedish_ci | NO   |     | es      |                | select,insert,update,references | ISO 639-1 Language |
| cover_url   | varchar(500)     | latin1_swedish_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
| price       | double(6,2)      | NULL              | NO   |     | 10.00   |                | select,insert,update,references |                    |
| sellable    | tinyint(1)       | NULL              | YES  |     | 1       |                | select,insert,update,references |                    |
| copies      | int(11)          | NULL              | NO   |     | 1       |                | select,insert,update,references |                    |
| description | text             | latin1_swedish_ci | YES  |     | NULL    |                | select,insert,update,references |                    |
+-------------+------------------+-------------------+------+-----+---------+----------------+---------------------------------+--------------------+
10 rows in set (0.001 sec)
*/

# TABLE de clientes. UNIQUE, importante. ENUM es una lista de opciones que se puede tomar.
CREATE TABLE IF NOT EXISTS clients
(
    `client_id`  INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`       VARCHAR(50)           NOT NULL,
    `email`      VARCHAR(100)          NOT NULL UNIQUE,
    `birthdate`  DATETIME,
    `gender`     ENUM ('M', 'F', 'ND') NOT NULL,
    `active`     TINYINT(1)            NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC clients;
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
# Creación de la tabla operaciones
CREATE TABLE IF NOT EXISTS operations (
    `operation_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `book_id` INTEGER UNSIGNED,
    `client_id` INTEGER UNSIGNED,
    `type` ENUM('B', 'R', 'S') NOT NULL  COMMENT 'B=Borrowed , R=Returned , S=Sold',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `finished` TINYINT(1) NOT NULL
);
SHOW FULL COLUMNS FROM operations;
/*
+--------------+-------------------+-------------------+------+-----+---------------------+-------------------------------+---------------------------------+----------------------------------+
| Field        | Type              | Collation         | Null | Key | Default             | Extra                         | Privileges                      | Comment                          |
+--------------+-------------------+-------------------+------+-----+---------------------+-------------------------------+---------------------------------+----------------------------------+
| operation_id | int(10) unsigned  | NULL              | NO   | PRI | NULL                | auto_increment                | select,insert,update,references |                                  |
| book_id      | int(10) unsigned  | NULL              | YES  |     | NULL                |                               | select,insert,update,references |                                  |
| client_id    | int(10) unsigned  | NULL              | YES  |     | NULL                |                               | select,insert,update,references |                                  |
| type         | enum('B','R','S') | latin1_swedish_ci | NO   |     | NULL                |                               | select,insert,update,references | B=Borrowed , R=Returned , S=Sold |
| created_at   | timestamp         | NULL              | NO   |     | current_timestamp() |                               | select,insert,update,references |                                  |
| updated_at   | timestamp         | NULL              | NO   |     | current_timestamp() | on update current_timestamp() | select,insert,update,references |                                  |
| finished     | tinyint(1)        | NULL              | NO   |     | NULL                |                               | select,insert,update,references |                                  |
+--------------+-------------------+-------------------+------+-----+---------------------+-------------------------------+---------------------------------+----------------------------------+
7 rows in set (0.001 sec)
*/