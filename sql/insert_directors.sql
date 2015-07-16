insert into directors (pid)
    select distinct p.id
    from people p, tmp_directors t
    where p.name = t.name;