import 'dart:convert';
import 'package:flutter/services.dart';

import '../i_movie_repository.dart';
import '../../../data_classes/movie.dart';

class MoviesFromJson extends MovieRepository {
  static const moviesPath = 'jsonData/movies.json';
  List<Movie> parsedMovies = [];

  static Future<List<Movie>> parseMovies() async {
    final jsonPath = await rootBundle.loadString(moviesPath);
    return List.from(
        jsonDecode(jsonPath).map((movie) => Movie.fromJson(movie)));
  }

  @override
  Future<List<Movie>> getMovies() async {
    if (parsedMovies.isEmpty) {
      parsedMovies = await parseMovies();
    }
    return parsedMovies;
  }

  @override
  Future<Movie> getMovieById(int id) async {
    if (parsedMovies.isEmpty) {
      parsedMovies = await parseMovies();
    }
    return parsedMovies.where((element) => element.id == id).first;
  }
}
