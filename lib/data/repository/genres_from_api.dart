import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/repository/i_genre_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/remote/api_service.dart';

class GenresFromAPI implements GenresRepository {
  late final Map<int, String> genres;
  final MovieService _movieService = Get.put(APIMovieServiceImpl());

  @override
  EitherMovieAPI<String> getGenre(int id) {
    return genres.containsKey(id)
        ? left(Failure(-1, 'no such genre id'))
        : right(genres[id]!);
  }

  @override
  Future<EitherMovieAPI<Map<int, String>>> getGenres() async {
    http.Response res = await _movieService.getGenres();
    return res.statusCode == 200
        ? right(genres = Map.fromIterable(jsonDecode(res.body)['genres'], key: (genreMap) => genreMap['id'] as int, value: (genreMap) => genreMap['name'].toString()))
        : left(Failure(res.statusCode, res.body));
  }
}
