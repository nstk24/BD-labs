-- Используем базу данных "cd"
USE cd;

-- Выбираем название объекта (facility) и суммарную выручку для каждого объекта
-- Вычисляем выручку, учитывая разные стоимости для гостей и участников
SELECT
    facility AS object_name,
    SUM(
        CASE
            WHEN b.memid = 0 THEN facilities.guestcost * b.slots 
            ELSE facilities.membercost * b.slots
        END
    ) AS total_revenue
FROM
    facilities
JOIN
    bookings b  ON facilities.facid = b.facid
GROUP BY
    facility
ORDER BY
    total_revenue DESC;
