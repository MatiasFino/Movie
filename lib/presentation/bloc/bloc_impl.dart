import 'dart:async';

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/use_cases/implementations/use_case_impl.dart';
import '../../domain/use_cases/use_case_interface.dart';
import 'bloc.dart';

class BlocImpl extends Bloc {
  final UseCases useCases;
  final _moviesStream = StreamController<List<MovieEntity>>();
  Map<int, String> genres = {};

  @override
  Stream<List<MovieEntity>> get movieStream => _moviesStream.stream;

  @override
  void dispose() {
    //  _moviesStream.close();
  }

  BlocImpl({this.useCases = const UseCases()}) {
    fetchGenres();
  }

  @override
  void fetchMoviesByCategory(EndPoint endPoint) async {
    EitherMovieAPI<List<MovieEntity>> movies =
        await useCases.fetchMoviesByCategory(endPoint);
    movies.fold(
      (left) => _moviesStream.sink.addError(left),
      (movieList) => _moviesStream.sink.add(movieList),
    );
  }

  void fetchGenres() async {
    EitherMovieAPI<Map<int, String>> genreList = await useCases.fetchGenres();
    genreList.fold((left) => genres = {}, (right) => this.genres = right);
  }

  @override
  String getGenre(int id) => genres[id]!;
}
