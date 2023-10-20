/*то-же самое, что и в предыдущих, только добавляется объединение двух условий через and*/
USE cd;
SELECT facility, membercost FROM facilities WHERE membercost <= monthlymaintenance / 50 AND membercost !=0;