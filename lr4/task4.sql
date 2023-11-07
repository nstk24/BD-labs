-- вставляем новое значение параметра initialoutlay в строке с facid = 1
USE cd;
UPDATE facilities
SET initialoutlay = 10000
WHERE facid = 1;
SELECT * FROM facilities;