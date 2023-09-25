import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/repository/service/i_movie_service.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/mappers/api_dto.dart';
import '../data_sources/remote/api_service.dart';
import '../model/model.dart';

class MoviesFromAPI extends MovieRepository {
  final MovieService _movieService = Get.put(APIMovieServiceImpl());

  @override
  Future<EitherMovieAPI<MovieEntity>> getMovieById(int id) async {
    http.Response res = await _movieService.getMovieById(id);
    return res.statusCode == 200
        ? right(
            jsonDecode(res.body)
                .map(
                  (jsonMovie) => MovieModel.fromJson(jsonMovie),
                )
                .map((movie) => ApiDTO.toMovieEntity(movie)),
          )
        : left(
            Failure(
              res.statusCode,
              res.body,
            ),
          );
  }

  @override
  Future<EitherMovieAPI<List<MovieEntity>>> getMovies(EndPoint endPoint) async {
    http.Response res;
    switch (endPoint) {
      case EndPoint.POPULAR:
        res = await _movieService.getPopularMovies();
      case EndPoint.NOW_PLAYING:
        res = await _movieService.getNowPlayingMovies();
      case EndPoint.TOP_RATED:
        res = await _movieService.getTopRatedMovies();
      case EndPoint.UPCOMING:
        res = await _movieService.getUpComingMovies();
    }
    return res.statusCode == 200
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

/*
* Separacion entre Repository / Service
* Tiene sentido tener el de genres? (para mi, no)
* Esta bien servicios estaticos?
* Los servicios, los llamo desde el repositorio o desde los Use cases? Si es desde los use cases, que sentido tiene el repo?
* Mapeo, se hace en la capa data, Tiene sentido tener el Movies fromJson en entity? no seria conveniente sacarlo de la capa data ya mapeado?
* */
