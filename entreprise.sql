-- Création de la DB

create database proforma_articles_2019C CHARACTER SET 'utf8';

-- Utilisation de la DB

use proforma_articles_2019C;

-- Création de la table fournisseurs

create table fournisseurs(
	four_num char(5) primary key,
    four_nom varchar(25) not null unique,
	four_adresse varchar(50),
	four_cp smallint check (four_cp > 0),
	four_date date check (four_date <= CURRENT_DATE)
);

-- Insertion des données dans la table fournisseurs

INSERT INTO fournisseurs VALUES( 'F0001', 'Dubois SA', 'rue du puits perdu, 58', 4020, '1950/01/01');
INSERT INTO fournisseurs VALUES( 'F0002', 'Les libraires réunis', 'avenue de la boule, 54', 1000, '1978/08/15');
INSERT INTO fournisseurs VALUES( 'F0003', 'IMPRIMAT', 'rue du pont, 45', 4400, '1995/09/02');
INSERT INTO fournisseurs VALUES( 'F0004', 'Mac Gregor', 'rue haute, 54', 1000, '1987/08/01');
INSERT INTO fournisseurs VALUES( 'F0005', 'Bureautique 2000', 'rue du bassin, 254', 4000, '1996/01/01');

SELECT * FROM fournisseurs;

-- Création de la table articles

create table articles (
	art_num char(8) primary key,
	art_nom varchar(30) not null,
	art_coul varchar(20),
	art_stock integer,
	art_seuil integer,
	art_pa integer not null,
	art_four char(5) references fournisseurs
);

-- Insertion des données dans la table articles

INSERT INTO articles VALUES('A01', 'agrafeuse', 'ROUGE', 10, 2, 229, 'F0004');
INSERT INTO articles VALUES('A02', 'calculatrice', 'NOIR', 5, 20, 635, 'F0001');
INSERT INTO articles VALUES('A03', 'perforatrice', 'BLANC', 3, 2, 230, 'F0004');
INSERT INTO articles VALUES('A04', 'lampe de bureau', 'ROUGE', 3, 10, 349, 'F0005');
INSERT INTO articles VALUES('A05', 'Stylo', 'BLANC', 30, 20, 39, 'F0005');
INSERT INTO articles VALUES('A06', 'STYLO', 'BLEU', 30, 10, 49, 'F0005');
INSERT INTO articles VALUES('A07', '3 stylos', 'VERT', 19, 10, 99, 'F0005');
INSERT INTO articles VALUES('A08', 'bloc de feuilles quadrillées', default, 7, 12, 70, 'F0003');
INSERT INTO articles VALUES('A09', 'bloc de feuilles lignées', default, 11, 11, 85, 'F0003');
INSERT INTO articles VALUES('A10', 'classeur 10 cm', 'GRIS', 21, 30, 50, 'F0002');
INSERT INTO articles VALUES('A11', 'classeur 5 cm', 'Noir', 19, 30, 50, 'F0002');
INSERT INTO articles VALUES('A12', 'crayon', 'ROUGE', 95, 10, 35, 'F0002');
INSERT INTO articles VALUES('A13', 'marqueur', 'VERT', 90, 10, 35, 'F0002');
INSERT INTO articles VALUES('A14', 'marqueur', 'BLEU', 80, 10, 35, 'F0002');
INSERT INTO articles VALUES('A15', 'crayon', 'NOIR', 45, 10, 35, 'F0002');

-- Vérification des données insérées

SELECT * FROM articles;
SELECT * FROM fournisseurs;

-- exercice 
-- 1 
select art_num,art_nom,art_coul,art_pa from articles
where art_coul != 'vert' and (art_pa  between 10 and 100)
order by art_nom desc,art_num asc;
-- 2
select art_num,art_nom,art_stock,art_seuil from articles
where art_stock<art_seuil;
-- 3 problème
select four_nom,four_adresse from fournisseurs
where four_adresse  like '% 54%'
order by four_nom asc;
-- 4
select art_nom,art_coul,art_pa from articles
where (art_coul = 'rouge'and art_pa < 75) or art_coul is null
order by art_num asc;
-- 5
select * from fournisseurs
where four_nom like '%E%E%' and four_cp = 1000;
-- 6
select art_num,art_nom,(art_seuil - art_stock) as 'diff' from articles
where art_stock < art_seuil
order by art_num asc;
-- 7
select * from articles
where art_coul = 'rouge' and art_stock > art_seuil and art_nom != '%c%';
-- 8
select * from articles
where art_nom like '%stylo%';
-- 9
select * from articles
where art_four = 'F0001' or art_four = 'F0002' or art_four = 'F0003';
-- 10
select * from fournisseurs
where four_date < '1990-01-01' and four_cp not in(1000,4000);
-- 11
select group_concat(distinct upper(left(art_nom,1)),lower(substring(art_nom,2,lenght(art_nom))),'de couleur',lower(art_coul)) from articles
where art_coul is not null;
-- 12
select four_nom,year(now()) - year(four_date) as 'année' from fournisseurs;
-- 13
select distinct art_nom from articles;
-- 14 nononononon
select distinct art_nom, (art_nom + art_stock) from articles;
-- 15

-- 16

-- 17

-- 18

-- partie 2

-- 1
select art_nom from articles
union
select four_nom from fournisseurs;
-- 2
