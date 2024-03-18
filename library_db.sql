DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

USE Library;

CREATE TABLE BORROWER(
Card_no		char(11) not null,
Name		varchar(30) not null,
Address		varchar(30) not null,
Phone		char(10) not null,
CONSTRAINT pk_borrower primary key (Card_no)
);

CREATE TABLE LIBRARY_BRANCH(
Branch_id		char(5) not null,
Branch_name		varchar(30) not null,
Address		varchar(30) not null,
CONSTRAINT pk_branch primary key (Branch_id)	
);

CREATE TABLE PUBLISHER (
Name		varchar(30) not null,
Address		varchar(30) not null,
Phone		char(10) not null,
CONSTRAINT pk_publisher primary key (Name)
);

CREATE TABLE BOOK (
Book_id		char(13) not null,
Publisher_name		varchar(30) not null,
Title		varchar(30) not null, 
CONSTRAINT pk_book primary key (Book_id),
CONSTRAINT fk_book_publisher foreign key (Publisher_name) references PUBLISHER(Name) 
);

CREATE TABLE BOOK_AUTHORS(
Book_id		char(13) not null,
Author_name		varchar(30) not null,
CONSTRAINT pk_authors primary key (Book_id, Author_name),
CONSTRAINT fk_authors_book foreign key (Book_id) references BOOK(Book_id)
);

CREATE TABLE BOOK_COPIES(
Book_id		char(13) not null,
Branch_id		char(5) not null,
No_of_copies		int not null,
CONSTRAINT pk_copies primary key (Book_id, Branch_id),
CONSTRAINT fk_copies_book foreign key (Book_id) references BOOK(Book_id),
CONSTRAINT fk_copies_branch foreign key (Branch_id) references LIBRARY_BRANCH(Branch_id)
);

CREATE TABLE BOOK_LOANS(
Book_id		char(13) not null,
Branch_id		char(5) not null,
Card_no		char(11) not null,
Date_out		date not null,
Due_date		date not null,
CONSTRAINT pk_loan primary key (Book_id, Branch_id, Card_no),
CONSTRAINT fk_loan_book foreign key (Book_id) references BOOK(Book_id),
CONSTRAINT fk_loan_branch foreign key (Branch_id) references LIBRARY_BRANCH(Branch_id),
CONSTRAINT fk_loan_borrower foreign key (Card_no) references BORROWER(Card_no)
);