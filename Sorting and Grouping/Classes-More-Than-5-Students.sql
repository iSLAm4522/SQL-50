# Write your MySQL query statement below
select subQuery.class
from (
    select class, count(student) as cnt
    from Courses
    group by class
) as subQuery
where subQuery.cnt >= 5;
