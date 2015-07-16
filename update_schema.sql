update movies m
set m.num_ratings = (
    select count(*)
    from ratings r
    where r.mid=m.id
),
m.avg_rating = (
    select avg(r.rating)
    from ratings r
    where r.mid=m.id
);