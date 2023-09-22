import 'dart:async';

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/use_cases/implementations/use_case_impl.dart';
import '../../domain/use_cases/use_case_interface.dart';
import 'bloc.dart';

class BlocImpl extends Bloc{

  final GetPopularMoviesUseCase popularMoviesUseCase = GetPopularMoviesUseCaseImpl();
  final GetNowPlayingMoviesUseCase nowPlayingMoviesUseCase = GetNowPlayingMoviesUseCaseImpl();
  final GetTopRatedMoviesUseCase topRatedMoviesUseCase = GetTopRatedMoviesUseCaseImpl();
  final GetUpcomingMoviesUseCase upcomingMoviesUseCase = GetUpcomingMoviesUseCaseImpl();
  final GetMovieDetailsUseCase movieDetailsUseCase = GetMovieDetailsUseCaseImpl();

  final _moviesStream = StreamController<MovieEntity>();

  @override
  void dispose() {
      _moviesStream.close();
   }

  @override
  void initialize() {}

  void fetchPopularMovies() async {
     List<MovieEntity>? movies = await popularMoviesUseCase.run();
     movies!.forEach((movie) => _moviesStream.sink.add(movie));
  }


}
