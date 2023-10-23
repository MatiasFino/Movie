import '../../domain/entity/movie.dart';

abstract class Bloc {
  void dispose();
  void fetchPopularMovies();
  void fetchNowPlayingMovies();
  void fetchTopRatedMovies();
  void fetchUpcomingMovies();
  String getGenre(int id);
  Stream<List<MovieEntity>> get movieStream;
}
