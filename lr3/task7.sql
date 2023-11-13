USE cd; /* Выбор активной базы данных 'cd'*/
/*Выборка имени и фамилии членов клуба, а также имен и фамилий тех, кто их рекомендовал*/
SELECT CONCAT(mem.firstname, ' ', mem.surname) AS membername, /*Выборка имени и фамилии членов клуба, а также имен и фамилий тех, кто их рекомендовал*/
(SELECT CONCAT(rec.firstname, ' ', rec.surname) FROM members rec WHERE mem.recommendedby = rec.memid) AS recname
FROM members mem
/* Отбор только тех членов, у которых memid не равен 0*/
WHERE mem.memid != 0
/* Сортировка результатов по имени и фамилии члена клуба*/
ORDER BY mem.firstname;