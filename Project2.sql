/**********************************************************************************/
/*																				  */
/*	Date		Programer		Description										  */
/*--------------------------------------------------------------------------------*/
/*10-9-2020		Killian			Initial Implementation of the disk inventory DB.  */
/*10-16-2020	Killian			Add insert statements for all tables.			  */
/*10-22-2020	Killian			*/
/*																				  */
/**********************************************************************************/


--Create database

USE master;
DROP DATABASE IF EXISTS disk_inventoryKK;
GO
CREATE DATABASE disk_inventoryKK;
GO

USE disk_inventorykk;

--Create server login & database user
IF SUSER_ID (N'diskUserkk') IS NULL
	CREATE LOGIN diskUserkk WITH PASSWORD = 'Pa$$w0rd', DEFAULT_DATABASE = disk_inventoryKK;

DROP USER IF EXISTS diskUserkk;
CREATE USER diskUserkk;
ALTER ROLE db_datareader
	ADD MEMBER diskUserkk;

--Create tables
CREATE TABLE artist_type (
	artist_type_id INT NOT NULL PRIMARY KEY IDENTITY,
	description		NVARCHAR(60) NOT NULL 
);

CREATE TABLE disk_type (
	disk_type_id	INT NOT NULL PRIMARY KEY IDENTITY,
	description		NVARCHAR(60) NOT NULL
);

CREATE TABLE status (
	status_id		INT NOT NULL PRIMARY KEY IDENTITY,
	description		NVARCHAR(60) NOT NULL
);

CREATE TABLE genre (
	genre_id		INT NOT NULL PRIMARY KEY IDENTITY,
	description		NVARCHAR(60) NOT NULL
);

CREATE TABLE borrower (
	borrower_id		INT NOT NULL PRIMARY KEY IDENTITY,
	fname			NVARCHAR(60) NOT NULL,
	lname			NVARCHAR(60) NOT NULL,
	phone_num		varchar(15) NOT NULL
); 

CREATE TABLE artist (
	artist_id		INT NOT NULL PRIMARY KEY IDENTITY,
	fname			NVARCHAR(60) NOT NULL,
	lname			NVARCHAR(60) NULL,
	artist_type_id	INT NOT NULL REFERENCES artist_type(artist_type_id)
);

CREATE TABLE disk (
	disk_id			INT NOT NULL PRIMARY KEY IDENTITY,
	disk_name		NVARCHAR(60) NOT NULL,
	release_date	DATE NOT NULL,
	genre_id		INT NOT NULL REFERENCES genre(genre_id),
	status_id		INT NOT NULL REFERENCES status(status_id),
	disk_type_id	INT NOT NULL REFERENCES disk_type(disk_type_id)	
);

CREATE TABLE disk_has_borrower (
	borrower_id		INT NOT NULL REFERENCES borrower(borrower_id),
	disk_id			INT NOT NULL REFERENCES disk(disk_id),
	borrower_date	date NOT NULL,
	returned_date	date NULL,
	PRIMARY KEY (borrower_id, disk_id)
);

CREATE TABLE disk_has_artist (
	disk_id			INT NOT NULL REFERENCES disk(disk_id),
	artist_id		INT NOT NULL REFERENCES artist(artist_id),
	PRIMARY KEY (disk_id, artist_id)
);


/********************** Project 3 ***********************************/

--Inserts for artist_type - See Ch 7 Slide 12 or 13

INSERT INTO artist_type (description)
VALUES ('Solo');
INSERT INTO artist_type (description)
VALUES ('Groups');


--Inserts for disk_type - See Ch 7 Slide 12 or 13

INSERT INTO disk_type (description)
VALUES
('CD'),
('Vinyl'),
('8Track'),
('Cassette'),
('DVD');

--Inserts for genre - See Ch 7 Slide 12 or 13

INSERT INTO genre
VALUES
('Classic Rock'),
('Country'),
('Jazz'),
('AltRock'),
('Metal');

--Inserts for status

INSERT status
VALUES ('Available');
INSERT status
VALUES ('On loan');
INSERT status
VALUES ('Damaged');
INSERT status
VALUES ('Missing');

