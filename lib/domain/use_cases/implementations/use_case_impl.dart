import 'package:dartz/dartz.dart';

import '../../../data/repository/movies_from_api.dart';
import '../../entity/movie.dart';
import '../../repository/i_movie_repository.dart';
import '../use_case_interface.dart';
import 'package:get/get.dart';

class GetMovieDetailsUseCaseImpl extends GetMovieDetailsUseCase {
  final MovieRepository repository = Get.put(MoviesFromAPI());

  @override
  Future<Either<String, MovieEntity>> run(int id) async {
    return await repository.getMovieById(id);
  }
}

class GetUpcomingMoviesUseCaseImpl extends GetUpcomingMoviesUseCase {
  final MovieRepository repository = Get.put(MoviesFromAPI());

  @override
  Future<Either<String, List<MovieEntity>>> run() async {
    return await repository.getMovies(EndPoint.UPCOMING);
  }
}

class GetNowPlayingMoviesUseCaseImpl extends GetNowPlayingMoviesUseCase {
  final MovieRepository repository = Get.put(MoviesFromAPI());

  @override
  Future<Either<String, List<MovieEntity>>> run() async {
    return await repository.getMovies(EndPoint.NOW_PLAYING);
  }
}

class GetTopRatedMoviesUseCaseImpl extends GetTopRatedMoviesUseCase {
  final MovieRepository repository = Get.put(MoviesFromAPI());

  @override
  Future<Either<String, List<MovieEntity>>> run() async {
    return await repository.getMovies(EndPoint.TOP_RATED);
  }
}

class GetPopularMoviesUseCaseImpl extends GetPopularMoviesUseCase {
  final MovieRepository repository = Get.put(MoviesFromAPI());

  @override
  Future<Either<String, List<MovieEntity>>> run() async {
    return await repository.getMovies(EndPoint.POPULAR);
  }
}
