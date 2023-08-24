import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/utils/data_state.dart';
import 'package:flutter_projects/data/repository/movies_from_api.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/domain/repository/service/i_movie_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockMovieService extends Mock implements IMovieService {}

void main() {
  group('MoviesFromAPI Tests', () {
    late MoviesFromAPI moviesFromAPI;
    late MockMovieService mockMovieService;

    setUp(() {
      mockMovieService = MockMovieService();
      moviesFromAPI = MoviesFromAPI(movieService: mockMovieService);
    });

    final expectedMovie = MovieEntity.defaultMovie();

    final jsonExpectedMovie = {
      "id": 1,
      "adult": false,
      "backdrop_path": "9n2tJBplPbgR2ca05hS5CKXwP2c.jpg",
      "genre_ids": [
        12,
        14,
        16,
        36,
      ],
      "original_language": "en",
      "original_title": "The Super Mario Bros. Movie",
      "overview":
          "While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported down a mysterious pipe and "
              "wander into a magical new world. But when the brothers are separated"
              "Mario embarks on an epic quest to find Luigi.",
      "popularity": 10.0,
      "poster_path": "qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
      "release_date": "2023-04-05",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 100,
      "title": "The Super Mario Bros. Movie",
    };

    test('getMovies returns a list of MovieEntity on success', () async {
      const endPoint = EndPoint.POPULAR;
      final mockResponse = http.Response(
        jsonEncode(
          {
            "results": [jsonExpectedMovie],
          },
        ),
        200,
      );

      when(() => mockMovieService.getPopularMovies())
          .thenAnswer((_) async => mockResponse);

      final DataState<List<MovieEntity>> result = await moviesFromAPI.getMovies(endPoint);

      if (result.state == ResponseStatus.ERROR){
          fail('Expected success, but got error: ${result.failure}');
        } else
          expect(result.data, [expectedMovie]);
          expect(result.data, hasLength(1));
          expect(result.data![0].id, expectedMovie.id);
    });

    test('getMovies returns a Failure on failure', () async {
      const endPoint = EndPoint.POPULAR;
      final mockResponse = http.Response('Error message', 404);
      when(() => mockMovieService.getPopularMovies())
          .thenAnswer((_) async => mockResponse);


    });
  });
}
