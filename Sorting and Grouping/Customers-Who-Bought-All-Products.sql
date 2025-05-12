# Write your MySQL query statement below
select C.customer_id
from Customer C
group by C.customer_id
having count(distinct C.product_key) = (
    select count(*)
    from Product
);
