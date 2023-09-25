import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../domain/use_cases/use_case_interface.dart';
import '../data_sources/mappers/api_dto.dart';
import '../data_sources/remote/api_service.dart';
import '../model/model.dart';

class MoviesFromAPI extends MovieRepository {
  @override
  Future<EitherMovie<MovieEntity>> getMovieById(int id) async {
    Response res = await MovieService.getMovieById(id);
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
  Future<EitherMovie<List<MovieEntity>>> getMovies(EndPoint endPoint) async {
    Response res;
    switch (endPoint) {
      case EndPoint.POPULAR:
        res = await MovieService.getPopularMovies();
      case EndPoint.NOW_PLAYING:
        res = await MovieService.getNowPlayingMovies();
      case EndPoint.TOP_RATED:
        res = await MovieService.getTopRatedMovies();
      case EndPoint.UPCOMING:
        res = await MovieService.getUpComingMovies();
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
