# Write your MySQL query statement below
select date_format(T.trans_date, '%Y-%m') as month,
       T.country, count(T.trans_date) as trans_count,
       count(case when state = 'approved' then 1 end) as approved_count,
       sum(T.amount) as trans_total_amount,
       ifnull(sum(case when state = 'approved' then T.amount end), 0) as approved_total_amount
from Transactions as T
group by T.country, year(T.trans_date), month(T.trans_date);
