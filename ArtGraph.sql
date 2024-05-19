USE master;
go

DROP DATABASE IF EXISTS Art;
go

CREATE DATABASE Art;
go

USE Art;
go

--------Создаем таблицы узлов--------

CREATE TABLE Artist
(
 ArtistID Int NOT NULL PRIMARY KEY,
 Surname Nvarchar(30) NOT NULL,
 Firstname Nvarchar(30) NOT NULL,
 Patronymic Nvarchar(30),
) AS NODE;

CREATE TABLE Painting
(
PaintingID INT NOT NULL PRIMARY KEY,
"Name" NVARCHAR(50) NOT NULL,
"Year" SMALLINT,
) AS NODE;


CREATE TABLE Gallery
(
GalleryID INT NOT NULL PRIMARY KEY,
"Name" NVARCHAR(50) NOT NULL,Country NVARCHAR(30) NOT NULL) AS NODE;
--------Создаем таблицы ребер--------

CREATE TABLE CreatedBy AS EDGE;
CREATE TABLE ExhibitedIn AS EDGE;
CREATE TABLE ExhibitsIn AS EDGE; 

ALTER TABLE CreatedBy
ADD CONSTRAINT EC_CreatedBy CONNECTION (Painting TO Artist);ALTER TABLE ExhibitedIn
ADD CONSTRAINT EC_ExhibitedIn CONNECTION (Painting TO Gallery);ALTER TABLE ExhibitsIn
ADD CONSTRAINT EC_ExhibitsIn CONNECTION (Artist TO Gallery);
-------Заполняем таблицы узлов-------

INSERT INTO Artist (ArtistID, Surname, Firstname, Patronymic)
VALUES (1, 'Репин', 'Илья', 'Ефимович'),
       (2, 'Айвазовский', 'Иван', 'Константинович'),
       (3, 'Малевич', 'Казимир', 'Северинович'),
       (4, 'Шишкин', 'Иван', 'Иванович'),
       (5, 'Да Винчи', 'Леонардо', NULL),
	   (6, 'Дюрер', 'Альбрехт', NULL),
       (7, 'Васнецов', 'Виктор', 'Михайлович'),
       (8, 'Веласкес', 'Диего', NULL),
       (9, 'Моне', 'Клод', NULL),
       (10, 'Шагал', 'Марк', 'Захарович');
go

INSERT INTO Painting (PaintingID, "Name", "Year")
VALUES (1, 'Иван Грозный и сын его Иван', 1885),      
	   (2, 'Бурлаки на Волге', 1873),
       (3, 'Девятый вал', 1850),						
	   (4, 'Буря на Азовском море в апреле 1886 года', 1887),
       (5, 'Супрематизм', 1916), 
	   (6, 'Черный супрематический квадрат', 1915),
       (7, 'В заповедной дубовой роще Петра Великого', 1886),        
	   (8, 'Утро в сосновом бору', 1889),
       (9, 'Мона Лиза', 1519),						
	   (10, 'Благовещение', 1475),
	   (11,'Мадонна в скалах', 1486),
	   (12, 'Христос среди учителей', 1506),			
	   (13, 'Адам и Ева', 1504),
       (14, 'Богатыри', 1898),							
	   (15, 'Менины', 1656),								
	   (16, 'Водонос', 1622),
	   (17, 'Вокзан сен Лазар', 1877),									
	   (18, 'Дорожка в саду Живерни', 1902),
	   (19, 'Пруд с лилиями', 1899),
	   (20, 'Серый дом', 1917);						
go

INSERT INTO Gallery (GalleryID, "Name", Country)
VALUES (1, 'Государственная Третьяковская галерея', 'Россия'),
       (2, 'Государственный Русский музей', 'Россия'),
       (3, 'Национальный художественный музей', 'Беларусь'),
       (4, 'Музей Тиссена-Борнемисы', 'Испания'),
       (5, 'Государственный Эрмитаж', 'Россия'),
	   (6, 'Музей Лувра', 'Франция'),
       (7, 'Лондонская национальная галерея', 'Великобритания'),
       (8, 'Галерея Уффици', 'Италия'),
       (9, 'Галерея Бельведер', 'Австрия'),
       (10, 'Музей Прадо', 'Испания');
go

-------Заполняем таблицы ребер-------

