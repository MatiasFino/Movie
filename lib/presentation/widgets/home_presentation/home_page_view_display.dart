import 'package:flutter/material.dart';

import '../../../domain/use_cases/use_case_interface.dart';
import '../../bloc/bloc_impl.dart';
import 'MovieScrollableList.dart';
import '../general_widgets/movie_container.dart';

class HomePageViewDisplay extends StatelessWidget {
  HomePageViewDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        MovieScrollableList(
          bloc: BlocImpl(),
          movieContainerType: MovieContainerType.WIDE,
        ),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.NOW_PLAYING,
          movieContainerType: MovieContainerType.WIDE,
        ),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.TOP_RATED,
        ),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.UPCOMING,
        ),
      ],
    );
  }
}
