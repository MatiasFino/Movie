import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../domain/repository/i_genre_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/remote/api_const.dart';
import '../data_sources/remote/api_service.dart';

class GenresFromAPI implements GenresRepository {

  final IMovieService _movieService = const MovieServiceImpl();
  const GenresFromAPI();

  @override
  Future<EitherMovieAPI<Map<int, String>>> getGenres() async {
    http.Response res = await _movieService.getGenres();
    return res.statusCode == api_successful_response_code
        ? Right(Map.fromIterable(jsonDecode(res.body)['genres'], key: (genreMap) => genreMap['id'] as int, value: (genreMap) => genreMap['name'].toString()))
        : Left(Failure(res.statusCode, res.body));
  }
}
