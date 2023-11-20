-- Используем базу данных "cd"
USE cd;

-- Выбираем информацию о бронированиях, включая имя участника (или гостя), количество округленных часов и статус участника (Участник или Гость)
-- Используем функции CONCAT для объединения имени и фамилии участника, TIMESTAMPDIFF для вычисления разницы в часах между начальным временем бронирования и временем, увеличенным на 1 час
-- Используем ROUND для округления количества часов до ближайшего десятка, и CASE для определения статуса участника (Участник или Гость)
-- Используем LEFT JOIN для соединения таблиц бронирований (bookings) и участников (members), а также для определения статуса участника через LEFT JOIN с той же таблицей участников (members), но только для тех случаев, где memid не равен 0 (т.е., участники)
-- Группируем результаты по идентификатору участника (b.memid)
-- Сортируем результаты по статусу участника (в порядке Участников, затем Гостей), количеству округленных часов (в убывающем порядке), фамилии и имени участника
SELECT
    CONCAT(m.firstname, ' ', m.surname) AS member_name,
    ROUND(SUM(TIMESTAMPDIFF(HOUR, b.starttime, TIMESTAMPADD(HOUR, 1, b.starttime))), -1) AS rounded_hours,
    CASE
        WHEN mb.memid IS NOT NULL THEN 'Участник'
        ELSE 'Гость'
    END AS status
FROM
    bookings b
LEFT JOIN
    members m ON b.memid = m.memid
LEFT JOIN
    members mb ON b.memid = mb.memid AND mb.memid <> 0
GROUP BY
    b.memid
ORDER BY
    status, rounded_hours DESC, m.surname, m.firstname;
