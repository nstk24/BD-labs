USE cd;
DELIMITER //

CREATE FUNCTION CalculateRentChangePercentag(
    facID INT, 
    percentageChange DECIMAL(5, 2),
    current_day DATE
) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    DECLARE avgCostPerHour DECIMAL(10, 2);
    DECLARE maintenanceCost DECIMAL(10, 2) DEFAULT 0;
    DECLARE totalCost DECIMAL(10, 2);

    -- Рассчитываем среднюю стоимость аренды
    SELECT AVG(slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) / COUNT(*)
    INTO avgCostPerHour
    FROM bookings
    WHERE facid = facID AND paid AND starttime >= current_day;

    -- Рассчитываем суммарные расходы на обслуживание (если такая таблица существует)
    IF EXISTS (SELECT 1 FROM information_schema.tables 
               WHERE table_schema = 'your_database_name' 
               AND table_name = 'maintenance') THEN
        SELECT SUM(cost)
        INTO maintenanceCost
        FROM maintenance
        WHERE facid = facID AND date >= current_day;
    END IF;

    -- Рассчитываем общую стоимость с учетом обслуживания
    SET totalCost = avgCostPerHour + maintenanceCost;

    -- Возвращаем изменение стоимости с учетом процента изменения
    RETURN totalCost * (percentageChange / 100);
END;

//
DELIMITER ;
