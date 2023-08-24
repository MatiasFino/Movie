import 'package:flutter/material.dart';
import '../ui_constants/text_styles.dart';

class WidgetedGenres extends StatelessWidget {
  final List<String> genres;

  const WidgetedGenres(
    this.genres, {
    super.key,
  });

  static const double genresWordLeftPadding = 20;

  List<Widget> _createWidgets() {
    return genres
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(left: genresWordLeftPadding),
            child: Text(
              e,
              style: MovieTextStyles.genresTextStyle,
            ),
          ),
        )
        .toList();
  }

  @override
  build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _createWidgets(),
    );
  }
}
