import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final double voteAverage;

  static const ratingIcon = Icons.star;

  const Stars(
    this.voteAverage, {
    super.key,
  });

  List<Widget> _filledStars() {
    int filled = (voteAverage / 2).floor();
    double halfFilled = voteAverage / 2 - filled;
    List<Widget> widgets = [];
    double gradientFirstStop = 0;
    switch (halfFilled) {
      case >= 0 && <= 0.15:
        gradientFirstStop = 0;
        break;
      case > 0.15 && <= 0.35:
        gradientFirstStop = 0.15;
        break;
      case > 0.35 && <= 0.65:
        gradientFirstStop = 0.45;
        break;
      case > 0.65:
        gradientFirstStop = 0.6;
    }
    for (int i = 1; i <= filled; i++) {
      widgets.add(const Icon(
        ratingIcon,
        color: Colors.grey,
      ));
    }
    widgets.add(
      ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: const [
              Colors.grey,
              Colors.transparent,
            ],
            stops: [
              gradientFirstStop,
              1,
            ],
          ).createShader(bounds);
        },
        child: const Icon(ratingIcon),
      ),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _filledStars());
  }
}
