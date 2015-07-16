c2="mysqlimport -v -h cs445sql --user=mdludwig --password=EL104mdl -L FLP"

$c2 -c name ${1}/people.txt
$c2 -c rating,description ${1}/mpaa_ratings.txt
$c2 -c email,name,password,age,gender,location ${1}/users.txt
$c2 -c title,year,name,role ${1}/tmp_actors.txt
$c2 -c title,year,name ${1}/tmp_directors.txt
$c2 -c title,year,name ${1}/tmp_producers.txt
$c2 -c title,year,rating ${1}/tmp_movies.txt
$c2 -c email,title,year,rating ${1}/tmp_ratings.txt