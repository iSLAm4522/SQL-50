# Write your MySQL query statement below
select query_name, round(sum(Q.rating / Q.position) / count(Q.query_name), 2) as quality, round(sum(Q.rating < 3) * 100.0/ count(Q.query_name), 2) as poor_query_percentage
from Queries as Q
group by Q.query_name;
