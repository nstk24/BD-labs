USE cd;
SELECT LEFT(surname,1) AS first_letter, COUNT(*) AS count_members
FROM members
GROUP BY first_letter
ORDER BY first_letter DESC;