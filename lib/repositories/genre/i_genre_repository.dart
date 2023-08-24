abstract class GenresRepository {
  Future<String?> getGenre(int id);

  Future<Map<int, String>> getGenres();
}
