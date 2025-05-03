# Write your MySQL query statement below
select 
    E1.employee_id, 
    case 
        when (count(employee_id)) = 1 then E1.department_id 
        else (
            select E2.department_id 
            from Employee E2 
            where E1.employee_id = E2.employee_id 
            and E2.primary_flag = 'Y'
        )
    end as department_id
from Employee E1
group by employee_id
