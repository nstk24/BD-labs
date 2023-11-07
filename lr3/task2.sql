USE cd;
SELECT facility FROM facilities
JOIN bookings ON facilities.facid = bookings.facid
WHERE facilities.facility LIKE '%Tennis court%' AND bookings.starttime >= ('2012-09-19 00:00:01') AND bookings.starttime < ('2012-09-20 00:00:01');