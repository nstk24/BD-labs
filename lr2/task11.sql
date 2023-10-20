USE cd;
SELECT firstname AS 'объединение', 'член клуба' AS 'расположение' FROM members
UNION
SELECT facility AS 'объединение', 'объект' AS 'расположение' FROM facilities;