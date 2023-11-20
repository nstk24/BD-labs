-- Используем базу данных "cd"
USE cd;

-- Выбираем уникальные комбинации количества бронирований, группы доходов и названия объекта
-- В зависимости от суммы membercost и guestcost объекта выбираем группу доходов ('Высокие доходы', 'Средние доходы' или 'Низкие доходы')
-- Группируем результаты по  группе доходов (income_group) и названию объекта (facility_name)
-- Сортируем результаты по группе доходов и названию объекта
SELECT DISTINCT
    CASE
        WHEN f.membercost + f.guestcost >= 30 THEN 'Высокие доходы'
        WHEN f.membercost + f.guestcost >= 20 THEN 'Средние доходы'
        ELSE 'Низкие доходы'
    END AS income_group,
    f.facility AS facility_name
FROM
    members m 
LEFT JOIN
    bookings b ON m.memid = b.memid
LEFT JOIN
    facilities f ON b.facid = f.facid
GROUP BY
     income_group, facility_name
ORDER BY
    income_group, facility_name;
