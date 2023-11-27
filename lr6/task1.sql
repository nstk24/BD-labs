USE cd;
SELECT starttime, DATE_ADD(starttime, INTERVAL(slots * 30)MINUTE) AS "endtime"
FROM bookings
ORDER BY bookid DESC, endtime DESC
LIMIT 10;
