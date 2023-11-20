-- Используем базу данных "cd"
USE cd;

-- Выбираем номер участника (ParticipantNumber), идентификатор участника (MemberID), имя (FirstName) и фамилию (LastName)
-- Применяем функцию ROW_NUMBER() для присвоения уникального номера каждому участнику в порядке возрастания даты присоединения (joindate)
-- Сортируем результаты по порядковому номеру участника
SELECT
    ROW_NUMBER() OVER (ORDER BY joindate) AS ParticipantNumber,
    memid AS MemberID,
    firstname AS FirstName,
    surname AS LastName
FROM
    members
ORDER BY
    ParticipantNumber;

