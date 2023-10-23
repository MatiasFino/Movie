import 'package:http/http.dart';


abstract class MovieService{

   Future<Response> getNowPlayingMovies();
   Future<Response> getPopularMovies();
   Future<Response> getTopRatedMovies();
   Future<Response> getUpComingMovies();
   Future<Response> getGenres();
}
