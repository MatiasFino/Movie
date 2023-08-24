import 'package:flutter/material.dart';
import '../../core/utils/ui_constants/text_styles.dart';
import '../widgets/general_widgets/genres.dart';
import '../../domain/entity/movie.dart';
import '../widgets/movie_presentation/top_row.dart';

class MovieMainWidget extends StatelessWidget {
  const MovieMainWidget({
    super.key,
  });

  static const double topRowTopPadding = 150;
  static const double topRowLeftPadding = 10;
  static const double movieGenresPadding = 30;
  static const double largeTopPadding = 35;
  static const double genresSizeBoxHeight = 25;
  static const double appBarElevation = 0;

  @override
  Widget build(BuildContext context) {
    final MovieUI movieUI =
        ModalRoute.of(context)?.settings.arguments as MovieUI;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: appBarElevation,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.network(movieUI.movie.backdropUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: topRowTopPadding,
                  left: topRowLeftPadding,
                ),
                child: TopRow(
                  likes: movieUI.movie.likes,
                  poster: movieUI.movie.posterUrl,
                  voteAverage: movieUI.movie.voteAverage,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: movieGenresPadding),
            child: SizedBox(
              height: genresSizeBoxHeight,
              child: GenresToScrollableList(
                genres: movieUI.genres,
                style: MovieTextStyles.movieTitleTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: largeTopPadding),
            child: Text(movieUI.movie.title),
          ),
          Text(
            movieUI.movie.formattedReleaseDate,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: largeTopPadding),
            child: Text(
              movieUI.movie.overview,
              style: MovieTextStyles.overviewTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
