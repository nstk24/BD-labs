/*выбираем объекты с максимальной(MAX) или минимальной(MIN) стоимостью*/
USE cd;
SELECT facility, membercost FROM facilities WHERE initialoutlay = (SELECT min(initialoutlay) FROM facilities)
UNION
SELECT facility, membercost FROM facilities WHERE initialoutlay = (SELECT max(initialoutlay) FROM facilities);