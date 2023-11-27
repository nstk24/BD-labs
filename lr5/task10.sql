-- Переключаемся на базу данных 'cd'.
USE cd;

-- Основной запрос:
SELECT 
    IFNULL(derived_table.facid, 'Total') as facid, -- Используется IFNULL для предотвращения NULL идентификаторов объектов.
    IFNULL(derived_table.month, 'Total') as month, -- IFNULL обеспечивает замену NULL значений месяцев на 'Total'.
    SUM(derived_table.slots) AS 'Количество забронированных мест' -- Суммируем количество забронированных слотов.

FROM 
    (
        -- Подзапрос (derived_table): 
        SELECT 
            f.facid AS facid,
            MONTH(b.starttime) AS month,
            SUM(b.slots) as slots
        FROM
            facilities f
        INNER JOIN bookings b ON f.facid = b.facid
        WHERE
            YEAR(b.starttime) = 2012
        GROUP BY facid, month, slots
    ) AS derived_table -- Результат подзапроса алиасируется как 'derived_table'.

GROUP BY facid, month WITH ROLLUP; -- Группировка результатов по идентификатору объекта и месяцу с использованием WITH ROLLUP.




