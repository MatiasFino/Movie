import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/mappers/api_dto.dart';
import '../data_sources/remote/api_const.dart';
import '../data_sources/remote/api_service.dart';
import '../model/model.dart';

class MoviesFromAPI extends MovieRepository {
  final IMovieService movieService;
  const MoviesFromAPI({this.movieService = const MovieServiceImpl()});

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> getMovies(EndPoint endPoint) async {
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
        ? Right(
            List.from(
              jsonDecode(response.body)['results']
                  .map((jsonMovie) => MovieModel.fromJson(jsonMovie)),
            ).map((movieModel) => ApiDTO.toMovieEntity(movieModel)).toList(),
          )
        : Left(
            Failure(
              response.statusCode,
              response.body,
            ),
          );
  }
}
