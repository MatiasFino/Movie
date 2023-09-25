import 'package:flutter/material.dart';
import '../../config/routes/router.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_impl.dart';

class MovieGridView extends StatefulWidget {
  MovieGridView({super.key});

  final Bloc bloc = BlocImpl();

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  void initState() {
    widget.bloc.fetchNowPlayingMovies();
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
            stream: widget.bloc.movieStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                widget.bloc.fetchNowPlayingMovies();
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
                              snapshot.data![index].genres
                                  .map(
                                    (genreId) => widget.bloc.getGenre(genreId),
                                  )
                                  .toList(),
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
