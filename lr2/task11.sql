/*создаём новый столбец, называем его "расположение" и в нём указываем то, откуда был взят объект, после объединяем две таблицы через UNION*/
USE cd;
SELECT firstname AS 'Firstname/Facilities'  FROM members
UNION ALL
SELECT facility  FROM facilities;