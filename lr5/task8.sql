USE cd;
SELECT facility AS object_name,
SUM(CASE
WHEN bookings.memid = 0 THEN facilities.guestcost
ELSE facilities.membercost
END) AS total_revenue
FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
GROUP BY facility
ORDER BY total_revenue DESC;