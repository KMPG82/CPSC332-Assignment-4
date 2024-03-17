DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

USE Library;

CREATE TABLE PUBLISHER (
Name		varchar(100) not null,
Address		varchar(100) not null,
Phone		char(10) not null,
CONSTRAINT pk_Publisher primary key (Name)
);

CREATE TABLE BOOK (
Book_id		char(9) not null,
Publisher_name      varchar(100) not null,
Title      varchar(100) not null, 
CONSTRAINT pk_Book primary key (Book_id),
CONSTRAINT fk_Publisher foreign key (Publisher_name) references PUBLISHER(Name) 
);

CREATE TABLE BOOK_AUTHORS(
Book_id		char(9) not null,
Author_name		varchar(50),
CONSTRAINT pk_Authors primary key (Book_id, Author_name),
CONSTRAINT fk_Book foreign key (Book_id) references BOOK(Book_id)
);