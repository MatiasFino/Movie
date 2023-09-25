import '../../domain/entity/movie.dart';

abstract class Bloc {
  void dispose();
  void fetchPopularMovies();
  void fetchNowPlayingMovies();
  void fetchTopRatedMovies();
  void fetchUpcomingMovies();
  void fetchMovieDetails(int id);
  Stream<List<MovieEntity>> get movieStream;
  String getGenre (int id);
}
