/*Выберите членов клуба, которые рекомендовали других членов для вступления.*/
USE cd;
SELECT m1.surname, m1.firstname 
FROM members m1 JOIN members m2
ON m1.memid=m2.recommendedby;