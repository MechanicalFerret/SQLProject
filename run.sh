c1="mysql -v -h cs445sql --user=$1 --password=$2 FLP"
c2="mysqlimport -v -h cs445sql --user=$1 --password=$2 -L FLP"

$c1 < sql/drop_tables.sql
$c1 < sql/create_tables.sql

$c2 -c name ${3}/people.txt
$c2 -c rating,description ${3}/mpaa_ratings.txt
$c2 -c email,name,password,age,gender,location ${3}/users.txt
$c2 -c title,year,name,role ${3}/tmp_actors.txt
$c2 -c title,year,name ${3}/tmp_directors.txt
$c2 -c title,year,name ${3}/tmp_producers.txt
$c2 -c title,year,rating ${3}/tmp_movies.txt
$c2 -c email,title,year,rating ${3}/tmp_ratings.txt

tables=(
    actors
    directors
    producers
    movies
    ratings
    movies_actors
    movies_directors
    movies_producers
)

for i in ${tables[@]}; do
    $c1 < sql/insert_${i}.sql
done

$c1 < sql/drop_tmp_tables.sql
