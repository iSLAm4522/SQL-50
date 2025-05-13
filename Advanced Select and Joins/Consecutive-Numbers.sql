# Write your MySQL query statement below
with grouped as (
select num, row_number() over (order by id) - row_number() over (partition by num order by id) as group_id
from Logs
),
consecutive_counts as (
    select num, count(*) as consecutive_count
    from grouped
    group by num, group_id
)

select distinct num as ConsecutiveNums
from consecutive_counts
where consecutive_count >= 3;
