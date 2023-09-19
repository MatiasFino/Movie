import 'package:flutter/material.dart';
import 'save_movie_button.dart';
import 'stars.dart';
import '/constants/ui_constants/text_styles.dart';
import 'like_counter.dart';

class TopRow extends StatelessWidget {
  TopRow({
    super.key,
    required this.likes,
    required this.poster,
    required this.voteAverage,
  });

  static const double posterContainerWidth = 170;
  static const double posterContainerHeight = 230;
  static const double buttonsTopPadding = 80;
  static const double buttonsLeftPadding = 15;
  final String poster;
  int likes;
  final double voteAverage;

  static const BoxShadow posterBoxShadow = BoxShadow(
    blurRadius: 18,
    spreadRadius: 0.75,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: posterContainerWidth,
          height: posterContainerHeight,
          decoration: BoxDecoration(
            boxShadow: const [posterBoxShadow],
            image: DecorationImage(
              image: NetworkImage(poster),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: buttonsTopPadding,
            left: buttonsLeftPadding,
          ),
          child: Row(
            children: [
              const SaveMovieButton(),
              LikeCounter(likes),
              Column(
                children: [
                  Text(
                    voteAverage.toString(),
                    style: MovieTextStyles.voteAverageTextStyle,
                  ),
                  Stars(voteAverage),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
