/*объекты с дешевой качественной стоимостью*/
USE cd;
SELECT facility, 'дешёвый' AS 'качественная стоимость'  FROM facilities WHERE monthlymaintenance <100
/*объекты с дорогой качественной стоимостью*/
UNION
SELECT facility, 'дорогой'  FROM facilities WHERE monthlymaintenance >=100;
