
import 'package:either_dart/either.dart';

import '../entity/movie.dart';

mixin GetMoviesUseCase{
  Future<EitherMovieAPI<List<MovieEntity>>> fetchMoviesByCategory(EndPoint endpoint);
}

mixin GetGenreUseCase {
  Future<EitherMovieAPI<Map<int,String>>> fetchGenres();
}

class Failure {
  final int code;
  final String message;

  Failure(
      this.code,
      this.message,
      );

  @override
  bool operator == (Object other) =>
       identical(this, other) ||
  other is Failure &&
  other.code == this.code &&
  other.message == this.message;

  @override
  int get hashCode =>
      code.hashCode ^
      message.hashCode;
}

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}

typedef EitherMovieAPI<T> = Either<Failure, T>;
