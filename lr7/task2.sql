USE cd;

DELIMITER //

-- Создаем процедуру для добавления столбца paid, если его нет
CREATE PROCEDURE AddPaidColumnIfNeeded()
BEGIN
    DECLARE columnExists INT;

    -- Проверяем наличие столбца paid в таблице bookings
    SELECT COUNT(*)
    INTO columnExists
    FROM information_schema.columns
    WHERE table_name = 'bookings' AND column_name = 'paid';

    -- Если столбец отсутствует, добавляем его
    IF columnExists = 0 THEN
        SET @alterQuery = 'ALTER TABLE bookings ADD COLUMN paid BOOLEAN DEFAULT FALSE';
        PREPARE stmt FROM @alterQuery;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END //

DELIMITER ;

-- Вызываем процедуру
CALL AddPaidColumnIfNeeded();

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
END //
DELIMITER ;
