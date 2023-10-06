import 'package:flutter/material.dart';

import '../../../core/utils/ui_constants/text_styles.dart';
import '../../view/home.dart';
import 'home_page_view.dart';
import '../general_widgets/movie_container.dart';

class HomePageViewDisplay extends StatelessWidget {
  HomePageViewDisplay({
    super.key,
  });

  static const double generalPadding = 15;
  static const double basicContainerWidth = 400;
  static const double largeContainerHeight = 600;
  static const double lilContainerWidth = 243;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: generalPadding),
              child: Center(
                child: Text(
                  'Popular',
                  style: MovieTextStyles.categoriesTextStyle,
                ),
              ),
            ),
            Container(
              width: basicContainerWidth,
              height: largeContainerHeight,
              child: MoviePageView(
                movieCategory: MovieCategory.POPULAR,
                containerType: MovieContainerType.BASIC,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(generalPadding),
              child: Center(
                child: Text(
                  'Now Playing',
                  style: MovieTextStyles.categoriesTextStyle,
                ),
              ),
            ),
            Container(
              width: basicContainerWidth,
              height: lilContainerWidth,
              child: MoviePageView(
                movieCategory: MovieCategory.NOW_PLAYING,
                containerType: MovieContainerType.WIDE,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(generalPadding),
              child: Center(
                child: Text(
                  'Top Rated',
                  style: MovieTextStyles.categoriesTextStyle,
                ),
              ),
            ),
            Container(
              width: basicContainerWidth,
              height: lilContainerWidth,
              child: MoviePageView(
                movieCategory: MovieCategory.TOP_RATED,
                containerType: MovieContainerType.WIDE,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(generalPadding),
              child: Center(
                child: Text(
                  'Upcoming',
                  style: MovieTextStyles.categoriesTextStyle,
                ),
              ),
            ),
            Container(
              width: basicContainerWidth,
              height: largeContainerHeight,
              child: MoviePageView(
                movieCategory: MovieCategory.UPCOMING,
                containerType: MovieContainerType.BASIC,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
