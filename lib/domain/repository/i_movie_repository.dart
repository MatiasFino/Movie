import '../entity/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();

  Future<Movie> getMovieById(int id);
}
