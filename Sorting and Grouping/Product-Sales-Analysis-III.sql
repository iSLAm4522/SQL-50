# Write your MySQL query statement below
with FirstYear as(
select first_value(S.year) over(partition by S.product_id order by S.year asc) as first_year, S.product_id
    from Sales S
)

select distinct S.product_id, S.year as first_year, S.quantity, S.price
from Sales S join FirstYear F
on S.year = F.first_year and S.product_id = F.product_id;
