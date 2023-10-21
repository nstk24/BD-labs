/*выбираем объекты с максимальной(MAX) или минимальной(MIN) стоимостью*/
USE cd;
SELECT facility, membercost FROM facilities WHERE guestcost = (SELECT min(guestcost) FROM facilities)
UNION
SELECT facility, membercost FROM facilities WHERE guestcost = (SELECT max(guestcost) FROM facilities);