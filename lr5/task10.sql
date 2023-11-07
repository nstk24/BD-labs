USE cd;
SELECT bookings.facid,
MONTH(bookings.starttime) AS month,
COUNT(*) AS slots
FROM bookings
INNER JOIN facilities ON bookings.facid = facilities.facid
WHERE YEAR(bookings.starttime) = 2012
GROUP BY bookings.facid, MONTH(bookings.starttime)
WITH ROLLUP
ORDER BY bookings.facid, MONTH(bookings.starttime);
