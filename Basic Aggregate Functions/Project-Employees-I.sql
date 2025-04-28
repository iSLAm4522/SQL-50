# Write your MySQL query statement below
select p.project_id, round(avg(E.experience_years), 2) as average_years
from Project as P join Employee as E
on P.employee_id = E.employee_id
group by p.project_id;
