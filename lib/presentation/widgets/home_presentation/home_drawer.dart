import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
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
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.homeView,
              );
            },
          ),
          ListTile(
            title: const Text('Now Playing'),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.NOW_PLAYING,
              );
            },
          ),
          ListTile(
            title: const Text('Popular'),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.POPULAR,
              );
            },
          ),
          ListTile(
            title: const Text('Top Rated'),
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRouter.movieGrid,
                arguments: MovieCategory.POPULAR,
              );
            },
          ),
          ListTile(
            title: const Text('Upcoming'),
            onTap: () {
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
