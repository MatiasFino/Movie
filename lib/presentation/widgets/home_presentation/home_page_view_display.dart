import 'package:flutter/material.dart';

import '../../view/home.dart';
import 'home_page_view.dart';
import '../general_widgets/movie_container.dart';

class HomePageViewDisplay extends StatelessWidget {
  HomePageViewDisplay({
    super.key,
  });

  static const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            const Center(
              child: Text(
                'Popular',
                style: style,
              ),
            ),
            Container(
              width: 400,
              height: 600,
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
              padding: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Now Playing',
                  style: style,
                ),
              ),
            ),

            Container(
              width: 400,
              height: 243,
              child:
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: MoviePageView(
                movieCategory: MovieCategory.NOW_PLAYING,
                containerType: MovieContainerType.WIDE,
              ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Center(
              child: Text(
                'Top Rated',
                style: style,
              ),
            ),
            Container(
              width: 400,
              height: 230,
              child: MoviePageView(
                movieCategory: MovieCategory.TOP_RATED,
                containerType: MovieContainerType.WIDE,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Center(
              child: Text(
                'Upcoming',
                style: style,
              ),
            ),
            Container(
              width: 400,
              height: 600,
              child:
                MoviePageView(
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
