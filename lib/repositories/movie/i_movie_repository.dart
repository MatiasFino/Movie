import '/data_classes/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();

  Future<Movie> getMovieById(int id);
}
