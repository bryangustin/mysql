-- création d'une base de données

CREATE DATABASE PI2019Cexemples CHARACTER SET 'utf8';

-- Préciser la base de données a utiliser

USE PI2019Cexemples;

-- création d'une table

CREATE TABLE actrices (
	a_id INT PRIMARY KEY,
    a_nom CHAR(20) NOT NULL
);

-- insertion de données dans la table

INSERT INTO actrices VALUES(1,'Angela');
INSERT INTO actrices VALUES(2,'Pamela');

-- Afficher les données

SELECT a_id, a_nom FROM actrices;

-- modification des données

UPDATE actrices SET a_nom='Michelle' WHERE a_id=2;

-- supprimer des données

DELETE FROM actrices WHERE a_id=1;

-- SHOW

SHOW DATABASES;
SHOW TABLES;
SHOW GRANTS FOR 'root'@'localhost';


