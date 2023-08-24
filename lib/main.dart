import 'package:flutter/material.dart';
import 'package:flutter_projects/routes/movie_list.dart';
import 'routes/movie_main_widget.dart';
import '/constants/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const double appBarElevation = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: MyRouter.movieList,
        routes: {
          MyRouter.movieList: (context) => const MovieList(),
          MyRouter.movieView: (context) => const MovieMainWidget(),
        },
      ),
    );
  }
}
