-- удаляем все данные из таблицы bookings, а потом возвращаем их обратно
USE cd;
-- начинаем транзакцию
START TRANSACTION;
-- удаляем все данные из таблицы bookings
DELETE FROM bookings;
-- проверяем удалилось ли всё?
SELECT * FROM bookings;
-- закрываем транзакцию отменяя изменения
ROLLBACK;
SELECT * FROM bookings;