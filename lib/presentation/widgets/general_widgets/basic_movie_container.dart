import 'package:flutter/material.dart';

import 'movie_container.dart';

class BasicMovieContainer extends MovieListContainer {

  BasicMovieContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
    image: Image.network(movie.posterUrl),
  );
}