--Inserts for Borrower -1. Insert at least 20 rows of data into the table. 2. Delete only 1 row using a where clause.
INSERT borrower (fname, lname, phone_num)
VALUES	('Mickey', 'Mouse', '123-123-1234'),
		('Zofia ', 'Cooke', '222-222-1234'),
		('Salahuddin ', 'Justice', '202-555-0182'),
		('Joyce ', 'Horn', '202-555-0182'),
		('Devon ', 'Norton', '202-555-0171'),
		('Adeeb ', 'Massey', '202-555-0155'),
		('Frankie ', 'Cornish', '202-555-0138'),
		('Hamish ', 'Thorpe', '202-555-0174'),
		('Griffin ', 'Curtis', '202-555-0175'),
		('Brax ', 'Matthews', '202-555-0148'),
		('Paulina ', 'Turner', '202-555-0143'),
		('Najma ', 'Bannister', '202-555-0153'),
		('Cassius ', 'Baker', '202-555-0140'),
		('Alissia ', 'Connor', '202-555-0730'),
		('Jak ', 'Wills', '202-555-0626'),
		('Annie ', 'Whittaker', '202-555-0766'),
		('Kady ', 'Ferry', '202-555-0901'),
		('Angelo ', 'Munro', '202-555-0854'),
		('Eren ', 'Salazar', '202-555-0762'),
		('Danyal ', 'Noel', '202-555-0640');

--Delete 1 row. See ch7 slide 23.
DELETE borrower
WHERE borrower_id = 20;

--Insert artist rows. Artist table:
/*1. Insert at least 20 rows of data into the table						X
2. At least 1 artist is known by 1 name and is a group					X
3. At least 1 artist is known by 1 name and is an individual artist		X
4. At least 1 artist has only 2 words in the name						X
5. At least 1 artist has more than 2 words in the name 					X*/
INSERT Artist
VALUES ('Ozzy', 'Osbourne', 1);
INSERT Artist
VALUES ('Shinedown', NULL, 2);
INSERT Artist
VALUES ('Prince', NULL, 1);
INSERT Artist
VALUES ('Fiver Finger Death Punch', NULL, 2);
INSERT Artist
VALUES ('Willie', 'Nelson', 1);
INSERT Artist
VALUES ('Taylor', 'Swift', 1);
INSERT Artist
VALUES ('Alanis', 'Morrisette', 1);
INSERT Artist
VALUES ('Chris', 'Daughtry', 1);
INSERT Artist
VALUES ('The Cars', NULL, 2);
INSERT Artist
VALUES ('Black Sabbath', NULL, 2);
INSERT Artist
VALUES ('The Egales', NULL, 2);
INSERT Artist
VALUES ('Patsy', 'Cline', 2);
INSERT Artist
VALUES ('Pearl Jam', NULL, 1);
INSERT Artist
VALUES ('Collective Soul', NULL, 2);
INSERT Artist
VALUES ('Disturbed', NULL, 2);
INSERT Artist
VALUES ('Stone Temple Piolets', NULL, 1);
INSERT Artist
VALUES ('Breaking Benjamin', NULL, 2);
INSERT Artist
VALUES ('Seether', NULL, 2);
INSERT Artist
VALUES ('Audioslave', NULL, 2);
INSERT Artist
VALUES ('Temple of the Dog', NULL, 2);
INSERT Artist
VALUES ('Alice in Chains', NULL, 2);

--Disk table inserts.
/*1. Insert at least 20 rows of data into the table			X
2. update only 1 row using a where clause					X
3. At least 1 disk has only 1 word in the name				X
4. At least 1 disk has only 2 words in the name				X
5. At least 1 disk has more than 2 words in the name 		X*/
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Crazy Train', '1/1/1995', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('No More Tears', '11/21/1995', 2, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Red', '11/13/2008', 1, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Bare to the bone', '10/18/1984', 2, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Rocket science', '4/26/1985', 1, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('The bigger fish', '12/23/1985', 1, 1, 2);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('X marks the spot', '4/15/1986', 2, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Beads', '5/24/1986', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Speak of the god', '6/12/1987', 3, 2, 2);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Fifth chance', '9/3/1988', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Ice cold', '4/24/1989', 2, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Dark matters', '2/2/1993', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Calm after the storm', '4/8/1994', 4, 1, 2);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Form over function', '6/15/1995', 1, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Hand in hand', '9/26/1996', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Commercial brake', '3/17/1997', 1, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Final hour', '10/3/2003', 2, 1, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Curiosity', '3/3/2011', 1, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Decisions decisions', '9/19/2012', 4, 1, 2);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Here we go', '9/22/2014', 2, 2, 1);
INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
VALUES ('Rocket science', '4/26/1985', 1, 3, 1);

