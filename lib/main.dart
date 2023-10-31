import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/bloc/bloc.dart';
import 'presentation/bloc/bloc_impl.dart';
import 'presentation/view/movie_grid_view.dart';
import 'presentation/view/home.dart';
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
      child: Provider(
        create: (_) => BlocImpl(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
          theme: ThemeData.dark(),
          initialRoute: Navigator.defaultRouteName,
          routes: {
            MyRouter.movieGrid: (_) => MovieGridView(bloc: Provider.of<BlocImpl>(_)),
            MyRouter.movieView: (context) => const MovieMainWidget(),
          },
        ),
      ),
    );
  }
}
