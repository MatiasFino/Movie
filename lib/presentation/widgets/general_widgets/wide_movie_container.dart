import 'package:flutter/material.dart';

import 'movie_container.dart';

class WideContainer extends MovieListContainer {

  WideContainer({
    required super.movie,
    required super.movieGenres,
  }) : super(
    image: Image.network(movie.backdropUrl),
  );
}
