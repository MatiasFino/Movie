import 'package:dartz/dartz.dart';

import '../entity/movie.dart';
import '../use_cases/use_case_interface.dart';

abstract class MovieRepository {

  Future<EitherMovie<List<MovieEntity>>> getMovies(EndPoint endPoint);

  Future<EitherMovie<MovieEntity>> getMovieById(int id);

}

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}
