import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/use_cases/implementations/use_case_impl.dart';
import '../../domain/use_cases/use_case_interface.dart';
import 'bloc.dart';

class BlocImpl extends Bloc {
  final GetPopularMoviesUseCase popularMoviesUseCase =
      GetPopularMoviesUseCaseImpl();
  final GetNowPlayingMoviesUseCase nowPlayingMoviesUseCase =
      GetNowPlayingMoviesUseCaseImpl();
  final GetTopRatedMoviesUseCase topRatedMoviesUseCase =
      GetTopRatedMoviesUseCaseImpl();
  final GetUpcomingMoviesUseCase upcomingMoviesUseCase =
      GetUpcomingMoviesUseCaseImpl();
  final GetMovieDetailsUseCase movieDetailsUseCase =
      GetMovieDetailsUseCaseImpl();

  final _moviesStream = StreamController<List<MovieEntity>>();

  @override
  Stream<List<MovieEntity>> get stream => _moviesStream.stream;

  @override
  void dispose() {
    _moviesStream.close();
  }

  @override
  void initialize() {
    fetchNowPlayingMovies();
  }

  @override
  void fetchPopularMovies() async {
    EitherMovie<List<MovieEntity>> movies = await popularMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchNowPlayingMovies() async {
    EitherMovie<List<MovieEntity>> movies = await nowPlayingMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(
        (movieList),
      ),
    );
  }

  @override
  void fetchTopRatedMovies() async {
    EitherMovie<List<MovieEntity>> movies = await topRatedMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchUpcomingMovies() async {
    EitherMovie<List<MovieEntity>> movies = await upcomingMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchMovieDetails(int id) async {
    EitherMovie<MovieEntity> movies = await movieDetailsUseCase.run(id);
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movie) => _moviesStream.sink.add(List.filled(1, movie)),
    );
  }
}
