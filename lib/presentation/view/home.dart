import 'package:flutter/material.dart';

import '../widgets/home_presentation/home_drawer.dart';
import '../widgets/home_presentation/home_page_view_display.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const HomeDrawer(),
      body: HomePageViewDisplay(),
    );
  }
}

enum MovieCategory {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}
