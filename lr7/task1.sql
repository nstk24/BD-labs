-- Task-7-1: Создаем функцию для расчета стоимости аренды
DELIMITER //
CREATE FUNCTION CalculateRentalCost(bookID INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE cost DECIMAL(10, 2);
    SELECT (slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) INTO cost
    FROM bookings
    WHERE bookid = bookID;
    RETURN cost;
END; 
//
DELIMITER ;
