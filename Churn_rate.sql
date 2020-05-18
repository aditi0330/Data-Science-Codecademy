/* Churn rate calculation

SELECT 1.0 * 
(
  SELECT COUNT(*)
  FROM subscriptions
  WHERE subscription_start < '2017-01-01'
  AND (
    subscription_end
    BETWEEN '2017-01-01'
    AND '2017-01-31'
  )
) / (
  SELECT COUNT(*) 
  FROM subscriptions 
  WHERE subscription_start < '2017-01-01'
  AND (
    (subscription_end >= '2017-01-01')
    OR (subscription_end IS NULL)
  )
) 
AS result;

WITH enrollments AS 
(SELECT *
FROM subscriptions
WHERE subscription_start < '2017-01-01'
AND (
  (subscription_end >= '2017-01-01')
  OR (subscription_end IS NULL)
)),
status AS 
(SELECT 
CASE
  WHEN (subscription_end > '2017-01-31')
    OR (subscription_end IS NULL) THEN 0
  ELSE 1
  END as is_canceled,
CASE
  WHEN (subscription_start < '2017-01-01')
    AND (
      (subscription_end >= '2017-01-01')
        OR (subscription_end IS NULL)
    ) THEN 1
    ELSE 0
  END as is_active
FROM enrollments
)
SELECT 1.0 * SUM(is_canceled)/SUM(is_active) FROM status;

with months as
(
SELECT
'2017-01-01' AS first_day,
'2017-01-31' AS last_day
union
SELECT
'2017-02-01' AS first_day,
'2017-02-28' AS last_day
union
SELECT
'2017-03-01' AS first_day,
'2017-03-31' AS last_day)
SELECT *
FROM months;

cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months)
status AS
(SELECT id,
 first_day 'month',
 CASE
   WHEN subscription_start < first_day 
   AND (
       (subscription_end > first_day)
       OR (subscription_end IS NULL)
       )
       THEN 1
       ELSE 0
       END AS 'is_active'
 FROM cross_join
)
CASE
    WHEN strftime("%Y-%m", subscription_end) = strftime("%Y-%m", last_day) THEN 1
    ELSE 0
  END AS is_canceled
SELECT *
FROM cross_join
LIMIT 100;
