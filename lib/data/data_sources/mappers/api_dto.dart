import '../../../domain/entity/movie.dart';
import '../../model/model.dart';

class ApiDTO {
  static MovieEntity toMovieEntity(MovieModel movieModel) {
    return MovieEntity(
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
    );
  }
    static MovieModel toMovieModel(MovieEntity movieEntity) {
      return MovieModel(
        adult: movieEntity.adult,
        backdrop: movieEntity.backdrop,
        genres: movieEntity.genres,
        id: movieEntity.id,
        originalLanguage: movieEntity.originalLanguage,
        originalTitle: movieEntity.originalTitle,
        overview: movieEntity.overview,
        popularity: movieEntity.popularity,
        poster: movieEntity.poster,
        releaseDate: movieEntity.releaseDate,
        title: movieEntity.title,
        video: movieEntity.video,
        voteAverage: movieEntity.voteAverage,
        voteCount: movieEntity.voteCount,
      );
  }
}
