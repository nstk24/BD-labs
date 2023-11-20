SELECT f.facid AS ObjectID,
       f.facility AS ObjectName,
       ROUND(SUM(b.slots) / 2.0, 2) AS ReservedHours
FROM facilities f
JOIN bookings b ON f.facid = b.facid
GROUP BY f.facid, f.facility
ORDER BY f.facid;
