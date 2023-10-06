import '../../domain/entity/movie.dart';

abstract class Bloc {
  void dispose();
  void fetchPopularMovies();
  void fetchNowPlayingMovies();
  void fetchTopRatedMovies();
  void fetchUpcomingMovies();
  Stream<List<MovieEntity>> get movieStream;
  String getGenre (int id);
}
