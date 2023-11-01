USE cd;
INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay,monthlymaintenance )
select max(facid)+1 ,'spa', 20, 30 , 100000, 800 from facilities;
select * from facilities;