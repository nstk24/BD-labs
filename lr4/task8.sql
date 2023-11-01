-- удаляем данные о госте с memid = 37, из таблицы members, затем возвращаем всё как было 
USE cd;
START TRANSACTION;
DELETE FROM members WHERE memid = 37;
SELECT * FROM members;
ROLLBACK;
SELECT * FROM members;