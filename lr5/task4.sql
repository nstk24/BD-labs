-- Используем базу данных "cd"
USE cd;

-- Выбираем идентификатор объекта, название объекта и количество бронированных слотов для каждого объекта
SELECT
    fac.facid AS Facid,
    fac.facility AS Facility,
    COUNT(boo.slots) AS rec
FROM
    facilities fac
JOIN
    bookings boo ON boo.facid = fac.facid
GROUP BY
    fac.facid, fac.facility;