/*то-же самое, что и в предыдущих, только добавляется объединение двух условий через and*/
USE cd;
SELECT facility FROM facilities WHERE membercost <= monthlymaintenance / 50 AND membercost !=0;