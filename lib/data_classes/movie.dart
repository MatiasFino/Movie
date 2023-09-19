class Movie {
  final bool adult;
  final String backdrop;
  final List<int> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String poster;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  int likes = 0;

  Movie({
    required this.adult,
    required this.backdrop,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.poster,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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

  String get formattedReleaseDate =>
      '${releaseDate.day}/${releaseDate.month}/${releaseDate.year}';

  String get backdropUrl => "https://image.tmdb.org/t/p/w500$backdrop";

  String get posterUrl => "https://image.tmdb.org/t/p/w500$poster";

  void addLike() async => likes++;

  factory Movie.defaultMovie() => Movie(
        adult: false,
        backdrop: "9n2tJBplPbgR2ca05hS5CKXwP2c.jpg",
        genres: [
          12,
          14,
          16,
          36,
        ],
        id: 1,
        originalLanguage: "en",
        originalTitle: "The Super Mario Bros. Movie",
        overview:
            "While working underground to fix a water main, Brooklyn plumbers—and br"
            "others—Mario and Luigi are transported down a mysterious pipe and "
            "wander into a magical new world. But when the brothers are separated"
            "Mario embarks on an epic quest to find Luigi.",
        popularity: 10,
        poster: 'qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
        releaseDate: DateTime.parse('2023-04-05'),
        title: 'The Super Mario Bros. Movie',
        video: false,
        voteAverage: 7.8,
        voteCount: 100,
      );
}

class MovieUI {
  final Movie movie;
  final List<String> genres;

  MovieUI(
    this.movie,
    this.genres,
  );
}
