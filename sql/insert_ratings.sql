insert into ratings (uid, mid, rating)
    select distinct u.id, m.id, t.rating
    from tmp_ratings t, users u, movies m
    where t.email=u.email and t.title=m.title and t.year=m.year;