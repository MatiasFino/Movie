import 'package:flutter/material.dart';

import 'movie_container.dart';

class WideContainer extends MovieListContainer {
  final double wideMovieContainerHeight = 230;
  final double wideMovieContainerWidth = 300;

  WideContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
    image: Image.network(movie.backdropUrl),
  );
}
