import '../../core/utils/data_state.dart';
import '../entity/movie.dart';

mixin GetMoviesUseCase {
  Future<DataState<List<MovieEntity>>> fetchMoviesByCategory(EndPoint endpoint);
}

mixin GetGenreUseCase {
  Future<DataState<Map<int, String>>> fetchGenres();
}


