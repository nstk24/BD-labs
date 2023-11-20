-- Используем базу данных "cd"
USE cd;

-- Выбираем идентификатор объекта (facid) и количество бронирований для каждого объекта
-- за период с 1 сентября 2012 года по 30 сентября 2012 года
SELECT facid, COUNT(*) 
FROM bookings 
WHERE starttime > '2012-08-31' AND starttime <= '2012-09-30'  
GROUP BY facid;
