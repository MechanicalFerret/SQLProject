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