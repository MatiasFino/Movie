import '../../core/utils/data_state.dart';
import '../entity/movie.dart';

abstract class MovieRepository {

  Future<DataState<List<MovieEntity>>> getMovies(EndPoint endPoint);
  const MovieRepository();
}


