USE cd;
INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay,monthlymaintenance )
select 12 ,facility, membercost, guestcost , initialoutlay, monthlymaintenance from facilities WHERE facid = 9;
select * from facilities;