import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_projects/data/repository/movies_from_api.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/domain/repository/i_movie_repository.dart';
import 'package:flutter_projects/domain/repository/service/i_movie_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockMovieService extends Mock implements MovieService {}

void main() {
  group('MoviesFromAPI Tests', () {
    late MoviesFromAPI moviesFromAPI;
    late MockMovieService mockMovieService;

    setUp(() {
      mockMovieService = MockMovieService();
      moviesFromAPI = MoviesFromAPI(movieService: mockMovieService);
    });

    final expectedMovie = MovieEntity(
      id: 912,
      adult: true,
      backdrop: "Gonzalo Martinez",
      genres: [9, 12, 18],
      originalLanguage: "es",
      originalTitle: "Muerte en Madrid",
      overview:
          "River Asesina a su maximo rival en una final de libertadores unica en la historia que determina quien es mas grande, de manera permanente e irrebocable",
      popularity: 10,
      poster: "Javier Pinola",
      releaseDate: DateTime(2018, 09, 12),
      video: false,
      voteAverage: 10.0,
      voteCount: 91218,
      title: "River Campeon",
    );

    final jsonExpectedMovie = {
      "id": 912,
      "adult": true,
      "backdrop_path": "Gonzalo Martinez",
      "genre_ids": [9, 12, 18],
      "original_language": "es",
      "original_title": "Muerte en Madrid",
      "overview":
          "River Asesina a su maximo rival en una final de libertadores unica en la historia que determina quien es mas grande, de manera permanente e irrebocable",
      "popularity": 10.0,
      "poster_path": "Javier Pinola",
      "release_date": "2018-12-09",
      "video": false,
      "vote_average": 10.0,
      "vote_count": 91218,
      "title": "River Campeon",
    };

    test('getMovies returns a list of MovieEntity on success', () async {
      // Arrange
      const endPoint = EndPoint.POPULAR;
      final mockResponse = http.Response(
        jsonEncode({
          "results": [jsonExpectedMovie]
        }),
        200,
      );
      when(() => mockMovieService.getPopularMovies())
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await moviesFromAPI.getMovies(endPoint);

      // Assert
      expect(result, isA<Right>());
      late final rightAnswer;
      final movies = result.fold(
        (error) {
          fail('Expected success, but got error: $error');
        },
        (movies) {
          expect(movies, [expectedMovie]);
          expect(movies, hasLength(1));
          expect(movies[0].id, 912);
        },
      );
    });

    test('getMovies returns a Failure on failure', () async {
      // Arrange
      const endPoint = EndPoint.POPULAR;
      final mockResponse = http.Response('Error message', 404);
      when(() => mockMovieService.getPopularMovies())
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await moviesFromAPI.getMovies(endPoint);

      // Assert
      expect(result, isA<Left>());
    });
  });
}
