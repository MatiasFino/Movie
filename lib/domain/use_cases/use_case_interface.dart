import 'package:dartz/dartz.dart';

import '../entity/movie.dart';

abstract class GetMovieDetailsUseCase {

  Future<Either<String,MovieEntity>> run(int id);
}

abstract class GetPopularMoviesUseCase{

  Future<Either<String,List<MovieEntity>>> run();
}

abstract class GetNowPlayingMoviesUseCase{

  Future<Either<String,List<MovieEntity>>> run();
}

abstract class GetTopRatedMoviesUseCase{

  Future<Either<String,List<MovieEntity>>> run();
}

abstract class GetUpcomingMoviesUseCase{

  Future<Either<String,List<MovieEntity>>> run();
}

abstract class GetSimilarMoviesUseCase{

  Future<Either<String,List<MovieEntity>>> run();
}
