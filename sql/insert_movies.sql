insert into movies (title, year, rid)
    select t.title, t.year, r.id
    from tmp_movies t, mpaa_ratings r
    where t.rating=r.rating
    union
    select t.title, t.year, null
    from tmp_movies t
    where t.rating="";