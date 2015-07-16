set session query_cache_type=off;

drop table if exists q1, q2, q3, q4, q5, q6, q7, q8, q9, q9t1, q9t2, q9t3, q10, q10t1, q10t2, q10t3, q10t4;

set profiling=1, profiling_history_size=100;

# 1
create table q1 as (
    select distinct *
    from movies m
    where m.title like "Life%"
);

# 2
create table q2 as (
    select distinct m.*
    from movies_actors ma, movies m, actors a, people p
    where ma.mid=m.id and ma.aid=a.id and a.pid=p.id and p.name="Pitt, Brad"
);

# 3
create table q3 as (
    select distinct a.*
    from movies_directors md, movies m, directors d, people p, movies_actors ma, actors a
    where md.mid=m.id and md.did=d.id and
        ma.mid=m.id and ma.aid=a.id and
        d.pid=p.id and p.name="Spielberg, Steven"
);

# 4
create table q4 as (
    select count(*)
    from ratings r
    group by r.rating
);

# 5
create table q5 as (
    select distinct p.name
    from users u, movies m, ratings r, movies_directors md, directors d, people p
    where u.name="DERRICK MYERS" and u.age=36 and
        r.uid=u.id and r.mid=m.id and r.rating=10 and
        md.mid=m.id and md.did=d.id and d.pid=p.id
);

# 6
create table q6 as (
    select distinct m.title, m.year, avg(u.age) as 'avg age'
    from movies m, ratings r, users u
    where m.num_ratings>5000 and m.id=r.mid and r.uid=u.id group by m.title
);

# 7
create table q7 as (
    select distinct u.email, u.name, u.age, u.location
    from ratings r, users u, movies m, mpaa_ratings mpr
    where r.uid=u.id and r.mid=m.id and m.rid=mpr.id and mpr.rating="NC-17" and u.age<=17
);

# 8
create table q8 as (
       select m.title, m.year, m.avg_rating
       from movies m
       where m.num_ratings>1000
       order by m.avg_rating desc
       limit 5
);

# 9
create table q9t3 as (
       select *
       from movies m
       where m.num_ratings>1000
       order by m.avg_rating desc
       limit 5
);

create table q9t1 as (
    select distinct u.*
    from users u, ratings r, q9t3 b
    where r.uid=u.id and r.mid=b.id
    group by u.id
    having count(*)>=2
);

create table q9t2 as (
    select distinct u.*
    from users u, ratings r, q9t3 b
    where r.mid=b.id and r.rating<9 and r.uid=u.id
);

create table q9 as (
    select t.email
    from q9t1 t
    where t.id not in (select id from q9t2)
);

# 10
create table q10t3 as (
       select *
       from movies m
       where m.num_ratings>1000
       order by m.avg_rating desc
       limit 5
);

create table q10t1 as (
    select distinct u.*
    from users u, ratings r, q10t3 b
    where r.uid=u.id and r.mid=b.id
    group by u.id
    having count(*)>=2
);

create table q10t2 as (
    select distinct u.*
    from users u, ratings r, q10t3 b
    where r.mid=b.id and r.rating<9 and r.uid=u.id
);

create table q10t4 as (
    select *
    from q10t1 t
    where t.id not in (select id from q9t2)
);

create table q10 as (
    select m.title, m.year, avg(r.rating)
    from movies m, ratings r, q10t4 u
    where r.uid=u.id and r.mid=m.id
    group by r.mid
    having count(*)>2
    order by avg(r.rating) desc
    limit 10
);

show profiles;

drop table if exists q1, q2, q3, q4, q5, q6, q7, q8, q9, q9t1, q9t2, q9t3, q10, q10t1, q10t2, q10t3, q10t4;