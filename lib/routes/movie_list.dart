import 'package:flutter/material.dart';
import 'package:flutter_projects/constants/router/router.dart';
import '/data_classes/movie.dart';
import '/custom_widgets/movie_preview.dart';
import '../repositories/movie/i_movie_repository.dart';
import '../repositories/movie/Impl/movie_from_json.dart';
import '../repositories/genre/i_genre_repository.dart';
import '../repositories/genre/Impl/genre_from_json.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<StatefulWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieList> {
  final MovieRepository movieRepository = MoviesFromJson();
  final GenresRepository genresRepository = GenresFromJson();
  late final Future<List<Movie>> movies;

  late final Future<List<MovieUI>> moviesFromRepo;

  Future<List<MovieUI>> getMovies() async {
    List<Movie> movies = await movieRepository.getMovies();
    Map<int, String> genres = await genresRepository.getGenres();
    return movies
        .map(
          (movie) => MovieUI(
            movie,
            movie.genres.map((genreKey) => genres[genreKey]!).toList(),
          ),
        )
        .toList();
  }

  @override
  void initState() {
    moviesFromRepo = getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesFromRepo,
      builder: (
        BuildContext context,
        AsyncSnapshot<dynamic> snapshot,
      ) {
        if (snapshot.hasData) {
          List<MovieUI> allMovies = snapshot.data;
          return ListView.builder(
            itemCount: allMovies.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return Card(
                color: Colors.transparent,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white24)),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      MyRouter.movieView,
                      arguments: allMovies[index],
                    );
                  },
                  child: MovieRowPreview(
                    moviePoster: allMovies[index].movie.posterUrl,
                    movieTitle: allMovies[index].movie.title,
                    voteAverage: allMovies[index].movie.voteAverage,
                    genres: allMovies[index].genres,
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
