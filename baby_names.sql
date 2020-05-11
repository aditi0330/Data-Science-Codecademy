SELECT year, number
FROM babies

WHERE name = 'Lillian';
SELECT DISTINCT name
FROM babies
WHERE name LIKE "S%"
LIMIT 20;
SELECT name, gender, number
FROM babies
WHERE year = 1880
ORDER BY number DESC
LIMIT 10;