/* мы сортируем объекты пао афавиту, а используя LIMIT выводим только 10 первых элементов*/
USE cd;
SELECT DISTINCT surname FROM members WHERE memid > 1 AND memid < 12 ORDER BY surname;;