import 'package:flutter/material.dart';
import '../../../core/utils/ui_constants/text_styles.dart';
import '../general_widgets/genres.dart';
import '../general_widgets/stars.dart';

class MovieRowPreview extends StatelessWidget {
  final String moviePoster;
  final String movieTitle;
  final double voteAverage;
  final List<String> genres;

  static const double generalPadding = 15;
  static const double genresBoxWidth = 225;
  static const double genresBoxHeight = 20;
  static const double imageBoxWidth = 100;
  static const double imageBoxHeight = 150;

  const MovieRowPreview({
    required this.moviePoster,
    required this.movieTitle,
    required this.voteAverage,
    required this.genres,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: imageBoxWidth,
          height: imageBoxHeight,
          child: Image.network(moviePoster),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: generalPadding),
                child: Text(
                  movieTitle,
                  textAlign: TextAlign.center,
                  style: MovieTextStyles.moviePreviewTitleTextStyle,
                ),
              ),
              Text(voteAverage.toString()),
              Padding(
                padding: const EdgeInsets.only(bottom: generalPadding),
                child: Stars(voteAverage),
              ),
              Center(
                child: SizedBox(
                  width: genresBoxWidth,
                  height: genresBoxHeight,
                  child: GenresToScrollableList(
                    genres: genres,
                    style: MovieTextStyles.genresPreviewTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
