# Write your MySQL query statement below
SELECT round(count(case when d1.order_date = d1.customer_pref_delivery_date then 1 end) * 100 / nullif(count(*), 0), 2) as immediate_percentage
FROM Delivery d1
WHERE order_date = (
  SELECT MIN(d2.order_date)
  FROM Delivery d2
  WHERE d2.customer_id = d1.customer_id
);
