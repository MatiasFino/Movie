import 'package:flutter/material.dart';
import '../../config/routes/router.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_impl.dart';

class MovieGridView extends StatefulWidget {
  MovieGridView({super.key});

  final Bloc movies = BlocImpl();

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  void initState() {
    widget.movies.fetchNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: StreamBuilder<List<MovieEntity>>(
            stream: widget.movies.stream,
            builder: (context, snapshot) {
              // if (snapshot.hasError) {
              //   return const Center(
              //     child: Text('Something went wrong, please try again'),
              //   );
              // } else {
              if (snapshot.connectionState == ConnectionState.waiting) {
                widget.movies.fetchNowPlayingMovies();
                return const CircularProgressIndicator();
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MyRouter.movieView,
                            arguments: MovieUI(
                              snapshot.data![index],
                              ['river'],
                            ),
                          );
                        },
                        child: Image.network(
                          snapshot.data![index].posterUrl,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
