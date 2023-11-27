USE cd;
SELECT YEAR(b.starttime)AS YEAR,MONTH(b.starttime) AS month, COUNT(*) AS rental_count
from bookings b 
JOIN facilities f ON b.facid = f.facid
GROUP BY month(b.starttime), year(b.starttime);