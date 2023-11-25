-- Переключаемся на базу данных 'cd'.
USE cd;

-- Выбираем название объекта и его ранг в зависимости от суммарной выручки, сортированной по убыванию.

SELECT f.facility, 

  -- Используем функцию RANK() для присвоения ранга каждому объекту в порядке убывания выручки.
  RANK() OVER (ORDER BY SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) DESC) as ranks

FROM facilities f
JOIN bookings b ON f.facid = b.facid 

-- Группируем результаты по объекту.
GROUP BY f.facility

-- Сортируем результаты по рангу и названию объекта.
ORDER BY ranks, f.facility

-- Ограничиваем результаты тремя верхними записями.
LIMIT 3;
