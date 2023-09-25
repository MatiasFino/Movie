import 'package:dartz/dartz.dart';

import '../entity/movie.dart';

abstract class GetMovieDetailsUseCase {

  Future<EitherMovieAPI<MovieEntity>> run(int id);
}

abstract class GetPopularMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> run();
}

abstract class GetNowPlayingMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> run();
}

abstract class GetTopRatedMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> run();
}

abstract class GetUpcomingMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> run();
}

abstract class GetSimilarMoviesUseCase{

  Future<EitherMovieAPI<List<MovieEntity>>> run();
}

class Failure {
  final int code;
  final String message;

  Failure(
      this.code,
      this.message,
      );
}

typedef EitherMovieAPI<T> = Either<Failure, T>;
