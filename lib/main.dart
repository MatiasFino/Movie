import 'package:flutter/material.dart';
import 'presentation/view/movie_grid_view.dart';
import 'presentation/view/movie_list.dart';
import 'presentation/view/movie_main_widget.dart';
import 'config/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: MyRouter.movieGrid,
        routes: {
          MyRouter.movieGrid: (context) => MovieGridView(),
          MyRouter.movieView: (context) => const MovieMainWidget(),
        },
      ),
    );
  }
}
