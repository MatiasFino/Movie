import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension IterableColors on List<Color> {
  static int index = 0;

  Color next() {
    index = index == length - 1 ? 0 : ++index;
    return this[index];
  }
}

extension MarioLetters on List<TextSpan> {
  List<TextSpan> parseTitle(List<Color> c, String movieTitle) {
    List<TextSpan> parsed = [];
    String title = movieTitle;
    List<TextSpan> currentWord = [];
    title.split('').forEach((element) {
      if (element != ' ') {
        currentWord.add(TextSpan(
          text: element,
          style: TextStyle(
            color: c.next(),
            fontFamily: 'SuperMario256',
            fontSize: 38,
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
    return parsed;
  }
}

class MovieTitle extends StatelessWidget {
  final String movieTitle;

  static const List<Color> colors = [
    Color.fromARGB(255, 229, 37, 33),
    Color.fromARGB(255, 67, 176, 71),
    Color.fromARGB(255, 251, 208, 0),
    Color.fromARGB(255, 4, 156, 216),
  ];

  const MovieTitle(
    this.movieTitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> p = [];
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: p.parseTitle(
          colors,
          movieTitle,
        ),
      ),
    );
  }
}
