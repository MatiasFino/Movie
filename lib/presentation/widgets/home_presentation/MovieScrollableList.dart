import 'package:flutter/material.dart';

import '../../../core/utils/ui_constants/keys.dart';
import '../../../core/utils/ui_constants/strings.dart';
import '../../../core/utils/ui_constants/text_styles.dart';
import '../../../domain/use_cases/use_case_interface.dart';
import '../../bloc/bloc.dart';
import '../general_widgets/movie_container.dart';
import 'home_page_view.dart';

class MovieScrollableList extends StatelessWidget {
  static const double generalPadding = 15;
  static const double basicContainerWidth = 400;
  static const double largeContainerHeight = 600;
  static const double lilContainerWidth = 243;

  MovieScrollableList({
    required this.bloc,
    this.movieContainerType = MovieContainerType.BASIC,
    this.movieCategory = EndPoint.POPULAR,
  });

  final Bloc bloc;
  final MovieContainerType movieContainerType;
  final EndPoint movieCategory;

  @override
  late final Key key = movieCategory == EndPoint.TOP_RATED
      ? homePageViewTopRatedKey
      : movieCategory == EndPoint.UPCOMING
          ? homePageViewUpcomingKey
          : movieCategory == EndPoint.NOW_PLAYING
              ? homePageViewNowPlayingKey
              : homePageViewPopularKey;

  late final String title = movieCategory == EndPoint.TOP_RATED
      ? TopRatedTitle
      : movieCategory == EndPoint.UPCOMING
          ? UpcomingTitle
          : movieCategory == EndPoint.NOW_PLAYING
              ? NowPlayingTitle
              : PopularTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: generalPadding),
          child: Center(
            child: Text(
              title,
              style: MovieTextStyles.categoriesTextStyle,
            ),
          ),
        ),
        Container(
          width: basicContainerWidth,
          height: largeContainerHeight,
          child: MoviePageView(
            key: key,
            bloc: bloc,
            movieCategory: movieCategory,
            containerType: movieContainerType,
          ),
        ),
      ],
    );
  }
}
