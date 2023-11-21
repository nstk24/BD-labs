USE cd;
--выбираем из members тех членов, которые не бронировали ничего, а затем удаляем их, потом проверяем есть ли в members член с id = 37
SELECT * from members
where memid not in(select distinct memid from bookings);
DELETE FROM members
WHERE memid not in (select memid from bookings);
select * from members where memid = 37;