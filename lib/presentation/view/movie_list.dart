import 'package:flutter/material.dart';
import '../../config/routes/router.dart';
import '../../domain/entity/movie.dart';
import '../widgets/movie_list_presentation/movie_preview.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../../data/repository/movie_from_json.dart';
import '../../domain/repository/i_genre_repository.dart';
import '../../data/repository/genre_from_json.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<StatefulWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieList> {
  final MovieRepository movieRepository = MoviesFromJson();
  final GenresRepository genresRepository = GenresFromJson();
  late final Future<List<MovieEntity>> movies;

  late final Future<List<MovieUI>> moviesFromRepo;

  Future<List<MovieUI>> getMovies() async {
    List<MovieEntity> movies = await movieRepository.getMovies();
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
                        MaterialStateProperty.all<Color>(Colors.white24),
                  ),
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
