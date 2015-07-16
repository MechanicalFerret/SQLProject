insert into producers (pid)
    select distinct p.id
    from people p, tmp_producers t
    where p.name = t.name;