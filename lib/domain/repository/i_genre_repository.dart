import '../../core/utils/data_state.dart';

abstract class GenresRepository {
  const GenresRepository();
  Future<DataState<Map<int,String>>> getGenres();
}
