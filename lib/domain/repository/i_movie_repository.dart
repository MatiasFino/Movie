import 'package:dartz/dartz.dart';

import '../entity/movie.dart';

abstract class MovieRepository {

  Future<Either<String,List<MovieEntity>>> getMovies(EndPoint endPoint);

  Future<Either<String,MovieEntity>> getMovieById(int id);

}

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}
