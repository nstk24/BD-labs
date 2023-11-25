/*Выберите теннисные корты, забронированные пользователями на 19 сентября 2012 года.*/
USE cd;
SELECT facility FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
WHERE facilities.facility LIKE '%Tennis court%' AND DATE(bookings.starttime)="2012-09-19";