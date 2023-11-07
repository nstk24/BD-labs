USE cd;
SELECT facid, COUNT(*) FROM bookings WHERE starttime > '2012-08-31' AND starttime <='2012-09-30'  GROUP BY facid;