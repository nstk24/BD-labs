-- Используем базу данных "cd"
USE cd;

-- Выбираем идентификатор объекта (facid), название объекта (facility) и округленное количество забронированных часов (ReservedHours)
-- Суммируем количество слотов из таблицы бронирований (bookings) и округляем результат до двух знаков после запятой
-- Группируем результаты по идентификатору объекта и названию объекта
-- Сортируем результаты по идентификатору объекта
SELECT
    f.facid AS ObjectID,
    f.facility AS ObjectName,
    ROUND(SUM(b.slots) , 2) AS ReservedHours
FROM
    facilities f
JOIN
    bookings b ON f.facid = b.facid
GROUP BY
    f.facid, f.facility
ORDER BY
    f.facid;

