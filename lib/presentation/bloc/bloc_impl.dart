import 'dart:async';

import '../../core/utils/data_state.dart';
import '../../domain/entity/movie.dart';
import '../../domain/use_cases/implementations/use_case_impl.dart';
import 'bloc.dart';

class BlocImpl extends Bloc {
  final UseCases useCases;
  final _moviesStream = StreamController<List<MovieEntity>>();
  Map<int, String> genres = {};

  @override
  Stream<List<MovieEntity>> get movieStream => _moviesStream.stream;

  @override
  void dispose() {
      _moviesStream.close();
  }

  BlocImpl({this.useCases = const UseCases()}) {
    fetchGenres();
  }

  @override
  void fetchMoviesByCategory(EndPoint endPoint) async {
    DataState<List<MovieEntity>> movies =
        await useCases.fetchMoviesByCategory(endPoint);
    if (movies is SuccessState){
    _moviesStream.sink.add(movies.data!);
    } else {
      _moviesStream.addError(movies.failure!);
    }
  }

  void fetchGenres() async {
    DataState<Map<int, String>> genreList = await useCases.fetchGenres();
    genres = genreList.data ?? {};
    }

  @override
  String getGenre(int id) => genres[id]!;
}
