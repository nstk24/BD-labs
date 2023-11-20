USE cd;
-- начинаем транзаакцию
START TRANSACTION;
-- удаляем из таблицы members члена с id = 37
DELETE FROM members WHERE memid = 37;
SELECT * FROM members;
SELECT * FROM members;