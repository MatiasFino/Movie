import '../use_cases/use_case_interface.dart';

abstract class GenresRepository {
  const GenresRepository();
  Future<EitherMovieAPI<Map<int,String>>> getGenres();
}
