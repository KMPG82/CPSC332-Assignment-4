DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

USE Library;

CREATE TABLE BOOK (
    Book_id INT,
    Title VARCHAR(50) NOT NULL,
    Publisher_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (Book_id)
);

CREATE TABLE BOOK_AUTHORS (
    Book_id INT,
    Author_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (Book_id, Author_name),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE PUBLISHER (
    Name VARCHAR(30),
    Address VARCHAR(50),
    Phone VARCHAR(15),
    PRIMARY KEY (Name)
);

CREATE TABLE LIBRARY_BRANCH (
   Branch_id INT,
   Branch_name VARCHAR(30) NOT NULL,
   Address VARCHAR(50),
   PRIMARY KEY (Branch_id)
);

CREATE TABLE BOOK_COPIES (
    Book_id INT,
    Branch_id INT,
    No_of_copies INT NOT NULL CHECK (No_of_copies >= 0),
    PRIMARY KEY (Book_id, Branch_id),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES LIBRARY_BRANCH(Branch_id)
);

CREATE TABLE BORROWER (
   Card_no INT,
   Name VARCHAR(30) NOT NULL,
   Address VARCHAR(50),
   Phone VARCHAR(15),
   PRIMARY KEY (Card_no)
);

CREATE TABLE BOOK_LOANS (
   Book_id INT, 
   Branch_id INT, 
   Card_no INT, 
   Date_out DATE NOT NULL, 
   Due_date DATE NOT NULL, 
   PRIMARY KEY (Book_Id, Branch_Id, Card_No), 
   FOREIGN KEY (Book_Id) REFERENCES BOOK(Book_Id), 
   FOREIGN Key(Branch_Id) REFERENCES LIBRARY_BRANCH(Branch_Id), 
   FOREIGN Key(Card_No) REFERENCES BORROWER(Card_No)
);