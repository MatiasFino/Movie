import 'package:flutter/material.dart';

import '../../../core/utils/data_state.dart';
import '../../bloc/bloc_impl.dart';
import '../general_widgets/movie_container_type.dart';
import 'movie_scrollable_list.dart';

class HomePageViewDisplay extends StatelessWidget {
  HomePageViewDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        MovieScrollableList(bloc: BlocImpl()),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.NOW_PLAYING,
          movieContainerType: MovieContainerType.WIDE,
        ),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.TOP_RATED,
          movieContainerType: MovieContainerType.WIDE,
        ),
        MovieScrollableList(
          bloc: BlocImpl(),
          movieCategory: EndPoint.UPCOMING,
        ),
      ],
    );
  }
}
