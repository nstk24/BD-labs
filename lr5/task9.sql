-- Используем базу данных "cd"
USE cd;

-- Выбираем название объекта (facility) и суммарную выручку для каждого объекта
-- Вычисляем выручку, учитывая разные стоимости для гостей и участников
-- Группируем результаты по объектам и фильтруем только те, у которых общая выручка менее 1000
-- Сортируем результаты по общей выручке
SELECT
    facility AS object_name,
    SUM(
        CASE
            WHEN bookings.memid = 0 THEN facilities.guestcost
            ELSE facilities.membercost
        END
    ) AS total_revenue
FROM
    facilities
JOIN
    bookings ON facilities.facid = bookings.facid
GROUP BY
    facility
HAVING
    total_revenue < 1000
ORDER BY
    total_revenue;

