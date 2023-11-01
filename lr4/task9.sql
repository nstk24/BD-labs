USE cd;
SELECT * from members
where memid not in(select distinct memid from bookings);