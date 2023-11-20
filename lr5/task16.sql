USE cd;

-- Используем базу данных "cd"
USE cd;

-- Создаем временную таблицу (CTE) RevenuePerFacility, которая содержит информацию о выручке для каждого объекта
-- Используем LEFT JOIN для соединения таблиц объектов (facilities) и бронирований (bookings) по идентификатору объекта (facid)
-- Вычисляем выручку с использованием функции COALESCE для замены NULL на 0 и CASE WHEN для выбора стоимости для гостя или участника
-- Группируем результаты по идентификатору объекта и названию объекта
WITH RevenuePerFacility AS (
    SELECT
        f.facility AS FacilityName,
        f.facid AS FacilityID,
        COALESCE(SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END), 0) AS TotalRevenue
    FROM
        facilities f
    LEFT JOIN
        bookings b ON f.facid = b.facid
    GROUP BY
        f.facid, f.facility
)

-- Выбираем название объекта, ранг (по убыванию выручки) и общую выручку
-- Используем функцию RANK() OVER для присвоения ранга каждому объекту в порядке убывания выручки
-- Сортируем результаты по рангу и названию объекта
-- Ограничиваем вывод тремя верхними объектами
SELECT
    FacilityName,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS Ranking,
    TotalRevenue
FROM
    RevenuePerFacility
ORDER BY
    Ranking, FacilityName
LIMIT 3;
