import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/repository/i_genre_repository.dart';

class GenresFromJson implements GenresRepository {
  late Map<int, String> genresById = {};
  static const String genresPath = 'jsonData/genres.json';

  @override
  Future<String?> getGenre(int id) async {
    if (genresById.isEmpty) {
      genresById = await parseJsonGenres();
    }
    return genresById[id];
  }

  static Future<Map<int, String>> parseJsonGenres() async {
    var jsonPath = await rootBundle.loadString(genresPath);
    Map<String, dynamic> json = jsonDecode(jsonPath);
    return {
      for (var genre in json['genres']) genre['id'] as int: genre['name']
    };
  }

  @override
  Future<Map<int, String>> getGenres() async {
    if (genresById.isEmpty) {
      genresById = await parseJsonGenres();
    }
    return genresById;
  }
}
