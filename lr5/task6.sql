-- Используем базу данных "cd"
USE cd;
-- Выбираем месяц бронирования, идентификатор объекта (facid) и общее количество бронирований для каждого месяца и объекта
-- за период 2012 года
SELECT EXTRACT(MONTH FROM starttime) AS MONTH, bookings.facid, COUNT(*) AS TOTAL_BOOKINGS
FROM bookings
WHERE YEAR(starttime) = 2012
GROUP BY MONTH, facid;

