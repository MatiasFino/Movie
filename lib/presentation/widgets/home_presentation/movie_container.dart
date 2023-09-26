import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../../domain/entity/movie.dart';

class MovieListContainer extends StatelessWidget {

  final Widget child;
  final MovieEntity movie;
  final List<String> movieGenres;

  MovieListContainer({
    required this.child,
    required this.movie,
    required this.movieGenres,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        child: this.child,
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRouter.movieView,
          arguments: MovieUI(
            movie,
            movieGenres,
          ),
        );
      },
      onDoubleTap: () {
        movie.addLike();
      },
    );
  }
}

class BasicMovieContainer extends StatelessWidget{

  final MovieEntity movie;
  final List<String> movieGenres;

  static const double standardMovieContainerHeight = 300;

  BasicMovieContainer({
    required this.movie,
    required this.movieGenres,
  });

  @override
  Widget build(BuildContext context) {

    return MovieListContainer(
      movie: movie,
      movieGenres: movieGenres,
      child: Container(
        width: double.infinity,
        height: standardMovieContainerHeight,
        child: Image.network(movie.posterUrl),
      ),
    );
  }
}

class WideContainer extends StatelessWidget{

  final List<String> movieGenres;
  final MovieEntity movie;

  WideContainer({
    required this.movie,
    required this.movieGenres,
    });

  @override
  Widget build(BuildContext context) {
    return MovieListContainer(
      movie: movie,
      movieGenres: movieGenres,
      child: Expanded(child: Image.network(movie.backdropUrl)),
    );
  }
}

enum MovieContainerType {
  BASIC,
  WIDE,
}
