insert into actors (pid)
    select distinct p.id
    from people p, tmp_actors t
    where p.name = t.name;