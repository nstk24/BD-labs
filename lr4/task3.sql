--добавляем в таблицу строку с id =12 и значениями, такими-же, как и в строке с id = 9 
USE cd;
INSERT INTO facilities (facid, facility, membercost, guestcost, initialoutlay,monthlymaintenance )
select 12 ,facility, membercost, guestcost , initialoutlay, monthlymaintenance from facilities WHERE facid = 9;
select * from facilities;