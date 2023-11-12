/*Выберите список всех членов, включая человека, который их рекомендовал*/
 USE cd;
SELECT CONCAT(mem.firstname,' ',mem.surname) AS membername,
(SELECT CONCAT(rec.firstname,' ',rec.surname) FROM members rec WHERE mem.recommendedby=rec.memid) AS recname 
FROM members mem
WHERE mem.memid!=0
ORDER BY membername;