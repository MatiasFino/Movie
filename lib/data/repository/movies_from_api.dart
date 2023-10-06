import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/mappers/api_dto.dart';
import '../data_sources/remote/api_const.dart';
import '../model/model.dart';

class MoviesFromAPI extends MovieRepository {
  final MovieService movieService;

  MoviesFromAPI({required this.movieService});

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> getMovies(EndPoint endPoint) async {
    http.Response res;
    switch (endPoint) {
      case EndPoint.POPULAR:
        res = await movieService.getPopularMovies();
      case EndPoint.NOW_PLAYING:
        res = await movieService.getNowPlayingMovies();
      case EndPoint.TOP_RATED:
        res = await movieService.getTopRatedMovies();
      case EndPoint.UPCOMING:
        res = await movieService.getUpComingMovies();
    }

    return res.statusCode == API_SUCCESSFUL_RESPONSE_CODE
        ? right(
            List.from(
              jsonDecode(res.body)['results']
                  .map((jsonMovie) => MovieModel.fromJson(jsonMovie)),
            ).map((movieModel) => ApiDTO.toMovieEntity(movieModel)).toList(),
          )
        : left(
            Failure(
              res.statusCode,
              res.body,
            ),
          );
  }
}
