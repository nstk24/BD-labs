    /*Создайте таблицу payments со структурой (payid INT PK, FK on booking.bookid; payment  DECIMAL.)*/
USE cd;
CREATE TABLE paymente (
  payid INT PRIMARY KEY,
  bookid INT,
  payment DECIMAL,
  FOREIGN KEY (bookid) REFERENCES cd.bookings(bookid)
);
/*Добавьте в таблицу bookings поле payed, смысл которого оплачена или не оплачена аренда.*/
ALTER TABLE bookings ADD COLUMN payed BOOLEAN NOT NULL DEFAULT FALSE;
/*Создайте триггеры, которые: 1) Запрещают удаление записей, если они уже оплачены;*/
DELIMITER $$

DROP TRIGGER IF EXISTS prevent_payment_deletion;
CREATE TRIGGER prevent_payment_deletion 
BEFORE DELETE ON bookings 
FOR EACH ROW 
BEGIN
  IF OLD.payed = TRUE THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Can not delete a paid booking';
  END IF;
END$$
 
DELIMITER ;
/*2) После отметки оплаты, заносят в таблицу payments запись с соответствующим значением PK 
и суммой оплаты, для вычисления которой используется функция созданная в Task-7-1.*/
DELIMITER $$

DROP TRIGGER IF EXISTS record_payment;
CREATE TRIGGER record_payment AFTER UPDATE ON bookings 
FOR EACH ROW 
BEGIN
  IF NEW.paye = TRUE THEN
    INSERT INTO payments (payid, bookid, payment) VALUES (NEW.bookid, NEW.payment);
  END IF;
END$$

DELIMITER ;
/*3) При отмене оплаты - удаляет соответствующую запись в таблице payments.*/
DELIMITER $$

DROP TRIGGER IF EXISTS delete_payment;
CREATE TRIGGER delete_payment 
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
  IF NEW.payed = FALSE THEN
    DELETE FROM payments WHERE bookid = NEW.bookid;
  END IF;
END$$

DELIMITER ;
/*Напишите скрипт, который отмечает, что все аренды июля 2012 года оплачены.*/
UPDATE bookings 
SET payed = TRUE 
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;
/*Посчитайте (написав соответствующий скрипт) оплату на июль 2012 года двумя способами: 1) используя данные таблицы payments*/
SELECT SUM(payment) as costJuly1
FROM payments 
WHERE bookid IN (SELECT bookid FROM bookings WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7);
/*2) используя только функцию из Task-7-1 и данные таблицы bookings.*/
SELECT SUM(CalculateRentalCost(memid, facid, slots)) as costJuly2
FROM bookings 
WHERE YEAR(starttime) = 2012 AND MONTH(starttime) = 7;