insert into movies_actors (mid, aid, role)
    select distinct m.id, a.id, t.role
    from tmp_actors t, movies m, actors a, people p
    where t.name=p.name and
    	  a.pid=p.id and
	  t.title=m.title and
	  (t.year=m.year or (t.year is null and m.year is null));