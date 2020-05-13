/* The Metropolitan Museum of Art of New York is one of the world’s largest and finest art museums.

In this project, we will be working with a table named met that contains the museum’s collection of American Decorative Arts. */

SELECT *
FROM met
LIMIT 10;
SELECT COUNT( *)
FROM met;
SELECT DISTINCT category
FROM met
WHERE category LIKE '%celery%';
SELECT MIN(date)
FROM met;
SELECT date, title, medium
FROM met
WHERE date LIKE '%1600%';
SELECT country, COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;
SELECT category, COUNT(*)
FROM met
GROUP BY category
HAVING COUNT(*) > 100
ORDER BY COUNT(*) DESC;
SELECT medium, COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
   OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;
SELECT CASE
   WHEN medium LIKE '%gold%'   THEN 'Gold'
   WHEN medium LIKE '%silver%' THEN 'Silver'
   ELSE NULL
  END AS 'Bling',
  COUNT(*)
FROM met
WHERE Bling IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;