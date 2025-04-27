# Write your MySQL query statement below
select W1.id
from Weather as W1 join Weather as W2
on W1.temperature > W2.temperature
and DATEDIFF(W1.recordDate, W2.recordDate) = 1;
