-- Task-7-4: Создаем функцию для расчета изменения стоимости аренды
DELIMITER //
CREATE FUNCTION CalculateRentChangePercentage(facID INT, percentageChange DECIMAL(5, 2)) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    DECLARE avgCostPerHour DECIMAL(10, 2);

    SELECT AVG(slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) / COUNT(*)
    INTO avgCostPerHour
    FROM bookings
    WHERE facid = facID AND paid;

    RETURN avgCostPerHour * (percentageChange / 100);
END;
//
DELIMITER ;
