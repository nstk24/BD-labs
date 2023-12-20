-- Создание базы данных
CREATE DATABASE Library;
USE Library;

-- Создание таблиц
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FullName VARCHAR(255),
    BirthYear INT
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Publisher VARCHAR(255),
    AuthorID INT,
    Title VARCHAR(255),
    PublicationYear INT,
    PageCount INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    Customer VARCHAR(255),
    Quantity INT,
    OrderDate DATE,
    DeliveryDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
-- Заполнение таблиц данными
-- Authors
INSERT INTO Authors VALUES (1, 'John Doe', 1980);
INSERT INTO Authors VALUES (2, 'Jane Smith', 1975);
INSERT INTO Authors VALUES (3, 'David Johnson', 1990);

-- Books
INSERT INTO Books VALUES (1, 'Publisher1', 1, 'Book1', 2000, 300, 20.50);
INSERT INTO Books VALUES (2, 'Publisher2', 2, 'Book2', 2005, 250, 15.75);
INSERT INTO Books VALUES (3, 'Publisher3', 3, 'Book3', 2010, 400, 25.00);

-- Orders
INSERT INTO Orders VALUES (1, 1, 'Customer1', 5, '2023-01-01', '2023-01-10');
INSERT INTO Orders VALUES (2, 2, 'Customer2', 3, '2023-02-15', '2023-02-25');
INSERT INTO Orders VALUES (3, 3, 'Customer3', 8, '2023-03-10', '2023-03-20');
