/*Выберите лист времке  (timestamp) покупки времени использования объектов членом клуба 'David Farrell'.*/
USE cd;
SELECT starttime FROM bookings
JOIN members ON bookings.memid=members.memid
WHERE members.firstname = "David" AND members.surname="Farrell";