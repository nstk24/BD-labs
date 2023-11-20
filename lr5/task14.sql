-- Используем базу данных "cd"
USE cd;

-- Создаем временную таблицу (CTE - Common Table Expression) SlotCounts, которая содержит суммарное количество слотов для каждого объекта (facid)
WITH SlotCounts AS (
    SELECT facid, 
           SUM(slots) AS TotalSlots
    FROM bookings
    GROUP BY facid
)

-- Выбираем идентификатор объекта (FacilityID), название объекта (FacilityName) и общее количество зарезервированных слотов (TotalReservedSlots)
-- Используем JOIN для объединения таблицы объектов (facilities) с временной таблицей SlotCounts по идентификатору объекта (facid)
-- Ограничиваем результаты только теми объектами, у которых общее количество слотов равно максимальному значению в SlotCounts
SELECT
    f.facid AS FacilityID,
    f.facility AS FacilityName,
    sc.TotalSlots AS TotalReservedSlots
FROM
    facilities f
JOIN
    SlotCounts sc ON f.facid = sc.facid
WHERE
    sc.TotalSlots = (SELECT MAX(TotalSlots) FROM SlotCounts);

