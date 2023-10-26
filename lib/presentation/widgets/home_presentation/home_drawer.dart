import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../../core/utils/ui_constants/keys.dart';
import '../../../core/utils/ui_constants/strings.dart';
import '../../../domain/use_cases/use_case_interface.dart';

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
            title: const Text(HomeTitle),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                MyRouter.homeView,
              );
            },
          ),
          ListTile(key: nowPlayingTailKey,
            title: const Text(NowPlayingTitle),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                MyRouter.movieGrid,
                arguments: EndPoint.NOW_PLAYING,
              );
            },
          ),
          ListTile(key: popularTailKey,
            title: const Text(PopularTitle),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                MyRouter.movieGrid,
                arguments: EndPoint.POPULAR,
              );
            },
          ),
          ListTile(key: topRatedTailKey,
            title: const Text(TopRatedTitle),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                MyRouter.movieGrid,
                arguments: EndPoint.TOP_RATED,
              );
            },
          ),
          ListTile(key:upcomingTailKey,
            title: const Text(UpcomingTitle),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                MyRouter.movieGrid,
                arguments: EndPoint.UPCOMING,
              );
            },
          ),
        ],
      ),
    );
  }
}
