import 'package:flutter/material.dart';

import '../../../core/utils/ui_constants/keys.dart';

class SaveMovieButton extends StatefulWidget {
  const SaveMovieButton({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveMovieButton> {
  static bool _saved = false;

  static const Icon filledIcon = Icon(
    key: saveMovieButtonFilledIconKey,
    Icons.bookmark,
    color: Colors.white,
  );

  static const Icon hollowIcon = Icon(
    key: saveMovieButtonHollowIconKey,
    Icons.bookmark_border,
    color: Colors.white,
  );

  void save() {
    _saved = !_saved;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => save(),
      icon: _saved == false ? filledIcon : hollowIcon,
    );
  }
}
