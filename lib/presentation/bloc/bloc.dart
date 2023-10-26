import '../../domain/entity/movie.dart';
import '../../domain/use_cases/use_case_interface.dart';

abstract class Bloc {
  void dispose();
  void fetchMoviesByCategory(EndPoint endPoint);
  String getGenre(int id);
  Stream<List<MovieEntity>> get movieStream;
}
