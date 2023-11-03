USE cd;
SELECT * from members
where memid not in(select distinct memid from bookings);
DELETE FROM members
WHERE memid not in (select memid from bookings);
select * from members where memid = 37;