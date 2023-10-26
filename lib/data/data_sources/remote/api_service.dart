
import 'package:http/http.dart';
import '../../../domain/repository/service/i_movie_service.dart';
import 'api_const.dart';

class MovieServiceImpl implements IMovieService {

  const MovieServiceImpl();


  @override
  Future<Response> getNowPlayingMovies() async => get(
        Uri.parse(
          '$api_base_url/$api_movie_path/$api_now_playing_path?$api_key',
        ),
      );

  @override
  Future<Response> getPopularMovies() async => get(
        Uri.parse(
          '$api_base_url/$api_movie_path/$api_popular_movies_path?$api_key',
        ),
      );

  @override
  Future<Response> getTopRatedMovies() async => get(
        Uri.parse(
          '$api_base_url/$api_movie_path/$api_top_rated_path/?$api_key',
        ),
      );

  @override
  Future<Response> getUpComingMovies() async => get(
        Uri.parse(
          '$api_base_url/$api_movie_path/$api_upcoming_path/?$api_key',
        ),
      );

  @override
  Future<Response> getGenres() async =>
   get(
        Uri.parse(
          '$api_base_url/$api_genre_path/$api_movie_path/$api_list_path?$api_key',
        ),
      );
}
