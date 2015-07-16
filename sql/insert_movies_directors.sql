insert into movies_directors (mid, did)
    select distinct m.id, d.id
    from tmp_directors t, movies m, directors d, people p
    where t.name=p.name and
    	  d.pid=p.id and
    	  t.title=m.title and
	  (t.year=m.year or (t.year is null and m.year is null));