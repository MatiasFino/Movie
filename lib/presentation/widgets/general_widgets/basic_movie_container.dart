import 'package:flutter/material.dart';

import 'movie_container.dart';

class BasicMovieContainer extends MovieListContainer {
  final double standardMovieContainerHeight = 600;
  final double standardMovieContainerWidth = 400;

  BasicMovieContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
    image: Image.network(movie.posterUrl),
  );
}
