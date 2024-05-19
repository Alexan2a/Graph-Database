USE master;
go

DROP DATABASE IF EXISTS Art;
go

CREATE DATABASE Art;
go

USE Art;
go

--------������� ������� �����--------

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
--------������� ������� �����--------

CREATE TABLE CreatedBy AS EDGE;
CREATE TABLE ExhibitedIn AS EDGE;
CREATE TABLE ExhibitsIn AS EDGE; 

ALTER TABLE CreatedBy
ADD CONSTRAINT EC_CreatedBy CONNECTION (Painting TO Artist);ALTER TABLE ExhibitedIn
ADD CONSTRAINT EC_ExhibitedIn CONNECTION (Painting TO Gallery);ALTER TABLE ExhibitsIn
ADD CONSTRAINT EC_ExhibitsIn CONNECTION (Artist TO Gallery);
-------��������� ������� �����-------

INSERT INTO Artist (ArtistID, Surname, Firstname, Patronymic)
VALUES (1, '�����', '����', '��������'),
       (2, '�����������', '����', '��������������'),
       (3, '�������', '�������', '�����������'),
       (4, '������', '����', '��������'),
       (5, '�� �����', '��������', NULL),
	   (6, '�����', '��������', NULL),
       (7, '��������', '������', '����������'),
       (8, '��������', '�����', NULL),
       (9, '����', '����', NULL),
       (10, '�����', '����', '���������');
go

INSERT INTO Painting (PaintingID, "Name", "Year")
VALUES (1, '���� ������� � ��� ��� ����', 1885),      
	   (2, '������� �� �����', 1873),
       (3, '������� ���', 1850),						
	   (4, '���� �� �������� ���� � ������ 1886 ����', 1887),
       (5, '�����������', 1916), 
	   (6, '������ ��������������� �������', 1915),
       (7, '� ���������� ������� ���� ����� ��������', 1886),        
	   (8, '���� � �������� ����', 1889),
       (9, '���� ����', 1519),						
	   (10, '������������', 1475),
	   (11,'������� � ������', 1486),
	   (12, '������� ����� ��������', 1506),			
	   (13, '���� � ���', 1504),
       (14, '��������', 1898),							
	   (15, '������', 1656),								
	   (16, '�������', 1622),
	   (17, '������ ��� �����', 1877),									
	   (18, '������� � ���� �������', 1902),
	   (19, '���� � �������', 1899),
	   (20, '����� ���', 1917);						
go

INSERT INTO Gallery (GalleryID, "Name", Country)
VALUES (1, '��������������� ������������� �������', '������'),
       (2, '��������������� ������� �����', '������'),
       (3, '������������ �������������� �����', '��������'),
       (4, '����� �������-���������', '�������'),
       (5, '��������������� �������', '������'),
	   (6, '����� �����', '�������'),
       (7, '���������� ������������ �������', '��������������'),
       (8, '������� ������', '������'),
       (9, '������� ���������', '�������'),
       (10, '����� �����', '�������');
go

-------��������� ������� �����-------

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

------������� � �������� MATCH-------

-- 1. �������� ������ ����� ����

SELECT A."Surname" 
FROM Artist AS A,
	 ExhibitsIn AS E,
	 Gallery AS G
WHERE MATCH (A-(E)->G) AND G.GalleryID = 8



SELECT P."Name" 
FROM Painting AS P,
	 CreatedBy AS C,
	 Artist AS A
WHERE MATCH (P-(C)->A) AND A.FirstName = '����' AND A.Surname = '����'

-- 2. �������� ���� ������, � ������� ������������ �������� �� �����

SELECT G."Name" 
FROM Gallery AS G,
	 ExhibitsIn AS E,
	 Artist AS A
WHERE MATCH (A-(E)->G) AND A.FirstName = '��������' AND A.Surname  = '�� �����'

-- 3. ��� ���������� � ��������, ������� ������������ � ������������� �������

SELECT P."Name", P."Year" 
FROM Painting AS P,
	 ExhibitedIn AS E,
	 Gallery AS G
WHERE MATCH (P-(E)->G) and G."Name" = '��������������� ������������� �������'

-- 4. C�����, � ������� ������������ ���� �����

SELECT DISTINCT G.Country 
FROM Gallery AS G,
	 ExhibitsIn AS E,
	 Artist AS A
WHERE MATCH (A-(E)->G) and A.FirstName = '����' AND A.Surname = '�����'

-- 5. �������� ���� ������, � ������� ���� ������������� ������� ���� ������

SELECT DISTINCT G."Name" 
FROM Gallery AS G, 
	 CreatedBy AS C,
	 Painting AS P,
	 ExhibitedIn AS E,
	 Artist AS A
WHERE MATCH (G<-(E)-P-(C)->A) and A.FirstName = '����' AND A.Surname = '�����'

---������� � �������� SHORTEST_PATH---

SELECT 
    A.Surname AS ArtistName,
    STRING_AGG(G."Name", '->') WITHIN GROUP (GRAPH PATH) AS GalleryPath
FROM 
    Artist AS A,
	Gallery FOR PATH AS G, 
	ExhibitsIn FOR PATH AS E
WHERE MATCH(SHORTEST_PATH(A(-(E)->G)+))
	and A.Surname = '�����';

SELECT 
    P."Name" AS ArtistName,
    STRING_AGG(A.Surname, '->') WITHIN GROUP (GRAPH PATH) AS GalleryPath
FROM 
    Painting AS P,
	Artist FOR PATH AS A, 
	CreatedBy FOR PATH AS C
WHERE MATCH(SHORTEST_PATH(P(-(C)->A){1,2}))
	and P."Name" = '����� ���';