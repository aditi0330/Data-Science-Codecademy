/* A funnel is a marketing model which illustrates the theoretical customer journey towards the purchase of a product or service.
Oftentimes, we want to track how many users complete a series of steps and know which steps have the most number of users giving up.*/

/* From Single Table */

SELECT question_text,
 COUNT(DISTINCT user_id)
FROM survey_responses
GROUP BY 1;

 SELECT modal_text,
  COUNT(DISTINCT user_id)
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;

SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) AS 'control_clicks',
  COUNT(DISTINCT CASE
    WHEN ab_group = 'variant' THEN user_id
    END) AS 'variant_clicks'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;

/* From Multiple Tables */

SELECT DISTINCT b.browse_date, 
  b.user_id,
  c.user_id IS NOT NULL AS 'is_checkout',
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM browse AS 'b'
LEFT JOIN checkout AS 'c'
  ON c.user_id = b.user_id
LEFT JOIN purchase AS 'p'
  ON p.user_id = c.user_id
LIMIT 50;

WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT COUNT(*) AS num_browse,
 SUM(is_checkout) AS num_checkout,
 SUM(is_purchase) AS num_purchase,
 1.0 * SUM(is_checkout) / COUNT(user_id),
 1.0 * SUM(is_purchase) / SUM(is_checkout)
FROM funnels;

WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT browse_date,
   COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels
GROUP BY 1
ORDER BY 1;