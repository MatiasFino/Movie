import 'package:flutter/material.dart';

class GenresToScrollableList extends StatelessWidget {
  final List<String> genres;
  final TextStyle style;

  const GenresToScrollableList({
    required this.style,
    required this.genres,
    super.key,
  });

  static const double genresWordLeftPadding = 20;

  List<Widget> _createGenresList() {
    return genres
        .map(
          (genre) => Padding(
            padding: const EdgeInsets.only(left: genresWordLeftPadding),
            child: Text(
              genre.toString(),
              style: style,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: _createGenresList(),
    );
  }
}
