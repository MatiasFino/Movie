import 'package:http/http.dart';

abstract class MovieService{

   Future<Response> getNowPlayingMovies();
   Future<Response> getPopularMovies();
   Future<Response> getTopRatedMovies();
   Future<Response> getUpComingMovies();
   Future<Response> getGenres();
   Future<Response> getSimilarMovies(int id);
   Future<Response> getRecommendedMovies(int id);
   Future<Response> getMovieById(int id);
}
