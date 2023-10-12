use cd;
select facid, facility, membercost from facilities where membercost < monthlymaintenance / 50 and membercost not like "0";