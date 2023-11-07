USE cd;
SELECT recommendedby, COUNT(*) FROM members WHERE recommendedby IS NOT NULL GROUP BY recommendedby;
