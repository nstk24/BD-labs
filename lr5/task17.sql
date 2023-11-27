-- Переключаемся на базу данных 'cd'.
USE cd;

-- Выбираем название объекта и категорию дохода для каждого объекта.

SELECT facility, 

  -- Используем выражение CASE для присвоения категории дохода в зависимости от значения incomegroup.
  CASE 
    WHEN incomegroup = 1 THEN 'Высокий доход'
    WHEN incomegroup = 2 THEN 'Средний доход'
    WHEN incomegroup = 3 THEN 'Низкий доход'
  END AS incomegroup

FROM (
  -- Подзапрос (subquery):
  SELECT f.facility, 
  
    -- Вычисляем выручку, используя условные выражения для учета типа участника (гость или член).
    SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) AS revenue,
  
    -- Применяем функцию NTILE для разделения объектов на три группы с равными долями дохода.
    NTILE(3) OVER (ORDER BY SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots))) AS incomegroup
  
  FROM facilities f
  INNER JOIN bookings b ON f.facid = b.facid
  
  -- Группируем результаты по объекту.
  GROUP BY f.facility
) as subquery

-- Сортируем результаты по категории дохода и названию объекта.
ORDER BY incomegroup, facility;
