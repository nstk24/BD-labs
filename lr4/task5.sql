-- вставляем новые значения папаметров membercost и guestcost, в полях с facid = 0 и 1
USE cd;
UPDATE facilities
SET membercost = 6, guestcost = 30
WHERE facid IN (0, 1);
SELECT * FROM facilities;