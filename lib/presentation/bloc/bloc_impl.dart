import 'dart:async';

import 'package:get/get.dart';

import '../../data/repository/genres_from_api.dart';
import '../../domain/entity/movie.dart';
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

  final _genreRepository = Get.put(GenresFromAPI());
  final _moviesStream = StreamController<List<MovieEntity>>();
  late Map<int, String> genres;

  @override
  String getGenre(int id) => _genreRepository.genres[id]!;

  @override
  Stream<List<MovieEntity>> get movieStream => _moviesStream.stream;

  @override
  void dispose() {
    //  _moviesStream.close();
  }

  BlocImpl(){
    fetchGenres();
  }

  void fetchGenres() async {
    final genresFromRepo = await _genreRepository.getGenres();
    genresFromRepo.fold((left) => {}, (genresMap) => genres = genresMap);
  }

  @override
  void fetchPopularMovies() async {
    EitherMovieAPI<List<MovieEntity>> movies = await popularMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchNowPlayingMovies() async {
    EitherMovieAPI<List<MovieEntity>> movies =
        await nowPlayingMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchTopRatedMovies() async {
    EitherMovieAPI<List<MovieEntity>> movies =
        await topRatedMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchUpcomingMovies() async {
    EitherMovieAPI<List<MovieEntity>> movies =
        await upcomingMoviesUseCase.run();
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  @override
  void fetchMovieDetails(int id) async {
    EitherMovieAPI<MovieEntity> movies = await movieDetailsUseCase.run(id);
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movie) => _moviesStream.sink.add(List.filled(1, movie)),
    );
  }
}
