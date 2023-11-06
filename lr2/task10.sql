/* мы сортируем объекты пао афавиту, а используя LIMIT выводим только 10 первых элементов*/
USE cd;
SELECT DISTINCT surname FROM members WHERE surname != 'Guest' ORDER BY surname LIMIT 10;