create table people (
    id int not null auto_increment,
    name varchar(255) not null,
    primary key (id),
    unique (name)
);

create table genres (
    id int not null auto_increment,
    name varchar(255) not null,
    primary key (id),
    unique (name)
);

create table mpaa_ratings (
    id int not null auto_increment,
    rating varchar(255),
    description text,
    primary key (id),
    unique (rating)
);

create table users (
    id int not null auto_increment,
    email varchar(255) not null,
    name varchar(255),
    password varchar(255) not null,
    age int,
    gender char(1),
    location varchar(255),
    primary key (id),
    unique (email)
);

create table actors (
    id int not null auto_increment,
    pid int not null,
    primary key (id),
    foreign key (pid) references people(id)
);

create table tmp_actors (
    name varchar(255) not null,
    title varchar(255),
    year smallint,
    role varchar(255)
);

create table directors (
    id int not null auto_increment,
    pid int not null,
    primary key (id),
    foreign key (pid) references people(id)
);

create table tmp_directors (
    name varchar(255) not null,
    title varchar(255) not null,
    year smallint null
);

create table producers (
    id int not null auto_increment,
    pid int not null,
    primary key (id),
    foreign key (pid) references people(id)
);

create table tmp_producers (
    name varchar(255) not null,
    title varchar(255) not null,
    year smallint null
);

create table movies (
    id int not null auto_increment,
    title varchar(255) not null,
    year smallint null,
    rid int null,
    primary key (id),
    foreign key (rid) references mpaa_ratings(id),
    constraint chk_year check (year > 1800),
    unique (title, year)
);

create table tmp_movies (
    title varchar(255) not null,
    year smallint,
    rating varchar(255)
);

create table friends (
    uid1 int not null,
    uid2 int not null,
    foreign key (uid1) references users(id),
    foreign key (uid2) references users(id),
    unique (uid1, uid2)
);

create table activities (
    id int not null auto_increment,
    content text,
    time timestamp,
    uid int not null,
    primary key (id),
    foreign key (uid) references users(id)
);

create table movies_actors (
    mid int not null,
    aid int not null,
    role varchar(255),
    foreign key (mid) references movies(id),
    foreign key (aid) references actors(id)
);

create table movies_directors (
    mid int not null,
    did int not null,
    foreign key (mid) references movies(id),
    foreign key (did) references directors(id),
    unique (mid, did)
);

create table movies_producers (
    mid int not null,
    pid int not null,
    foreign key (mid) references movies(id),
    foreign key (pid) references producers(id),
    unique (mid, pid)
);

create table movies_genres (
    mid int not null,
    gid int not null,
    foreign key (mid) references movies(id),
    foreign key (gid) references genres(id),
    unique (mid, gid)
);

create table ratings (
    uid int not null,
    mid int not null,
    rating smallint not null,
    foreign key (uid) references users(id),
    foreign key (mid) references movies(id),
    unique (uid, mid)
);

create table tmp_ratings (
    email varchar(255) not null,
    title varchar(255) not null,
    year smallint not null,
    rating smallint not null
);