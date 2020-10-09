/**********************************************************************************/
/*																				  */
/*	Date		Programer		Description										  */
/*--------------------------------------------------------------------------------*/
/*10-9-2020		Killian			Initial Implementation of the disk inventory DB.  */
/*																				  */
/*																				  */
/**********************************************************************************/


--Create database

USE master;
DROP DATABASE IF EXISTS disk_inventoryJM;
GO
CREATE DATABASE disk_inventoryJM;
GO

USE disk_inventoryJM;

--Create server login & database user
IF SUSER_ID (N'diskUserjw') IS NULL
	CREATE LOGIN diskUserjw WITH PASSWORD = 'Pa$$w0rd', DEFAULT_DATABASE = disk_inventoryJM;

DROP USER IF EXISTS diskUserjw;
CREATE USER diskUserjw;
ALTER ROLE db_datareader
	ADD MEMBER diskUserjw;

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
	genre_id		INT NOT NULL REFERENCES genre(genre_id)	
);

CREATE TABLE disk_has_borrower (
	borrower_id		INT NOT NULL REFERENCES borrower(borrower_id),
	disk_id			INT NOT NULL REFERENCES disk(disk_id),
	borrower_date	DATETIME2 NOT NULL,
	returned_date	DATETIME2 NULL,
	PRIMARY KEY (borrower_id, disk_id)
);

CREATE TABLE disk_has_artist (
	disk_id			INT NOT NULL REFERENCES disk(disk_id),
	artist_id		INT NOT NULL REFERENCES artist(artist_id),
	PRIMARY KEY (disk_id, artist_id)
);

