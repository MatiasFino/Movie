import '../../domain/entity/movie.dart';

abstract class Bloc {
  void initialize();

  void dispose();
  void fetchPopularMovies();
  void fetchNowPlayingMovies();
  void fetchTopRatedMovies();
  void fetchUpcomingMovies();
  void fetchMovieDetails(int id);
  Stream<List<MovieEntity>> get stream;
}
