import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/data_state.dart';
import '../../domain/repository/i_genre_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../data_sources/remote/api_const.dart';
import '../data_sources/remote/api_service.dart';

class GenresFromAPI implements GenresRepository {

  final IMovieService _movieService = const MovieServiceImpl();
  const GenresFromAPI();

  @override
  Future<DataState<Map<int, String>>> getGenres() async {
    http.Response res = await _movieService.getGenres();
    return res.statusCode == api_successful_response_code
        ? SuccessState<Map<int,String>>(state: ResponseStatus.DATA, data: Map.fromIterable(jsonDecode(res.body)['genres'], key: (genreMap) => genreMap['id'] as int, value: (genreMap) => genreMap['name'].toString()))
        : FailureState(state: ResponseStatus.ERROR, failure: Failure(res.statusCode, res.body));
  }
}
