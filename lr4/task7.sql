-- удаляем все данные из таблицы bookings, а потом возвращаем их обратно
USE cd;
start TRANSACTION;
DELETE FROM bookings;
SELECT * FROM bookings;
ROLLBACK;
SELECT * FROM bookings;