/* Performing analysis for Songify, a fictional music streaming service. Songify has a “freemium” model, meaning that it offers both a free product and a premium paid product. */

SELECT premium_users.user_id,
   plans.description
FROM premium_users
JOIN plans
  ON plans.id = premium_users.membership_plan_id;
 
SELECT plays.user_id, plays.play_date,
  songs.title
FROM plays
JOIN songs 
 ON plays.song_id = songs.id;
 
SELECT users.id
FROM users
LEFT JOIN premium_users
 ON users.id = premium_users.user_id 
WHERE premium_users.user_id IS NULL;

WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'

)
/*
Write query here
*/
SELECT january.user_id
FROM january
LEFT JOIN february
 ON january.user_id = february.user_id
WHERE february.user_id IS NULL;

 SELECT premium_users.user_id, 
  premium_users.purchase_date,
  premium_users.cancel_date,
  months.months
FROM premium_users
CROSS JOIN months;

/* Active or Inactive */

SELECT premium_users.user_id,
  months.months,
  CASE
    WHEN (
      premium_users.purchase_date <= months.months
      )
      AND
      (
        premium_users.cancel_date >= months.months
        OR
        premium_users.cancel_date IS NULL
      )
    THEN 'active'
    ELSE 'not_active'
  END AS 'status'
FROM premium_users
CROSS JOIN months;

SELECT *
FROM songs
UNION
SELECT *
FROM bonus_songs
LIMIT 10;

WITH play_count AS (
   SELECT song_id,
      COUNT(*) AS 'times_played'
   FROM plays
   GROUP BY song_id)
SELECT songs.title,
  songs.artist,
  play_count.times_played
FROM play_count
JOIN songs
  ON play_count.song_id = songs.id;