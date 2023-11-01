--вносим строку с установленными значениями в имеющуюся таблицу
USE cd;
INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES (9, 'spa', 20, 30, 100000, 800);
SELECT * FROM facilities;
