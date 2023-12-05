/*Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
WITH slots as(
    SELECT  facility, SUM(b.slots) AS rent_count
    DATE_FORMAT(b.starttime, '%m %Y') AS year__
    FROM facilities f 
    JOIN bookings b ON b.facid = f.facid
    GROUP BY f.facid, year__
)
SELECT s1.facility, CONCAT(ROUND(s1.rent_count / SUM(s2.rent_cont)* 100, 1), '%') AS usability, s1.year__
FROM slots s1 
JOIN slots s2 ON s1.year__ = s2.year__
GROUP BY s1.facility, s1.rentcount, s1.year__
ORDER BY CAST(usability as FLOAT) ASC;
