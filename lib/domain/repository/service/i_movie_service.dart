import 'package:http/http.dart';

abstract class IMovieService{
   Future<Response> getNowPlayingMovies();
   Future<Response> getPopularMovies();
   Future<Response> getTopRatedMovies();
   Future<Response> getUpComingMovies();
   Future<Response> getGenres();
}