--Update 1 disk row - Ch 7 Slide 19
UPDATE disk
SET release_date = '6/21/2012'
WHERE  disk_name = 'Here we go'


--Inserts to disk_has_borrower f. DiskHasBorrower table:
/*
1. Insert at least 20 rows of data into the table
2. Insert at least 2 different disks
3. Insert at least 2 diffrenet borrowers
4. At least 1 disk has been borrowed by the same borrower 2 different times
5. At least 1 disk in the disk table does not have a related row here
6. At least1 disk must have at least 2 different rows here
7. At least 1 borrower in the borrower table does not have a releated row here
8. At least 1 borrower must have at least 2 different rows here
*/

INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (1, 1, '1-2-2012', '2-20-2012');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (2, 2, '10/18/2006', NULL);
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (3, 3, '6/1/2007', '6/5/2007');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (4, 4, '2/22/2008', '3/2/2008');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (5, 5, '3/17/2008', '3/25/2008');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (6, 6, '6/1/2009', '6/19/2009');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (7, 7, '11/19/2009', NULL);
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (8, 8, '12/2/2010', '12/12/2010');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (4, 9, '1/20/2011', '1/29/2011');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (10, 10, '3/4/2011', '3/8/2011');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (11, 11, '10/3/2011', '10/4/2011');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (12, 12, '11/9/2011', '11/15/2011');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (2, 13, '1/6/2012', '1/16/2012');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (14, 14, '3/5/2012', '3/15/2012');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (15, 10, '10/17/2012', NULL);
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (2, 16, '1/3/2018', '1/23/2018');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (17, 18, '9/14/2018', '9/18/2018');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (18, 5, '3/12/2019', '3/19/2019');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (19, 19, '10/29/2019', '11/5/2019');
INSERT disk_has_borrower (borrower_id, disk_id, borrower_date, returned_date)
VALUES (5, 10, '12/19/2019', '12/26/2019');

--Inserts to disk_has_artist
/*
1.	Insert at least 20 rows of data into the table
2.	 At least 1 disk must have at least 2 different artist rows here
3.	At least 1 artist must have at least 2 different disk rows here
4. Correct variation of disk & aritst data similar to DiskHasBorrower */
INSERT disk_has_artist (disk_id, artist_id)
VALUES (1, 1);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (2, 2);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (3, 3);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (4, 4);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (5, 5);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (6, 6);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (7, 7);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (8, 8);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (9, 9);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (10, 10);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (11, 11);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (5, 14);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (13, 13);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (7, 11);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (15, 15);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (9, 1);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (17, 17);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (18, 18);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (19, 19);
INSERT disk_has_artist (disk_id, artist_id)
VALUES (20, 20);

--Create a query to list the disks that are on loan and have not been returned.
/*
Sample Output:
Borrower_id Disk_id Borrowed_date Return_date
9 2 2012-04-02 NULL
9 4 2012-04-02 NULL*/

SELECT borrower_id, disk_id, borrower_date, returned_date
FROM disk_has_borrower
WHERE returned_date IS NULL;



--Project 4 starts here
--3. Show the disks in your database and any associated Individual artists only. 
--SELECT *					--See specs for columns page 93 shows how to override name
--FROM artist
--							--Join to disk_has_artist - See Ch 4 for join info
--							--Join to disk - Page 137 for explicit join
--WHERE artist_type_id = 1
--ORDER BY	;				
SELECT disk_name AS DiskName, release_date AS ReleaseDate, fname AS ArtistFirstName, lname AS ArtistLastName
FROM artist
JOIN disk_has_artist ON disk_has_artist.artist_id = artist.artist_id
JOIN disk ON disk.disk_id = disk_has_artist.disk_id
WHERE artist_type_id = 1
ORDER BY disk_name DESC;

--4. Create a view called View_Individual_Artist that shows the artists’ names and not group names. Include the artist id in the view definition but do not display the id in your output.

											--See create view syntax in Ch 13
											--See specs for columns
DROP VIEW IF EXISTS View_Individual_Artist
GO
CREATE VIEW View_Individual_Artist 
AS 
SELECT fname, lname, artist_id, artist_type_id
FROM artist
WHERE artist_type_id = 1
go

SELECT fname AS FirstName, lname AS LastName 
FROM View_Individual_Artist
go
							--See output for other specifications
							--See report output

--5. Show the disks in your database and any associated Group artists only. Use the View_Individual_Artist view. 
							--Similar to #3 above


