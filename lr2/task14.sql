USE cd;
select facility, membercost from facilities where guestcost = (SELECT min(guestcost) FROM facilities)
UNION
select facility, membercost from facilities where guestcost = (SELECT max(guestcost) FROM facilities);