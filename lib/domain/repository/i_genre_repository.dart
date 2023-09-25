import '../use_cases/use_case_interface.dart';

abstract class GenresRepository {
  EitherMovieAPI<String> getGenre(int id);

  Future<EitherMovieAPI<Map<int,String>>> getGenres();
}
