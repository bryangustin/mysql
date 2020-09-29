CREATE TABLE animaux (
	ani_id INT primary key auto_increment,
    ani_espece varchar(100) not null,
    ani_genre enum('M','F') not null,
    ani_ddn datetime not null,
    ani_nom varchar(100) not null,
    ani_commentaires text
);

INSERT INTO animaux (ani_espece, ani_genre, ani_ddn, ani_nom, ani_commentaires) VALUES 
('chien', 'F', '2008-02-20 15:45:00' , 'Canaille', NULL),
('chien', 'F','2009-05-26 08:54:00'  , 'Cali', NULL),
('chien', 'F','2007-04-24 12:54:00' , 'Rouquine', NULL),
('chien', 'F','2009-05-26 08:56:00' , 'Fila', NULL),
('chien', 'F','2008-02-20 15:47:00' , 'Anya', NULL),
('chien', 'F','2009-05-26 08:50:00' ,'Louya' , NULL),
('chien', 'F', '2008-03-10 13:45:00','Welva' , NULL),
('chien', 'F','2007-04-24 12:59:00' ,'Zira' , NULL),
('chien', 'F', '2009-05-26 09:02:00','Java' , NULL),
('chien', 'M','2007-04-24 12:45:00' ,'Balou' , NULL),
('chien', 'M','2008-03-10 13:43:00' ,'Pataud' , NULL),
('chien', 'M','2007-04-24 12:42:00' , 'Bouli', NULL),
('chien', 'M', '2009-03-05 13:54:00','Zoulou' , NULL),
('chien', 'M','2007-04-12 05:23:00' ,'Cartouche' , NULL),
('chien', 'M', '2006-05-14 15:50:00', 'Zambo', NULL),
('chien', 'M','2006-05-14 15:48:00' ,'Samba' , NULL),
('chien', 'M', '2008-03-10 13:40:00','Moka' , NULL),
('chien', 'M', '2006-05-14 15:40:00','Pilou' , NULL),
('chat', 'M','2009-05-14 06:30:00' , 'Fiero', NULL),
('chat', 'M','2007-03-12 12:05:00' ,'Zonko', NULL),
('chat', 'M','2008-02-20 15:45:00' , 'Filou', NULL),
('chat', 'M','2007-03-12 12:07:00' , 'Farceur', NULL),
('chat', 'M','2006-05-19 16:17:00' ,'Caribou' , NULL),
('chat', 'M','2008-04-20 03:22:00' , 'Capou', NULL),
('chat', 'M','2006-05-19 16:56:00' , 'Raccou', 'Pas de queue depuis la naissance');

select * from animaux;

-- operateur de comparaison

select * from animaux where ani_ddn < '2008-01-01'
	order by ani_ddn;
    
-- animaux tous selectionner sauf les pussycats

select* from animaux where ani_espece != 'chat';

-- tous les animaux qui n'ont pas de commentaires

select * from animaux where ani_commentaires is null;

-- tous les chien qui sont male

select * from animaux where ani_espece='chien' and ani_genre='M';

-- trier chiens dabord femelle puis male et ensuite par nom

select * from animaux where ani_espece='chien'
order by ani_genre desc, ani_nom asc;

-- afficher les animaux entre deux dates

select * from animaux
where ani_ddn between '2008-01-05' and '2009-03-23';

-- animaux avec nom precis

select * from animaux where  ani_nom in ('Moka','Bilba','Balou');

-- 5 derniers

select * from animaux order by ani_ddn desc limit 5;

-- -- 5 derniers a partir du 3eme

select * from animaux order by ani_ddn desc limit 3,5;

-- afficher les animaux dont le nom contient un "lou"

select * from animaux where ani_nom like '%lou%';