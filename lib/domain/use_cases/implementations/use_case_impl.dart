import '../../../data/repository/genres_from_api.dart';
import '../../../data/repository/movies_from_api.dart';
import '../../entity/movie.dart';
import '../../repository/i_genre_repository.dart';
import '../../repository/i_movie_repository.dart';
import '../use_case_interface.dart';

class UseCases with GetGenreUseCase, GetMoviesUseCase {
  final MovieRepository repository;
  final GenresRepository genresRepository;

  const UseCases({
    this.repository = const MoviesFromAPI(),
    this.genresRepository = const GenresFromAPI(),
  });

  @override
  Future<EitherMovieAPI<Map<int, String>>> fetchGenres() {
    return genresRepository.getGenres();
  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> fetchMoviesByCategory(
      EndPoint endPoint) {
    return repository.getMovies(endPoint);
  }
}
