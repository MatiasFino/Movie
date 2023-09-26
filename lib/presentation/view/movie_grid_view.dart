import 'dart:js';

import 'package:flutter/material.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_impl.dart';
import '../widgets/home_presentation/movie_container.dart';
import 'home.dart';

class MovieGridView extends StatefulWidget {

  MovieGridView({super.key, required this.movieCategory});

  final Bloc bloc = BlocImpl();
  final MovieCategory movieCategory;

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  late final String appBarTitle;

  @override
  void initState() {
    super.initState();
    switch (widget.movieCategory) {
      case MovieCategory.UPCOMING:
        {
          appBarTitle = "Upcoming Movies";
          widget.bloc.fetchUpcomingMovies();
        }
      case MovieCategory.NOW_PLAYING:
        appBarTitle = "Now Playing Movies";
        widget.bloc.fetchNowPlayingMovies();
      case MovieCategory.TOP_RATED:
        appBarTitle = "Top Rated Movies";
        widget.bloc.fetchTopRatedMovies();
      case MovieCategory.POPULAR:
        appBarTitle = "Popular";
        widget.bloc.fetchPopularMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Center(
        child: StreamBuilder<List<MovieEntity>>(
          stream: widget.bloc.movieStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return BasicMovieContainer(
                    //padding: const EdgeInsets.all(5),
                    movie: snapshot.data![index],
                    movieGenres: snapshot.data![index].genres
                        .map(
                          (genreId) => widget.bloc.getGenre(genreId),
                        )
                        .toList(),
                    // child: InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       MyRouter.movieView,
                    //       arguments: MovieUI(
                    //         snapshot.data![index],
                    //         snapshot.data![index].genres
                    //             .map(
                    //               (genreId) => widget.bloc.getGenre(genreId),
                    //             )
                    //             .toList(),
                    //       ),
                    //     );
                    //   },
                    //     child: Image.network(
                    //       snapshot.data![index].posterUrl,
                    //     ),
                    //   ),
                    // );
                    // },
                  );
                },
              );
            }
          },
        )
        // ),
        ,
      ),
    );
  }
}
