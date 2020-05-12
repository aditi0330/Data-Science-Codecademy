
/* Analyzing the user data of a streaming video company, Codeflix. */

SELECT COUNT(*)
FROM users
WHERE email LIKE '%.com';
SELECT first_name, COUNT(*) AS 'count'
FROM users
GROUP BY first_name
ORDER BY 2 DESC;

SELECT ROUND(watch_duration_in_minutes) AS 'duration',
 COUNT(*) AS 'count'
FROM watch_history
GROUP BY 1
ORDER BY 1;

SELECT user_id, SUM(amount) AS total
FROM payments
WHERE status = 'paid'
GROUP BY 1
ORDER BY 2 DESC;

SELECT user_id, SUM(watch_duration_in_minutes)
FROM watch_history
GROUP BY 1
HAVING SUM(watch_duration_in_minutes) > 400;

SELECT ROUND(SUM(watch_duration_in_minutes))
FROM watch_history;

SELECT pay_date, SUM(amount)
FROM payments
WHERE status = 'paid'
GROUP BY 1
ORDER BY 2 DESC;

SELECT AVG(amount)
FROM payments
WHERE status = 'paid';
