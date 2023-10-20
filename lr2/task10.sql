/*с помощью функции DISTRICT мы сортируем объекты пао афавиту, а используя LIMIT выводим только 10 первых элементов*/
USE cd;
SELECT DISTINCT surname FROM members ORDER BY surname LIMIT 10;