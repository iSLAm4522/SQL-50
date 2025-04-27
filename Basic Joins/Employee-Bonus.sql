# Write your MySQL query statement below
select name, B.bonus 
from Employee as E left join Bonus as B
on E.empId = B.empId
where B.bonus < 1000 or B.bonus is null;