ALTER VIEW View_Individual_Artist
AS
SELECT disk_name AS DiskName, release_date AS ReleaseDate, fname AS GroupName
FROM artist
JOIN disk_has_artist ON disk_has_artist.artist_id = artist.artist_id
JOIN disk ON disk.disk_id = disk_has_artist.disk_id
WHERE artist_type_id = 2
go

SELECT *
FROM View_Individual_Artist
ORDER BY DiskName;
go
							--Join to disk_has_artist - See Ch 4 for join info
							--Join to disk
							--Can use NOT IN or NOT EXISTS & see examples in Ch 6
							--See output for other specifications

--6. Show the borrowed disks and who borrowed them.
					--See specs

SELECT fname AS First, lname AS Last, disk_name AS DiskName, borrower_date AS BorrowedDate, release_date AS ReturnedDate
FROM borrower
JOIN disk_has_borrower ON disk_has_borrower.borrower_id = borrower.borrower_id
JOIN disk ON disk.disk_id = disk_has_borrower.disk_id
WHERE status_id = 2

							--Join disk_has_borrower
							--Join disk
							--See output for other specifications

--7. Show the number of times a disk has been borrowed.
--See chapter 5 for an aggregate function


select disk.disk_id AS Diskid, disk_name AS DiskName, count(*) as 'Times Borrwed'
from disk
join disk_has_borrower on disk.disk_id = disk_has_borrower.disk_id
group by disk.disk_id, disk_name
order by disk.disk_id


							--Join disk_has_borrower
							--Add clause to group the data

--8. Show the disks outstanding or on-loan and who has each disk. 
SELECT disk_name AS DiskName, borrower_date AS Borrowed, returned_date AS Returned, lname AS LastName			--See output
FROM disk
JOIN disk_has_borrower ON disk_has_borrower.disk_id = disk.disk_id
JOIN borrower ON disk_has_borrower.borrower_id = borrower.borrower_id
WHERE returned_date IS NULL
							--Join disk_has_borrower
							--Join borrower

							--See output for other specifications




/* Project 5 starts here
--4 Create Insert, Update, and Delete stored procedures for the disk table. Update procedure accepts input parameters for all columns. Insert accepts all columns as input parameters except for identity fields. Delete accepts a primary key value for delete. */

DROP PROC IF EXISTS sp_ins_disk;
GO
CREATE PROC sp_ins_disk
	@disk_name nvarchar(60), @release_date date, @genre_id int,
	@status_id int, @disk_type_id int
AS
	BEGIN TRY 
		INSERT disk (disk_name, release_date, genre_id, status_id, disk_type_id)
		VALUES (@disk_name, @release_date, @genre_id, @status_id, @disk_type_id);
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(varchar(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_ins_disk TO diskUserkk;
GO
EXEC sp_ins_disk 'Superunknown2', '3/3/1994', 4, 1, 1;
GO
EXEC sp_ins_disk 'Superunknown3', '3/3/1994', 4, 1, 1;
GO
EXEC sp_ins_disk 'Superunknown3', '3/3/1994', 4, 1, NULL;
GO

--Create update disk stored procedure
DROP PROC IF EXISTS sp_upd_disk;
GO
CREATE PROC sp_upd_disk
	@disk_id int, @disk_name nvarchar(60), @release_date date, @genre_id int,
	@status_id int, @disk_type_id int
AS
	BEGIN TRY
		UPDATE [dbo].[disk]
			SET [disk_name] = @disk_name,
			[release_date] = @release_date,
			[genre_id] = @genre_id,
			[status_id] = @status_id,
			[disk_type_id] = @disk_type_id
		WHERE disk_id = @disk_id;
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(varchar(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_upd_disk TO diskUserkk;
GO
EXEC sp_upd_disk 33, 'Superunknown2', '4/4/2000', 4, 1, 1;
GO
EXEC sp_upd_disk 34, 'Superunknown3', '4/4/2000', 4, 1, NULL;
GO
--Create delete disk procedure
DROP PROC IF EXISTS sp_del_disk;
GO
CREATE PROC sp_del_disk
	@disk_id INT
	AS
	BEGIN TRY
		DELETE FROM [dbo].[disk]
		      WHERE disk_id = @disk_id;
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(varchar(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_del_disk TO diskUserkk;
GO
EXEC sp_del_disk 33;
GO
EXEC sp_del_disk 34;
GO
EXEC sp_del_disk 'xxxxx';
GO
