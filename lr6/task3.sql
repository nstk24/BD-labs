/*Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
SELECT 
    MONTH(b.starttime) AS months, f.facility,
    (SUM(b.slots) / (COUNT(DISTINCT b.facid) * 720 * COUNT(DISTINCT YEAR(b.starttime)))) * 100 AS usage_percent 
FROM bookings b
JOIN facilities f ON b.facid = f.facid 
GROUP BY months, f.facility
ORDER BY usage_percent ASC;