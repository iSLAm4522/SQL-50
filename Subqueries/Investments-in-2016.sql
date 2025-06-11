WITH unique_locations AS (
    SELECT tiv_2015, tiv_2016
    FROM Insurance
    GROUP BY lat, lon 
    HAVING COUNT(*) = 1
),
duplicate_tiv_2015 AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
SELECT ROUND(SUM(u.tiv_2016), 2) AS tiv_2016
FROM unique_locations u
INNER JOIN duplicate_tiv_2015 d ON u.tiv_2015 = d.tiv_2015;
