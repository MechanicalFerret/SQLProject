insert into movies_producers (mid, pid)
    select distinct m.id, pr.id
    from tmp_producers t, movies m, producers pr, people p
    where t.name=p.name and
    	  pr.pid=p.id and
	  t.title=m.title and
	  (t.year=m.year or (t.year is null and m.year is null));