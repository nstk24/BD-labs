/*создаём новый столбец, называем его "расположение" и в нём указываем то, откуда был взят объект, после объединяем две таблицы через UNION*/
USE cd;
SELECT firstname AS 'объединение'  FROM members
UNION
SELECT facility AS 'объект' FROM facilities;