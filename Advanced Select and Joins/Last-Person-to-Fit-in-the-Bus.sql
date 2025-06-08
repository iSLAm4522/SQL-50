# Write your MySQL query statement below
with CumulativeWeight as(
    select person_name, sum(weight) over(order by turn) as Total_Weight
    from Queue
)

select person_name
from CumulativeWeight
where Total_Weight <= 1000
order by Total_Weight desc
limit 1;
