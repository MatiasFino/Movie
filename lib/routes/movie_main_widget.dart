import 'package:flutter/material.dart';
import '/ui_constants/text_styles.dart';
import '/custom_widgets/genres.dart';
import '/data_classes/movie.dart';
import '/custom_widgets/movie_title.dart';
import '/custom_widgets/top_row.dart';

class MovieMainWidget extends StatelessWidget {
  const MovieMainWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  static const double topRowTopPadding = 150;
  static const double topRowLeftPadding = 10;
  static const double movieGenresPadding = 30;
  static const double largeTopPadding = 35;
  static const double genresSizeBoxHeight = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.network(movie.backdrop),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: topRowTopPadding,
                left: topRowLeftPadding,
              ),
              child: TopRow(
                likes: movie.likes,
                poster: movie.poster,
                voteAverage: movie.voteAverage,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: movieGenresPadding),
          child: SizedBox(
            height: genresSizeBoxHeight,
            child: WidgetedGenres(movie.genres),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: largeTopPadding),
          child: MovieTitle(movie.title),
        ),
        Text(
          movie.formattedReleaseDate,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: largeTopPadding),
          child: Text(
            movie.overview,
            style: MovieTextStyles.overviewTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
