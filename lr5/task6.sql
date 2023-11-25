-- Используем базу данных "cd"
USE cd;

-- Выбираем месяц бронирования, идентификатор объекта (facid) и общее количество бронирований для каждого месяца и объекта
-- за период 2012 года
<<<<<<< HEAD
USE cd;
SELECT f.facility, MONTH(b.starttime) AS 'Месяц', SUM(b.slots) AS 'Количество бронирований' FROM facilities f
INNER JOIN bookings b ON f.facid = b.facid WHERE YEAR(b.starttime) = 2012
GROUP BY f.facility, MONTH(b.starttime);
=======
SELECT EXTRACT(MONTH FROM starttime) AS MONTH, bookings.facid, COUNT(*) AS TOTAL_BOOKINGS
FROM bookings
WHERE YEAR(starttime) = 2012
GROUP BY MONTH, facid;
>>>>>>> 60c7b0f216c1386be9810715953adca6013f4763
