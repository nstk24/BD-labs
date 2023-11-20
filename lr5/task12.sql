-- Используем базу данных "cd"
USE cd;

-- Выбираем идентификатор участника (MemberID), имя (FirstName), фамилию (LastName) 
-- и дату первого бронирования (FirstBookingDate) после 1 сентября 2012 года
-- Используем LEFT JOIN для включения всех участников, вне зависимости от наличия бронирований
-- Фильтруем результаты, чтобы исключить участников без бронирований и бронирования до 1 сентября 2012 года
-- Группируем результаты по идентификатору участника, имени и фамилии
-- Сортируем результаты по идентификатору участника
SELECT
    m.memid AS MemberID,
    m.firstname AS FirstName,
    m.surname AS LastName,
    MIN(b.starttime) AS FirstBookingDate
FROM
    members m
LEFT JOIN
    bookings b ON m.memid = b.memid
WHERE
    b.starttime IS NOT NULL AND DATE(b.starttime) > '2012-09-01'
GROUP BY
    m.memid, m.firstname, m.surname
ORDER BY
    m.memid;
