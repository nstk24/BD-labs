-- Task-7-1: Создаем функцию для расчета стоимости аренды
DELIMITER //
CREATE FUNCTION CalculateRentalCost(bookID INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE cost DECIMAL(10, 2);
    SELECT (slots * CASE WHEN memid IS NULL THEN guestcost ELSE membercost END) INTO cost
    FROM bookings
    WHERE bookid = bookID;
    RETURN cost;
END;
//
DELIMITER ;

-- Task-7-2: Создаем таблицу payments и добавляем поле paid в таблицу bookings
CREATE TABLE IF NOT EXISTS payments (
    payid INT PRIMARY KEY,
    bookid INT,
    payment DECIMAL(10, 2),
    FOREIGN KEY (bookid) REFERENCES bookings(bookid)
);

ALTER TABLE IF EXISTS bookings ADD COLUMN IF NOT EXISTS paid BOOLEAN DEFAULT FALSE;

-- Task-7-2: Создаем триггеры
DELIMITER //
CREATE TRIGGER PreventDeletePaidBookings
BEFORE DELETE ON bookings
FOR EACH ROW
BEGIN
    IF OLD.paid THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete paid bookings';
    END IF;
END;
//

DELIMITER ;

-- Task-7-3: Создаем процедуру для расчета окупаемости объектов на основе оплаты за месяц
DELIMITER //
CREATE PROCEDURE CalculateProfitability(IN monthYear DATE)
BEGIN
    DECLARE totalCost DECIMAL(10, 2);
    DECLARE totalIncome DECIMAL(10, 2);

    SELECT SUM(initialoutlay + (monthlymaintenance * DATEDIFF(month(now()), monthYear)))
    INTO totalCost
    FROM facilities;

    SELECT SUM(payment)
    INTO totalIncome
    FROM payments
    JOIN bookings ON payments.bookid = bookings.bookid
    WHERE MONTH(bookings.starttime) = MONTH(monthYear)
      AND YEAR(bookings.starttime) = YEAR(monthYear);

    SELECT totalIncome - totalCost AS Profitability;
END;
//
DELIMITER ;

-- Task-7-4: Создаем функцию для расчета изменения стоимости аренды
DELIMITER //
CREATE FUNCTION CalculateRentChangePercentage(IN facID INT, IN percentageChange DECIMAL(5, 2)) RETURNS DECIMAL(5, 2)
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

-- Task-7-5: Создаем скрипт для изменения стоимости аренды и отметки оплаты за август 2012 года
-- (Этот скрипт будет содержать обновление стоимости аренды на основе Task-7-4 и отметку оплаты за август)

-- Ваш SQL-скрипт для выполнения задания Task-7-5