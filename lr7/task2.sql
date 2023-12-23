USE cd;
DELIMITER //

CREATE PROCEDURE AddPaidColumnIfNeed()
BEGIN
    -- Попытка добавить столбец без проверки его существования
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLSTATE '42S21' BEGIN END;
        ALTER TABLE bookings ADD COLUMN paid BOOLEAN DEFAULT FALSE;
    END;
END //

DELIMITER ;

-- Вызываем процедуру
CALL AddPaidColumnIfNeeded();

-- Триггер для предотвращения удаления оплаченных бронирований
DELIMITER //
CREATE TRIGGER PreventDeletePaidBookings
BEFORE DELETE ON bookings
FOR EACH ROW
BEGIN
    IF OLD.paid THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete paid bookings';
    END IF;
END //
DELIMITER ;
