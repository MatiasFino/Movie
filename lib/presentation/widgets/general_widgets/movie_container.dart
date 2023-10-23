import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../../domain/entity/movie.dart';

abstract class MovieListContainer extends StatefulWidget {
  final MovieEntity movie;
  final List<String> movieGenres;
  final Image image;

  const MovieListContainer({
    required this.image,
    required this.movie,
    required this.movieGenres,
  });

  @override
  State<StatefulWidget> createState() => _MovieListContainerState();
}

class _MovieListContainerState extends State<MovieListContainer>
    with SingleTickerProviderStateMixin {

  static const int animationDuration = 500;
  static const int animationSizeMultiplier = 100;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: animationDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: widget.image,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: animationSizeMultiplier * _animationController.value,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRouter.movieView,
          arguments: MovieUI(
            movie: widget.movie,
            genres: widget.movieGenres,
          ),
        );
      },
      onDoubleTap: () {
        _animationController.forward().then((_) {
          _animationController.reverse();
        });
        setState(() {
          widget.movie.addLike();
        });
      },
    );
  }
}

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

enum MovieContainerType {
  BASIC,
  WIDE,
}
