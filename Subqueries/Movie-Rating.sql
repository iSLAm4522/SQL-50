# Write your MySQL query statement below

(
with Movies_Count as(
    select user_id, count(user_id) as movies_count
    from MovieRating
    group by user_id
)

select name as results
from Users as U join Movies_Count M
on U.user_id = M.user_id
order by M.movies_count desc, U.name asc
limit 1 )

union all

(
with Movies_Rating as (
    select movie_id, avg(rating) as avg_rating
    from MovieRating
    where created_at between '2020-02-01' and '2020-02-29'
    group by movie_id
)

select title as results
from Movies join Movies_Rating
on Movies.movie_id = Movies_Rating.movie_id
order by avg_rating desc, title asc
limit 1 )
