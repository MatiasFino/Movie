import '../../domain/entity/movie.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required adult,
    required backdrop,
    required genres,
    required id,
    required originalLanguage,
    required originalTitle,
    required overview,
    required popularity,
    required poster,
    required releaseDate,
    required title,
    required video,
    required voteAverage,
    required voteCount,
  }) : super(
          adult: adult,
          backdrop: backdrop,
          genres: genres,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          poster: poster,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json['adult'],
        backdrop: json['backdrop_path'],
        genres: json['genre_ids'].cast<int>(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster: json['poster_path'],
        releaseDate: DateTime.parse(json['release_date']),
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}
