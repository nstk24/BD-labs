USE cd;
SELECT DISTINCT CONCAT(f.facility, ' ', m.firstname) AS facilityName, 
CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots
ELSE f.membercost * b.slots 
END AS cost
FROM bookings b
JOIN facilities f ON b.facid = f.facid
JOIN members m ON b.memid = m.memid
WHERE DATE(b.starttime) = '2012-09-14' AND
(CASE 
WHEN b.memid = 0 THEN f.guestcost * b.slots
ELSE f.membercost * b.slots 
END) > 30
ORDER BY cost DESC;