SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS LibraryBooks;
CREATE SCHEMA LibraryBooks;
USE LibraryBooks;

CREATE TABLE books (
LibraryRefNum int,
Title varchar (255),
Author varchar(255),
ISBN varchar (255) ,
Location varchar (255),
PRIMARY KEY (LibraryRefNum),
UNIQUE INDEX Title_UNIQUE (Title),
UNIQUE INDEX ISBN_UNIQUE (ISBN)
);

CREATE TABLE customers (
CustomerNum int,
FirstName varchar (255),
LastName varchar(255),
DateOfBirth varchar(255),
PostCode varchar (255),
PRIMARY KEY  (CustomerNum)
);

CREATE TABLE activeBorrows (
ReferenceId int NOT NULL,
LibraryRefNum int,
CustomerNum int,
DateOfBorrow TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
Title varchar (255),
ISBN varchar (255),
FOREIGN KEY (LibraryRefNum) REFERENCES books (LibraryRefNum),
FOREIGN KEY (CustomerNum) REFERENCES customers (CustomerNum),
FOREIGN KEY (Title) REFERENCES books (Title),
FOREIGN KEY (ISBN) REFERENCES books (ISBN)
);

INSERT INTO Books VALUES (1, 'The Witches', 'Roald Dahl', 9780141349947, 'kids'),
(2, 'The Twits', 'Roald Dahl', 9780141349916, 'Kids');

INSERT INTO Customers VALUES (100, 'George', 'Popa', '1990-02-20 18:00:00', 'N20 2DS');

INSERT INTO activeBorrows VALUES (1001, 2, 100, '2023-04-11 10:00:00', 'The Twits', 9780141349916);