# Write your MySQL query statement below
select A1.machine_id, round(avg(A1.timestamp - A2.timestamp), 3) as processing_time
from Activity as A1 join Activity as A2
on A1.machine_id = A2.machine_id and A1.process_id = A2.process_id and
A1.activity_type = 'end' and A2.activity_type = 'start'
group by A1.machine_id;
