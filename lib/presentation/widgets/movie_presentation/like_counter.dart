import 'package:flutter/material.dart';

class LikeCounter extends StatefulWidget {
  int likes;

  LikeCounter(
    this.likes, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LikeCounterWidgetState();
}

class _LikeCounterWidgetState extends State<LikeCounter> {
  static const double iconSize = 30;
  static const Icon _icon = Icon(
    Icons.favorite,
    color: Colors.white,
    size: iconSize,
  );

  void add() {
    widget.likes++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        IconButton(
          onPressed: () => add(),
          icon: _icon,
        ),
        Text(
          '${widget.likes}',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
