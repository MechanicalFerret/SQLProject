
public class DataParserDriver {

	public static void main(String[] args) {
		DataParser movies = new DataParser("movies.sample.txt", "movies.txt");
		movies.processMovieData();
//		DataParser people = new DataParser("movies.sample.txt", "people.txt");
//		people.processPeopleData();
//		DataParser MpaaRatings = new DataParser("mpaa.txt", "mpaa_ratings.txt");
//		MpaaRatings.processMpaaData();
//		DataParser actor = new DataParser("movies.sample.txt", "actors.txt");
//		actor.processActorData();
//		DataParser producer = new DataParser("movies.sample.txt", "producers.txt");
//		producer.processProducerData();
//		DataParser director = new DataParser("movies.sample.txt", "directors.txt");
//		director.processDirectorData();
//		DataParser movieDirector = new DataParser("movies.sample.txt", "movie_directors.txt");
//		movieDirector.processMovieDirectorData();
	}

}
