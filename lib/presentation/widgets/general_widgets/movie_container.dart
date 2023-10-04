import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../../domain/entity/movie.dart';

abstract class MovieListContainer extends StatelessWidget {
  final MovieEntity movie;
  final List<String> movieGenres;
  final Image image;

  MovieListContainer({
    required this.image,
    required this.movie,
    required this.movieGenres,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        child: this.image,
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

class BasicMovieContainer extends MovieListContainer {
  static const double standardMovieContainerHeight = 600;
  static const double standardMovieContainerWidth = 400;

  BasicMovieContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
          image: Image.network(movie.posterUrl),
        );

  @override
  Widget build(BuildContext context) {

    return Container(
      height: standardMovieContainerHeight,
      width: standardMovieContainerWidth,
      child: super.build(context),
    );
  }
}

class WideContainer extends MovieListContainer {

  static const double wideMovieContainerHeight = 230;
  static const double wideMovieContainerWidth = 300;

  WideContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
          image: Image.network(movie.backdropUrl),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: wideMovieContainerHeight,
      width: wideMovieContainerWidth,
      child: super.build(context),
    );
  }
}

enum MovieContainerType {
  BASIC,
  WIDE,
}
