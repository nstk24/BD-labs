USE library;
-- Удаляем внешний ключ из таблицы Books
ALTER TABLE Books
DROP FOREIGN KEY books_ibfk_1;

-- Удаляем столбец AuthorID из таблицы Books
ALTER TABLE Books
DROP COLUMN AuthorID;

-- Добавляем столбец AuthorID в таблицу Books
ALTER TABLE Books
ADD COLUMN AuthorID INT;

-- Добавляем внешний ключ к новой таблице Authors
ALTER TABLE Books
ADD FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID);
