/*объекты с дешевой качественной стоимостью*/
use cd;
select * from facilities where monthlymaintenance <100;
/*объекты с дорогой качественной стоимостью*/
use cd;
select * from facilities where monthlymaintenance >=100;
