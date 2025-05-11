# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogins AS (
    SELECT DISTINCT f.player_id
    FROM FirstLogin f
    JOIN Activity a
    ON f.player_id = a.player_id
    AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT ROUND(
    (SELECT COUNT(DISTINCT player_id) FROM ConsecutiveLogins) / 
    (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2
) AS fraction;
