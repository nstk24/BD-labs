-- Переключаемся на базу данных 'cd'.
USE cd;

-- Задаём переменные для начальной и конечной даты.
SET @from_date = '2012-08-01', @to_date = '2012-08-31';

-- Создаем рекурсивный CTE (Common Table Expression) для генерации последовательности дат между @from_date и @to_date.
WITH RECURSIVE dates(Dat) AS
(
    SELECT @from_date as Dat
    UNION ALL
    SELECT DATE_ADD(Dat, INTERVAL 1 day) FROM dates WHERE Dat < @to_date
)

-- Выполняем запрос для получения подвижного среднего дохода за период.
SELECT Dat, TotalIncome / 15 as MovingAverageIncome
FROM 
    (
        -- Подзапрос (Income):
        SELECT 
            Dat, 
            SUM(f.membercost * b.slots + f.guestcost * b.slots) as TotalIncome
        FROM dates
        LEFT JOIN bookings b ON DATE(b.starttime) = dates.Dat
        LEFT JOIN facilities f ON b.facid = f.facid
        WHERE dates.Dat >= DATE_SUB(@from_date, INTERVAL 14 DAY) AND dates.Dat <= @to_date
        GROUP BY Dat
    ) AS Income

-- Сортируем результаты по дате.
ORDER BY Dat;
