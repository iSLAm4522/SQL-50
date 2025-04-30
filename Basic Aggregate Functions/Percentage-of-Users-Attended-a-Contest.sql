# Write your MySQL query statement below
select R.contest_id, round(count(R.contest_id) * 100.0 / (select count(user_id) from Users), 2) as percentage
from Users as U join Register R
on U.user_id = R.user_id
group by R.contest_id
order by percentage desc, R.contest_id asc;
