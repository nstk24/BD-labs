-- Используем базу данных "cd"
USE cd;

-- Выбираем дату бронирования (DATE(b.starttime)) и средний доход (AVG(f.membercost + f.guestcost))
-- Используем JOIN для соединения таблиц бронирований (bookings) и объектов (facilities) по идентификатору объекта (facid)
-- Ограничиваем результаты диапазоном дат с 1 по 31 августа 2012 года (WHERE DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31')
-- Группируем результаты по дате бронирования
-- Сортируем результаты по дате бронирования
SELECT
    DATE(b.starttime) AS date,
    AVG(f.membercost + f.guestcost) AS rolling_avg_income
FROM
    bookings b
JOIN
    facilities f ON b.facid = f.facid
WHERE
    DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31'
GROUP BY
    DATE(b.starttime)
ORDER BY
    DATE(b.starttime);
