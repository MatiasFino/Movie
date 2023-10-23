import 'package:dartz/dartz.dart';

import '../entity/movie.dart';

mixin GetPopularMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> fetchPopularMovies();
}

mixin GetNowPlayingMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> fetchNowPlayingMovies();
}

mixin GetTopRatedMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> fetchTopRatedMovies();
}

mixin GetUpcomingMoviesUseCase{


  Future<EitherMovieAPI<List<MovieEntity>>> fetchUpcomingMovies();
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
      // identical(this, other) ||
  other is Failure &&
  other.code == this.code &&
  other.message == this.message;

  @override
  int get hashCode =>
      code.hashCode ^
      message.hashCode;
}

typedef EitherMovieAPI<T> = Either<Failure, T>;
