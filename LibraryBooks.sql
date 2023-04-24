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
PRIMARY KEY (LibraryRefNum)
);

CREATE TABLE customers (
CustomerNum int,
FirstName varchar (255),
LastName varchar(255),
DateOfBirth TIMESTAMP NOT NULL,
PostCode varchar (255),
DoorNum varchar (255),
PRIMARY KEY  (CustomerNum)
);

CREATE TABLE staff (
StaffNum int,
FirstName varchar (255),
LastName varchar(255),
DateOfBirth TIMESTAMP NOT NULL,
Roles varchar (255),
PRIMARY KEY  (StaffNum)
);

CREATE TABLE activeBorrows (
ReferenceId int NOT NULL,
LibraryRefNum int,
CustomerNum int,
StaffNum int,
DateOfBorrow TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY  (ReferenceId),
FOREIGN KEY (LibraryRefNum) REFERENCES books (LibraryRefNum),
FOREIGN KEY (CustomerNum) REFERENCES customers (CustomerNum),
FOREIGN KEY (StaffNum) REFERENCES staff (StaffNum)
);

CREATE TABLE bookReturns (
ReferenceId int NOT NULL,
borrowRefernce int NOT NULL,
DateOfReturn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY  (ReferenceId),
FOREIGN KEY (borrowRefernce) REFERENCES activeBorrows (ReferenceId)
);

INSERT INTO Books VALUES 
(1, 'The Witches', 'Roald Dahl', 9780141349947, 'kids'),
(2, 'The Twits', 'Roald Dahl', 9780141349916, 'Kids'),
(3, 'Hamlet', 'Shakespeare', 9780140707342, 'Epic'),
(4, 'Romeo and Juliet', 'Shakespeare', 9780174434719, 'Epic');

INSERT INTO Customers VALUES 
(100, 'George', 'Popa', '1990-02-20 18:00:00', 'N20 2DS', '137'),
(101, 'Andrew', 'Wilkins', '1988-09-20 18:00:00', 'N20 2DS', '22'),
(102, 'John', 'Doe', '1999-02-20 18:00:00', 'N5 5AS', '15'),
(103, 'Dee', 'Dee', '1990-02-20 18:00:00', 'E14 2UD', '1'),
(104, 'Mary', 'Sue', '1989-02-11 18:00:00', 'E14 2UD', '223');

INSERT INTO Staff VALUES 
(1000001, 'Robert', 'Smith', '1992-03-11 00:00:00', 'counter'),
(1000002, 'James', 'Wilson', '1993-01-22 00:00:00', 'organiser'),
(1000003, 'Jade', 'Lilley', '1994-11-02 00:00:00', 'manager'),
(1000004, 'Jordan', 'Wicks', '1990-05-16 00:00:00', 'counter');


INSERT INTO activeBorrows VALUES 
(7852175, 2, 100, 10000001, '2023-04-11 10:00:00'),
(7852176, 2, 103, 10000001, '2023-04-12 10:00:00'), -- not returned yet
(7852177, 4, 102, 10000004, '2023-04-14 09:00:00');

INSERT INTO bookReturns VALUES 
(200010, 7852175,'2023-04-12 20:00:00'),
(200011 ,7852177,'2023-04-14 19:00:00');



