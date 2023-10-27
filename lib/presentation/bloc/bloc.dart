import '../../core/utils/data_state.dart';
import '../../domain/entity/movie.dart';

abstract class Bloc {
  void dispose();
  void fetchMoviesByCategory(EndPoint endPoint);
  String getGenre(int id);
  Stream<List<MovieEntity>> get movieStream;
}
