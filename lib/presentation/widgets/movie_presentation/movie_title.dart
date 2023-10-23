import 'package:flutter/material.dart';

import '../../../core/utils/ui_constants/keys.dart';

class MovieTitle extends StatelessWidget {
  final String movieTitle;

  static const List<Color> colors = [
    Color.fromARGB(255, 229, 37, 33),
    Color.fromARGB(255, 67, 176, 71),
    Color.fromARGB(255, 251, 208, 0),
    Color.fromARGB(255, 4, 156, 216),
  ];

  const MovieTitle({
    required this.movieTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> title = [];
    return RichText(
      key: movieTitleKey,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: title.parseTitle(
          colors,
          movieTitle,
        ),
      ),
    );
  }
}

extension IterableColors on List<Color> {
  static int index = 0;

  Color next() {
    index = index == length - 1 ? 0 : ++index;
    return this[index];
  }
}

extension MarioLetters on List<TextSpan> {
  static const double marioFontSize = 38;

  List<TextSpan> parseTitle(List<Color> c, String movieTitle) {
    List<TextSpan> parsed = [];
    List<TextSpan> currentWord = [];
    if (movieTitle == "The Super Mario Bros. Movie") {
      movieTitle.split('').forEach((letter) {
        if (letter != ' ') {
          currentWord.add(TextSpan(
            text: letter,
            style: TextStyle(
              color: c.next(),
              fontFamily: 'SuperMario256',
              fontSize: marioFontSize,
            ),
          ));
        } else {
          parsed.add(
            TextSpan(
              text: '   ',
              children: currentWord,
            ),
          );
          currentWord = [];
        }
      });
    } else {
      parsed.add(
        TextSpan(
          text: movieTitle,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Trillium Web',
            fontSize: 38,
          ),
        ),
      );
    }
    return parsed;
  }
}
