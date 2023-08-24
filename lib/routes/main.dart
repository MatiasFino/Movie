import 'package:flutter/material.dart';
import '/data_classes/movie.dart';
import 'movie_main_widget.dart';

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
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            elevation: appBarElevation,
            backgroundColor: Colors.transparent,
          ),
          body: MovieMainWidget(movie: Movie.defaultMovie()),
        ),
      ),
    );
  }
}
