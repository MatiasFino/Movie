import '../../../data/repository/genres_from_api.dart';
import '../../../data/repository/movies_from_api.dart';
import '../../entity/movie.dart';
import '../../repository/i_genre_repository.dart';
import '../../repository/i_movie_repository.dart';
import '../use_case_interface.dart';

class UseCases with GetGenreUseCase, GetNowPlayingMoviesUseCase ,GetPopularMoviesUseCase, GetUpcomingMoviesUseCase, GetTopRatedMoviesUseCase {
  final MovieRepository repository; // = Get.put(MoviesFromAPI(movieService: APIMovieServiceImpl()));
  final GenresRepository genresRepository;
  const UseCases({this.repository = const MoviesFromAPI(), this.genresRepository = const GenresFromAPI()});

  @override
  Future<EitherMovieAPI<Map<int,String>>> fetchGenres() {
    return genresRepository.getGenres();
  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> fetchNowPlayingMovies() {
    return repository.getMovies(EndPoint.NOW_PLAYING);
  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> fetchPopularMovies() {
    return repository.getMovies(EndPoint.POPULAR);

  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> fetchTopRatedMovies() {
    return repository.getMovies(EndPoint.TOP_RATED);
  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> fetchUpcomingMovies() {
    return repository.getMovies(EndPoint.UPCOMING);

  }
}




