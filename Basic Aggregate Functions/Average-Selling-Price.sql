# Write your MySQL query statement below
select P.product_id, ifnull(round(sum(price * units)/sum(units), 2), 0) as average_price
from Prices P left join UnitsSold U
on P.product_id = U.product_id
and U.purchase_date between P.start_date and end_date
group by P.product_id;
