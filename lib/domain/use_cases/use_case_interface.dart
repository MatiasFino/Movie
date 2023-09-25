import 'package:dartz/dartz.dart';

import '../entity/movie.dart';

abstract class GetMovieDetailsUseCase {

  Future<EitherMovie<MovieEntity>> run(int id);
}

abstract class GetPopularMoviesUseCase{

  Future<EitherMovie<List<MovieEntity>>> run();
}

abstract class GetNowPlayingMoviesUseCase{

  Future<EitherMovie<List<MovieEntity>>> run();
}

abstract class GetTopRatedMoviesUseCase{

  Future<EitherMovie<List<MovieEntity>>> run();
}

abstract class GetUpcomingMoviesUseCase{

  Future<EitherMovie<List<MovieEntity>>> run();
}

abstract class GetSimilarMoviesUseCase{

  Future<EitherMovie<List<MovieEntity>>> run();
}

class Failure {
  final int code;
  final String message;

  Failure(
      this.code,
      this.message,
      );
}

typedef EitherMovie<T> = Either<Failure, T>;
