import '../entity/movie.dart';
import '../use_cases/use_case_interface.dart';

abstract class MovieRepository {

  Future<EitherMovieAPI<List<MovieEntity>>> getMovies(EndPoint endPoint);

  Future<EitherMovieAPI<MovieEntity>> getMovieById(int id);

}

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}
