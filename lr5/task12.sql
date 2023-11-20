SELECT m.memid AS MemberID,
       m.firstname AS FirstName,
       m.surname AS LastName,
       MIN(b.starttime) AS FirstBookingDate
FROM members m
LEFT JOIN bookings b ON m.memid = b.memid
WHERE b.starttime IS NOT NULL AND DATE(b.starttime) > '2012-09-01'
GROUP BY m.memid, m.firstname, m.surname
ORDER BY m.memid;
