# Write your MySQL query statement below
select S.user_id, round(avg(case when C.action = 'confirmed' then 1 else 0 end), 2) as confirmation_rate
from Signups S left join Confirmations C
on S.user_id = C.user_id
group by S.user_id;
