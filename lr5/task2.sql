-- Используем базу данных "cd"
USE cd;

-- Выбираем количество записей в таблице "facilities", где значение в столбце "guestcost" больше 10
SELECT COUNT(facid) FROM facilities WHERE guestcost > 10;
