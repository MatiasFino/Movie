import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../../core/utils/ui_constants/keys.dart';
import '../../view/home.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(key: homeTailKey,
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                MyRouter.homeView,
              );
            },
          ),
          ListTile(key: nowPlayingTailKey,
            title: const Text('Now Playing'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.NOW_PLAYING,
              );
            },
          ),
          ListTile(key: popularTailKey,
            title: const Text('Popular'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.POPULAR,
              );
            },
          ),
          ListTile(key: topRatedTailKey,
            title: const Text('Top Rated'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.TOP_RATED,
              );
            },
          ),
          ListTile(key:upcomingTailKey,
            title: const Text('Upcoming'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.UPCOMING,
              );
            },
          ),
        ],
      ),
    );
  }
}
