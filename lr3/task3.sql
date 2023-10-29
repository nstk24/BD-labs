USE cd;
SELECT DISTINCT m1.surname, m1.firstname
FROM members m1, members m2
WHERE m1.memid = m2.recommendedby;