INSERT INTO CreatedBy ($from_id, $to_id)
VALUES (
	(SELECT $node_id FROM Painting WHERE PaintingID = 1),
	(SELECT $node_id FROM Artist WHERE ArtistID = 1)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 2),
	(SELECT $node_id FROM Artist WHERE ArtistID = 1)
	),(
    (SELECT $node_id FROM Painting WHERE PaintingID = 3),
	(SELECT $node_id FROM Artist WHERE ArtistID = 2)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 4),
	(SELECT $node_id FROM Artist WHERE ArtistID = 2)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 5),
	(SELECT $node_id FROM Artist WHERE ArtistID = 3)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 6),
	(SELECT $node_id FROM Artist WHERE ArtistID = 3)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 7),
	(SELECT $node_id FROM Artist WHERE ArtistID = 4)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 8),
	(SELECT $node_id FROM Artist WHERE ArtistID = 4)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 9),
	(SELECT $node_id FROM Artist WHERE ArtistID = 5)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 10),
	(SELECT $node_id FROM Artist WHERE ArtistID = 5)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 11),
	(SELECT $node_id FROM Artist WHERE ArtistID = 5)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 12),
	(SELECT $node_id FROM Artist WHERE ArtistID = 6)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 13),
	(SELECT $node_id FROM Artist WHERE ArtistID = 6)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 14),
	(SELECT $node_id FROM Artist WHERE ArtistID = 7)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 15),
	(SELECT $node_id FROM Artist WHERE ArtistID = 8)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 16),
	(SELECT $node_id FROM Artist WHERE ArtistID = 8)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 17),
	(SELECT $node_id FROM Artist WHERE ArtistID = 9)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 18),
	(SELECT $node_id FROM Artist WHERE ArtistID = 9)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 19),
	(SELECT $node_id FROM Artist WHERE ArtistID = 9)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 20),
	(SELECT $node_id FROM Artist WHERE ArtistID = 10));
go


INSERT INTO ExhibitedIn ($from_id, $to_id)
VALUES (
	(SELECT $node_id FROM Painting WHERE PaintingID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 14),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
    (SELECT $node_id FROM Painting WHERE PaintingID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 3),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 5),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 4),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 7),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 12),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 20),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 5)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 9),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 6)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 17),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 11),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 19),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 10),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 16),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 18),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 9)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 13),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 10)
	),(
	(SELECT $node_id FROM Painting WHERE PaintingID = 15),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 10));
go

INSERT INTO ExhibitsIn ($from_id, $to_id)
VALUES (
	(SELECT $node_id FROM Artist WHERE ArtistID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 3),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 4),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 7),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 10),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 1)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 3),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 4),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 7),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 10),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 2)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 4),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 3)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 5)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 5)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 9),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 5)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 9),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 10),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 4)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 5),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 6)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 6)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 6)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 9),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 5),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 1),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 7)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 5),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 2),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 10),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 8)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 9),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 9)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 5),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 10)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 6),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 10)
	),(
	(SELECT $node_id FROM Artist WHERE ArtistID = 8),
	(SELECT $node_id FROM Gallery WHERE GalleryID = 10));
go

------Запросы с функцией MATCH-------

-- 1. Названия картин Клода Моне

SELECT A."Surname" 
FROM Artist AS A,
	 ExhibitsIn AS E,
	 Gallery AS G
WHERE MATCH (A-(E)->G) AND G.GalleryID = 8



SELECT P."Name" 
FROM Painting AS P,
	 CreatedBy AS C,
	 Artist AS A
WHERE MATCH (P-(C)->A) AND A.FirstName = 'Клод' AND A.Surname = 'Моне'

-- 2. Названия всех музеев, в которых выставляется Леонардо да Винчи

SELECT G."Name" 
FROM Gallery AS G,
	 ExhibitsIn AS E,
	 Artist AS A
WHERE MATCH (A-(E)->G) AND A.FirstName = 'Леонардо' AND A.Surname  = 'Да Винчи'

-- 3. Вся информация о картинах, которые выставляются в Третьяковской галерее

SELECT P."Name", P."Year" 
FROM Painting AS P,
	 ExhibitedIn AS E,
	 Gallery AS G
WHERE MATCH (P-(E)->G) and G."Name" = 'Государственная Третьяковская галерея'

-- 4. Cтраны, в которых выставляется Марк Шагал

SELECT DISTINCT G.Country 
FROM Gallery AS G,
	 ExhibitsIn AS E,
	 Artist AS A
WHERE MATCH (A-(E)->G) and A.FirstName = 'Марк' AND A.Surname = 'Шагал'

-- 5. Названия всех музеев, в которых есть перечисленные картины Ильи Репина

SELECT DISTINCT G."Name" 
FROM Gallery AS G, 
	 CreatedBy AS C,
	 Painting AS P,
	 ExhibitedIn AS E,
	 Artist AS A
WHERE MATCH (G<-(E)-P-(C)->A) and A.FirstName = 'Илья' AND A.Surname = 'Репин'

---Запросы с функцией SHORTEST_PATH---

SELECT 
    A.Surname AS ArtistName,
    STRING_AGG(G."Name", '->') WITHIN GROUP (GRAPH PATH) AS GalleryPath
FROM 
    Artist AS A,
	Gallery FOR PATH AS G, 
	ExhibitsIn FOR PATH AS E
WHERE MATCH(SHORTEST_PATH(A(-(E)->G)+))
	and A.Surname = 'Репин';

SELECT 
    P."Name" AS ArtistName,
    STRING_AGG(A.Surname, '->') WITHIN GROUP (GRAPH PATH) AS GalleryPath
FROM 
    Painting AS P,
	Artist FOR PATH AS A, 
	CreatedBy FOR PATH AS C
WHERE MATCH(SHORTEST_PATH(P(-(C)->A){1,2}))
	and P."Name" = 'Серый дом';