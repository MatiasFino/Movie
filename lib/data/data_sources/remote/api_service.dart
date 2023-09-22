import 'package:http/http.dart';

import 'api_const.dart';

class MovieService {
  static Future<Response> getNowPlayingMovies() async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$API_NOW_PLAYING_PATH?$API_KEY',
        ),
      );

  static Future<Response> getPopularMovies() async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$API_POPULAR_MOVIES_PATH?$API_KEY',
        ),
      );

  static Future<Response> getTopRatedMovies() async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$API_TOP_RATED_PATH/?$API_KEY',
        ),
      );

  static Future<Response> getUpComingMovies() async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$API_UPCOMING_PATH/?$API_KEY',
        ),
      );

  static Future<Response> getGenres() async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_GENRE_PATH/$API_MOVIE_PATH/$API_LIST_PATH?$API_KEY',
        ),
      );

  static Future<Response> getSimilarMovies(int id) async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$id/$API_SIMILAR_PATH?$API_KEY',
        ),
      );

  static Future<Response> getRecommendedMovies(int id) async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$id/$API_RECOMMENDATIONS_PATH?$API_KEY',
        ),
      );

  static Future<Response> getMovieById(int id) async => get(
        Uri.parse(
          '$API_BASE_URL/$API_THIRD_VERSION_PATH/$API_MOVIE_PATH/$id?$API_KEY',
        ),
      );
}
