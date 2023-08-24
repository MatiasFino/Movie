import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/data_state.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../data_sources/remote/api_const.dart';
import '../data_sources/remote/api_service.dart';
import '../model/model.dart';

class MoviesFromAPI extends MovieRepository {
  final IMovieService movieService;

  const MoviesFromAPI({this.movieService = const MovieServiceImpl()});

  @override
  Future<DataState<List<MovieEntity>>> getMovies(EndPoint endPoint) async {
    http.Response response;
    switch (endPoint) {
      case EndPoint.POPULAR:
        response = await movieService.getPopularMovies();
      case EndPoint.NOW_PLAYING:
        response = await movieService.getNowPlayingMovies();
      case EndPoint.TOP_RATED:
        response = await movieService.getTopRatedMovies();
      case EndPoint.UPCOMING:
        response = await movieService.getUpComingMovies();
    }

    return response.statusCode == api_successful_response_code
        ? SuccessState(
            state: ResponseStatus.DATA,
            data: List.from(
              jsonDecode(response.body)['results']
                  .map((jsonMovie) => MovieModel.fromJson(jsonMovie)),
            )
                .map(
                  (movieModel) => MovieEntity(
                    adult: movieModel.adult,
                    backdrop: movieModel.backdrop,
                    genres: movieModel.genres,
                    id: movieModel.id,
                    originalLanguage: movieModel.originalLanguage,
                    originalTitle: movieModel.originalTitle,
                    overview: movieModel.overview,
                    popularity: movieModel.popularity,
                    poster: movieModel.poster,
                    releaseDate: movieModel.releaseDate,
                    title: movieModel.title,
                    video: movieModel.video,
                    voteAverage: movieModel.voteAverage,
                    voteCount: movieModel.voteCount,
                  ),
                )
                .toList(),
          )
        : FailureState(
            state: ResponseStatus.ERROR,
            failure: Failure(
              response.statusCode,
              response.body,
            ),
          );
  }
}
